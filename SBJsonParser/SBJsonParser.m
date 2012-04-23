/*
 Copyright (C) 2009,2010 Stig Brautaset. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
 
 * Neither the name of the author nor the names of its contributors may be used
   to endorse or promote products derived from this software without specific
   prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 Copyright (C) 2012 Jean-Jacques Dubray. All rights reserved.
 For the implementation of the SBJSonParser API using iOS JSON library
 For the following methods, not part of the SBJSonParser:
 - (NSData *)dataWithObject:(id)json ;
- (NSDictionary *)flatten:(id)json forElement:(NSString *)tag ;
- (NSArray *)findArrayForElement:(NSString *)resultSet andRow:(NSString *)row wrapped:(BOOL)wrapped  in:(NSDictionary *)input ;
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
 
 * Neither the name of the author nor the names of its contributors may be used
   to endorse or promote products derived from this software without specific
   prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "SBJsonParser.h"

@implementation SBJsonParser

@synthesize maxDepth;
@synthesize error;


- (id)init {
    self = [super init];
    if (self)
        self.maxDepth = 512;
    return self;
}

- (void)dealloc {
    [error release];
    [super dealloc];
}

#pragma mark Methods

- (id)objectWithData:(NSData *)data {

    if (!data) {
        self.error = @"Input was 'nil'";
        return nil;
    }
    NSError *parseError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&parseError];

    self.error = [parseError localizedDescription] ;
	return jsonObject;
}

- (id)objectWithString:(NSString *)repr {
	return [self objectWithData:[repr dataUsingEncoding:NSUTF8StringEncoding]];
}

- (id)objectWithString:(NSString*)repr error:(NSError**)error_ {
	id tmp = [self objectWithString:repr];
    if (tmp)
        return tmp;
    
    if (error_) {
		NSDictionary *ui = [NSDictionary dictionaryWithObjectsAndKeys:error, NSLocalizedDescriptionKey, nil];
        *error_ = [NSError errorWithDomain:@"org.brautaset.json.parser.ErrorDomain" code:0 userInfo:ui];
	}
	
    return nil;
}

- (NSData *)dataWithObject:(id)json{
    NSError *err = nil ;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json 
               options:NSJSONWritingPrettyPrinted error:&err];

    return jsonData ;
}

- (NSArray *)findArrayForElement:(NSString *)resultSet andRow:(NSString *)row wrapped:(BOOL)wrapped  in:(id)input {

    if (!input) return nil ;
    if ([input isKindOfClass:[NSArray class]]) {
        if ((resultSet == nil) && (row == nil) ) {
            return input ;
        } else {
            return [self findArrayForElement:resultSet andRow:row wrapped:wrapped in:[input objectAtIndex:0]] ; ;
        }
    } else {
        if ([input isKindOfClass:[NSDictionary class]]) {
            NSEnumerator *keys = [input keyEnumerator];
            NSArray *objects = [keys allObjects] ;
            if ([objects count] > 1) {
                if (wrapped) {
                    NSMutableArray *output = [NSArray arrayWithObject:input] ;
                    return output ;
                } else {
                    if (resultSet != nil) {
                        id valueForElement = [input objectForKey:resultSet] ;
                        return [self findArrayForElement:nil andRow:row wrapped:wrapped in:valueForElement] ;
                    }  else {
                        if (row != nil) {
                            id valueForElement = [input objectForKey:row] ;
                            return [self findArrayForElement:nil andRow:nil wrapped:wrapped in:valueForElement] ;
                        } else {
                            //Return the first array found
                            id element ;
                            while (element = [keys nextObject]) {
                                    if (element != nil) {
                                        id valueForElement = [input objectForKey:element] ;
                                        if ([valueForElement isKindOfClass:[NSArray class]]) {
                                            return valueForElement ;
                                        }
                                    }
                            }
                            return nil ;
                        }
                    }
                }
            } else {
                 return [self findArrayForElement:resultSet andRow:row wrapped:wrapped in:[input objectForKey:[objects objectAtIndex:0]]] ;
            }
        }
    }
    return nil ;

}

- (BOOL) flattenDictionary:(NSDictionary *)input to:(NSMutableDictionary *)output forElement:(NSString *)tag {

    NSEnumerator *keys = [input keyEnumerator];
    id element ; 
    BOOL notEmpty = NO ;
    BOOL mongoDB = NO ;
    
    while (element = [keys nextObject]) {
        if (element != nil) {
            id valueForElement = [input objectForKey:element] ;
            if ([valueForElement isKindOfClass:[NSArray class]]) {
                //Not really supported, would generally require some custom code
                //We just return the first element of the array
                NSArray *a = (NSArray *)valueForElement ;
                if ([a count] > 0) {
                    if (tag != nil) {
                            [output setValue:[a objectAtIndex:0] forKey:[NSString stringWithFormat:@"%@%@",tag, element]];
                        } else [output setValue:[a objectAtIndex:0] forKey:element] ;
                }
            } else {
                if ([valueForElement isKindOfClass:[NSDictionary class]]) {
            		if (tag != nil) {
            			if ([element isEqualToString:tag]) {
                    		notEmpty = [self flattenDictionary:(NSDictionary *)valueForElement to:output forElement:tag] | notEmpty;
            			} else {
                            NSString *oneLevelDeeper = [NSString stringWithFormat:@"%@%@",tag,element] ;
                            notEmpty = [self flattenDictionary:(NSDictionary *)valueForElement to:output forElement:oneLevelDeeper] | notEmpty;
                        }
            		} else {
                    	notEmpty = [self flattenDictionary:(NSDictionary *)valueForElement to:output forElement:element] | notEmpty;
                    }
                } else {
                    //We found is a value, we add it to the  
                    //this a MongoDB specific transformation
                    if ([element isEqualToString:@"$oid"]) { 
                        element = @"_id" ;
                        mongoDB = YES ;
                        [output setValue:valueForElement forKey:element];
                    } else {
                        if (tag != nil) {
                            if ([tag isEqualToString:@"row"]) [output setValue:valueForElement forKey:element] ;
                                else [output setValue:valueForElement forKey:[NSString stringWithFormat:@"%@%@",tag, element]];
                        } else [output setValue:valueForElement forKey:element] ;
                    notEmpty = YES ;
                    }
                }
            }
        }
    }
    return notEmpty ;
}


- (NSArray *)flatten:(id)json forElement:(NSString *)tag {
    
    NSMutableArray *rows = [NSMutableArray arrayWithCapacity:32] ; 
    NSMutableDictionary *jsonRes = [NSMutableDictionary dictionaryWithCapacity:16] ;
    [jsonRes setValue:rows forKey:@"rows"] ;
     
    if ([json isKindOfClass:[NSArray class]]) {
        for( NSDictionary *inputRow in json) {
            NSMutableDictionary *outputRow = [NSMutableDictionary dictionaryWithCapacity:16] ;
            
            if ([self flattenDictionary:inputRow to:outputRow forElement:tag]) {                
                [rows addObject:outputRow] ;
            }
        }
        
    } else {
        NSMutableDictionary *outputRow = [NSMutableDictionary dictionaryWithCapacity:16] ;
         if ([self flattenDictionary:json to:outputRow forElement:tag]) { 
            [rows addObject:outputRow] ;
        } else { 
        	return json ;
        }
    }
    return rows ;
}


@end

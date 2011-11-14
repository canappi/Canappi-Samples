package com.canappi.connector.yp.yhere ;

/****************************************************************************************************

 Disclaimer: IMPORTANT:  This artifact is supplied to you by Convergence Modeling LLC.
 in consideration of your agreement to the following terms, and your use, installation, 
 modification or redistribution of this acceptance constitutes acceptance of these terms.  
 If you do not agree with these terms, please do not use, install, modify or redistribute 
 this Convergence Modeling LLC artifact.
 
 In consideration of your agreement to abide by the following terms, and subject
 to these terms, Convergence Modeling LLC grants you a personal, non-exclusive license, 
 to use, reproduce, modify and redistribute this artifact, with or without
 modifications, in source and/or binary forms. 
 
 Except as expressly stated in this notice, no other rights or licenses, express or implied, 
 are granted by Convergence Modeling LLC herein, including but not limited to any patent rights 
 that may be infringed by your derivative works or by other works in which the Convergence Modeling 
 artifact may be incorporated.
 
 This artifact is provided by Convergence Modeling LLC on an "AS IS" basis. CONVERGENCE MODELING LLC 
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED WARRANTIES OF 
 NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING THE CONVERGENCE 
 MODELING LLC artifact OR ITS USE AND OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL CONVERGENCE MODELING LLC BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR CONSEQUENTIAL 
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
 OR PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR
 DISTRIBUTION OF CONVERGENCE MODELING LLC artifact, HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT 
 (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF CONVERGENCE MODELING LLC HAS BEEN ADVISED OF 
 THE POSSIBILITY OF SUCH DAMAGE.

 
****************************************************************************************************/


import java.util.HashMap;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Set;
import java.lang.reflect.Field;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import android.net.Uri;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import android.app.Activity;
import android.content.Intent;
import android.content.Context;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.KeyEvent;
import android.webkit.WebView;
import android.widget.*;
import android.util.Log;
import android.app.Dialog;

import android.widget.ImageView;



import android.app.DatePickerDialog;
import android.app.TimePickerDialog;

import android.view.LayoutInflater;
import android.view.ViewGroup;

import org.apache.http.impl.client.DefaultHttpClient ;
import java.net.HttpURLConnection;
import java.io.DataOutputStream;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;

import org.xml.sax.InputSource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;



import com.canappi.connector.yp.yhere.R;







public class TheaterView extends Activity { 


	Activity parentController ;
	HashMap theaterViewIds ;
	HashMap theaterViewValues ;
	 
    	// Connection searchTheaters
         
        	 
	// Operation : searchTeathersByZip
	private ArrayList<HashMap> searchTeathersByZipResultSet ;
	private HashMap searchTeathersByZipRow ;
	private Boolean isRoot ;
	private Boolean isRow ;
	private Boolean isColumn ;
	private String currentProperty;
	private String currentElement;
	

	
	String searchlocQueryParameter ;
	
	public String getSearchlocQueryParameter()
    {
        return this.searchlocQueryParameter;
    }

    public void setSearchlocQueryParameter( String s )
    {
        this.searchlocQueryParameter = s;
    }
	String searchTeathersByZipURLString ;


	 
	// Layout : resultsLayout	 
	private ListView resultsListView;	
	ResultsEfficientAdapter resultsAdapter ; 
	 
	private static ArrayList<String> businessNameArray ; 
 
	private static ArrayList<String> latitudeArray ; 
 
	private static ArrayList<String> longitudeArray ; 
 
	private static ArrayList<String> listingIdArray ; 
 
	private static ArrayList<String> phoneArray ; 
 
	private static ArrayList<String> callArray ; 
 
	private static ArrayList<String> streetArray ; 
 
	private static ArrayList<String> cityArray ; 

	
	Boolean isUserDefault ;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.theaterview);
		 
	 
	 
     resultsListView = (ListView) findViewById(R.id.resultsTable);
		viewDidLoad();
		
		Log.i("theaterView", "onCreate() callback method");
		
	}

	public void setParentController(Activity a) {
		parentController = a;
	}
	
	public Activity getParentController() {
		return parentController ;
	}


	




     
         

	public ArrayList<Element> searchTeathersByZip(HashMap<String,String> requestParameters) {
	
		ArrayList<Element> data = new ArrayList<Element>() ;
	

	System.setProperty("http.keepAlive", "false");
	System.setProperty("javax.net.debug","all");
	// _FakeX509TrustManager.allowAllSSL();
	
	//Protocol::: HTTP GET
	StringBuffer query = new StringBuffer();
		
	HttpURLConnection connection = null;
	
	try {
		URL url ;
		
		if (requestParameters != null) 
		{
			String key;
	
	    	query.append("http://api2.yp.com/listings/v1/search?format=xml&sort=distance&radius=5&term=theater&listingcount=10&key=5d0b448ba491c2dff5a36040a125df0a");
			query.append("&") ;
	    	key = "searchloc" ;
	    	String searchlocValue = requestParameters.get(key);
	        String searchlocDefaultValue = retrieveFromUserDefaultsFor(key);
	    	if (searchlocValue.length()>0) {
	        	query.append(""+key+"="+requestParameters.get(key) );
	        } else {
	        	//try to find the value in the user defaults
	        	if (searchlocDefaultValue != null) {
	        		query.append(""+key+"="+retrieveFromUserDefaultsFor(key) );
	        	}
	        }
	        
			url = new URL(query.toString());
			
	    }
	    else {
	    
			url =  new URL("http://api2.yp.com/listings/v1/search?format=xml&sort=distance&radius=5&term=theater&listingcount=10&key=5d0b448ba491c2dff5a36040a125df0a");
		}
		
		connection = (HttpURLConnection)url.openConnection();
		connection.setConnectTimeout(5000);
		connection.setReadTimeout(5000);
		connection.setUseCaches(false);
		
		connection.setRequestMethod("GET");
	 
		
		connection.setDoOutput(true);
		connection.setDoInput(true);
		
		connection.connect();
		
	  	
		
	    int rc = connection.getResponseCode();
	    Log.i("Response code", String.valueOf(rc));
		InputStream is ;
		if(rc<=400){
	          is=connection.getInputStream();
	      }else{
	          /* error from server */
	          is = connection.getErrorStream();
	    }
		
		//XML ResultSet
	    
	    try {
	        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	        DocumentBuilder db = dbf.newDocumentBuilder();
	        InputSource isrc = new InputSource();
	        isrc.setByteStream(is) ;
	        
	        Document doc = db.parse(isrc);
	        NodeList nodes = doc.getElementsByTagName("searchListings");
			
			if (nodes.getLength()>0) {
				Element list = (Element)nodes.item(0) ;
				NodeList l = list.getChildNodes() ;
				for (int i = 0; i < l.getLength(); i++) {
					Node n = l.item(i) ;
					if (n.getNodeType() == Node.ELEMENT_NODE) {
						Element row = (Element)l.item(i);
						data.add(row) ;
					}
		        }
			}
	    }
	    catch (Exception e) {
	        e.printStackTrace();
	    }

	} catch (Exception e) {
		e.printStackTrace() ;
	}
	
	finally {
     connection.disconnect();
   	}
	


	return data;
	
}


public void fetchDataFromsearchTheaters(Object orows) {



	
	ArrayList<Element> rows = (ArrayList<Element>)orows ;
	if (rows != null) {
		if (rows.size()>0) {
		String key = "" ;
		String subkey = "" ;
		
		//Init from Web API Data
		// resultsLayout 
		//Initializing results
		//Processing com.canappi.metamodels.mdsl.mDsl.impl.LabelImpl@22cf71b7 (name: businessName, text: name, font: Helvetica-Bold, size: 14, alignment: Left, lines: null)
		//if (rows.size()>0) {
				
			for (int i = 0 ; i < rows.size() ; i++) {	
				Element row = (Element)rows.get(i) ;
				Object object = null;
	
					
			key = "businessName" ;
			int r = key.indexOf(".") ;
	        if (r<0) {
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element e = (Element) nodes.item(0);
		           	object = e.getTextContent() ; 
				} else {
					object = "" ;
				}
	 		} else {
	 		
	 			String[] elementNames;
				elementNames = key.split("\\.");
				key  = elementNames[0] ;
				subkey = elementNames[elementNames.length-1] ;
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element rootElement = (Element) nodes.item(0);
		           	NodeList subnodes = rootElement.getElementsByTagName(subkey);
		           	if (subnodes.getLength()>0) {
		           		Element e = (Element) subnodes.item(0);
		           		object = e.getTextContent() ; 
		           	} else {
		           		//We need to look one level deeper (but not more)
		           		subnodes = rootElement.getChildNodes() ;
		           		object = "" ;
	           			for( int k = 0 ; k < subnodes.getLength() ; k++ ) {
		           			Element e = (Element)subnodes.item(k) ;
		           			NodeList otherNodes = e.getElementsByTagName(subkey);
		           			if (otherNodes.getLength()>0) {
		           				Element sube = (Element)otherNodes.item(0) ;
		           				object = sube.getTextContent() ; 
		           			}
		           		}
		           	}
				} else {
					object = "" ;
				}
	 			
	 			 
	 		}
			if (object != null) { businessNameArray.add((String)object); } else {
				businessNameArray.add("");
			}
			

			}			
		//Processing com.canappi.metamodels.mdsl.mDsl.impl.LabelImpl@32edeea8 (name: latitude, text: lat, font: null, size: null, alignment: Left, lines: null)
		//if (rows.size()>0) {
				
			for (int i = 0 ; i < rows.size() ; i++) {	
				Element row = (Element)rows.get(i) ;
				Object object = null;
	
					
			key = "latitude" ;
			int r = key.indexOf(".") ;
	        if (r<0) {
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element e = (Element) nodes.item(0);
		           	object = e.getTextContent() ; 
				} else {
					object = "" ;
				}
	 		} else {
	 		
	 			String[] elementNames;
				elementNames = key.split("\\.");
				key  = elementNames[0] ;
				subkey = elementNames[elementNames.length-1] ;
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element rootElement = (Element) nodes.item(0);
		           	NodeList subnodes = rootElement.getElementsByTagName(subkey);
		           	if (subnodes.getLength()>0) {
		           		Element e = (Element) subnodes.item(0);
		           		object = e.getTextContent() ; 
		           	} else {
		           		//We need to look one level deeper (but not more)
		           		subnodes = rootElement.getChildNodes() ;
		           		object = "" ;
	           			for( int k = 0 ; k < subnodes.getLength() ; k++ ) {
		           			Element e = (Element)subnodes.item(k) ;
		           			NodeList otherNodes = e.getElementsByTagName(subkey);
		           			if (otherNodes.getLength()>0) {
		           				Element sube = (Element)otherNodes.item(0) ;
		           				object = sube.getTextContent() ; 
		           			}
		           		}
		           	}
				} else {
					object = "" ;
				}
	 			
	 			 
	 		}
			if (object != null) { latitudeArray.add((String)object); } else {
				latitudeArray.add("");
			}
			

			}			
		//Processing com.canappi.metamodels.mdsl.mDsl.impl.LabelImpl@3a2c4ede (name: longitude, text: long, font: null, size: null, alignment: Left, lines: null)
		//if (rows.size()>0) {
				
			for (int i = 0 ; i < rows.size() ; i++) {	
				Element row = (Element)rows.get(i) ;
				Object object = null;
	
					
			key = "longitude" ;
			int r = key.indexOf(".") ;
	        if (r<0) {
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element e = (Element) nodes.item(0);
		           	object = e.getTextContent() ; 
				} else {
					object = "" ;
				}
	 		} else {
	 		
	 			String[] elementNames;
				elementNames = key.split("\\.");
				key  = elementNames[0] ;
				subkey = elementNames[elementNames.length-1] ;
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element rootElement = (Element) nodes.item(0);
		           	NodeList subnodes = rootElement.getElementsByTagName(subkey);
		           	if (subnodes.getLength()>0) {
		           		Element e = (Element) subnodes.item(0);
		           		object = e.getTextContent() ; 
		           	} else {
		           		//We need to look one level deeper (but not more)
		           		subnodes = rootElement.getChildNodes() ;
		           		object = "" ;
	           			for( int k = 0 ; k < subnodes.getLength() ; k++ ) {
		           			Element e = (Element)subnodes.item(k) ;
		           			NodeList otherNodes = e.getElementsByTagName(subkey);
		           			if (otherNodes.getLength()>0) {
		           				Element sube = (Element)otherNodes.item(0) ;
		           				object = sube.getTextContent() ; 
		           			}
		           		}
		           	}
				} else {
					object = "" ;
				}
	 			
	 			 
	 		}
			if (object != null) { longitudeArray.add((String)object); } else {
				longitudeArray.add("");
			}
			

			}			
		//Processing com.canappi.metamodels.mdsl.mDsl.impl.LabelImpl@6208f57a (name: listingId, text: id, font: null, size: null, alignment: Left, lines: null)
		//if (rows.size()>0) {
				
			for (int i = 0 ; i < rows.size() ; i++) {	
				Element row = (Element)rows.get(i) ;
				Object object = null;
	
					
			key = "listingId" ;
			int r = key.indexOf(".") ;
	        if (r<0) {
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element e = (Element) nodes.item(0);
		           	object = e.getTextContent() ; 
				} else {
					object = "" ;
				}
	 		} else {
	 		
	 			String[] elementNames;
				elementNames = key.split("\\.");
				key  = elementNames[0] ;
				subkey = elementNames[elementNames.length-1] ;
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element rootElement = (Element) nodes.item(0);
		           	NodeList subnodes = rootElement.getElementsByTagName(subkey);
		           	if (subnodes.getLength()>0) {
		           		Element e = (Element) subnodes.item(0);
		           		object = e.getTextContent() ; 
		           	} else {
		           		//We need to look one level deeper (but not more)
		           		subnodes = rootElement.getChildNodes() ;
		           		object = "" ;
	           			for( int k = 0 ; k < subnodes.getLength() ; k++ ) {
		           			Element e = (Element)subnodes.item(k) ;
		           			NodeList otherNodes = e.getElementsByTagName(subkey);
		           			if (otherNodes.getLength()>0) {
		           				Element sube = (Element)otherNodes.item(0) ;
		           				object = sube.getTextContent() ; 
		           			}
		           		}
		           	}
				} else {
					object = "" ;
				}
	 			
	 			 
	 		}
			if (object != null) { listingIdArray.add((String)object); } else {
				listingIdArray.add("");
			}
			

			}			
		//Processing com.canappi.metamodels.mdsl.mDsl.impl.TextImpl@63822112 (name: phone, defaultText: null, font: null, size: null, alignment: Left, readOnly: false, hasClearButton: false, clearButtonMode: Never, isSecure: false, textEntry: textEntry, isAutocomplete: false, lines: null, placeHolder: null, orientation: right, buttonMode: Never, border: none)
		//if (rows.size()>0) {
				
			for (int i = 0 ; i < rows.size() ; i++) {	
				Element row = (Element)rows.get(i) ;
				Object object = null;
	
					
			key = "phone" ;
			int r = key.indexOf(".") ;
	        if (r<0) {
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element e = (Element) nodes.item(0);
		           	object = e.getTextContent() ; 
				} else {
					object = "" ;
				}
	 		} else {
	 		
	 			String[] elementNames;
				elementNames = key.split("\\.");
				key  = elementNames[0] ;
				subkey = elementNames[elementNames.length-1] ;
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element rootElement = (Element) nodes.item(0);
		           	NodeList subnodes = rootElement.getElementsByTagName(subkey);
		           	if (subnodes.getLength()>0) {
		           		Element e = (Element) subnodes.item(0);
		           		object = e.getTextContent() ; 
		           	} else {
		           		//We need to look one level deeper (but not more)
		           		subnodes = rootElement.getChildNodes() ;
		           		object = "" ;
	           			for( int k = 0 ; k < subnodes.getLength() ; k++ ) {
		           			Element e = (Element)subnodes.item(k) ;
		           			NodeList otherNodes = e.getElementsByTagName(subkey);
		           			if (otherNodes.getLength()>0) {
		           				Element sube = (Element)otherNodes.item(0) ;
		           				object = sube.getTextContent() ; 
		           			}
		           		}
		           	}
				} else {
					object = "" ;
				}
	 			
	 			 
	 		}
			if (object != null) { phoneArray.add((String)object); } else {
				phoneArray.add("");
			}
			

			}			
		//Processing com.canappi.metamodels.mdsl.mDsl.impl.ButtonImpl@5f2e712f (name: call, title: , titleSelected: null, style: Bordered, gradientStyle: Alert, image: phone.png, selectedImage: null, font: null, size: null, isStandard: None)
		//if (rows.size()>0) {
				
			for (int i = 0 ; i < rows.size() ; i++) {	
				Element row = (Element)rows.get(i) ;
				Object object = null;
	
					
			key = "call" ;
			int r = key.indexOf(".") ;
	        if (r<0) {
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element e = (Element) nodes.item(0);
		           	object = e.getTextContent() ; 
				} else {
					object = "" ;
				}
	 		} else {
	 		
	 			String[] elementNames;
				elementNames = key.split("\\.");
				key  = elementNames[0] ;
				subkey = elementNames[elementNames.length-1] ;
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element rootElement = (Element) nodes.item(0);
		           	NodeList subnodes = rootElement.getElementsByTagName(subkey);
		           	if (subnodes.getLength()>0) {
		           		Element e = (Element) subnodes.item(0);
		           		object = e.getTextContent() ; 
		           	} else {
		           		//We need to look one level deeper (but not more)
		           		subnodes = rootElement.getChildNodes() ;
		           		object = "" ;
	           			for( int k = 0 ; k < subnodes.getLength() ; k++ ) {
		           			Element e = (Element)subnodes.item(k) ;
		           			NodeList otherNodes = e.getElementsByTagName(subkey);
		           			if (otherNodes.getLength()>0) {
		           				Element sube = (Element)otherNodes.item(0) ;
		           				object = sube.getTextContent() ; 
		           			}
		           		}
		           	}
				} else {
					object = "" ;
				}
	 			
	 			 
	 		}
			if (object != null) { callArray.add((String)object); } else {
				callArray.add("");
			}
			

			}			
		//Processing com.canappi.metamodels.mdsl.mDsl.impl.LabelImpl@1043fb68 (name: street, text: id, font: null, size: null, alignment: Left, lines: null)
		//if (rows.size()>0) {
				
			for (int i = 0 ; i < rows.size() ; i++) {	
				Element row = (Element)rows.get(i) ;
				Object object = null;
	
					
			key = "street" ;
			int r = key.indexOf(".") ;
	        if (r<0) {
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element e = (Element) nodes.item(0);
		           	object = e.getTextContent() ; 
				} else {
					object = "" ;
				}
	 		} else {
	 		
	 			String[] elementNames;
				elementNames = key.split("\\.");
				key  = elementNames[0] ;
				subkey = elementNames[elementNames.length-1] ;
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element rootElement = (Element) nodes.item(0);
		           	NodeList subnodes = rootElement.getElementsByTagName(subkey);
		           	if (subnodes.getLength()>0) {
		           		Element e = (Element) subnodes.item(0);
		           		object = e.getTextContent() ; 
		           	} else {
		           		//We need to look one level deeper (but not more)
		           		subnodes = rootElement.getChildNodes() ;
		           		object = "" ;
	           			for( int k = 0 ; k < subnodes.getLength() ; k++ ) {
		           			Element e = (Element)subnodes.item(k) ;
		           			NodeList otherNodes = e.getElementsByTagName(subkey);
		           			if (otherNodes.getLength()>0) {
		           				Element sube = (Element)otherNodes.item(0) ;
		           				object = sube.getTextContent() ; 
		           			}
		           		}
		           	}
				} else {
					object = "" ;
				}
	 			
	 			 
	 		}
			if (object != null) { streetArray.add((String)object); } else {
				streetArray.add("");
			}
			

			}			
		//Processing com.canappi.metamodels.mdsl.mDsl.impl.LabelImpl@7694837a (name: city, text: id, font: Helvetica-Oblique, size: 10, alignment: Left, lines: null)
		//if (rows.size()>0) {
				
			for (int i = 0 ; i < rows.size() ; i++) {	
				Element row = (Element)rows.get(i) ;
				Object object = null;
	
					
			key = "city" ;
			int r = key.indexOf(".") ;
	        if (r<0) {
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element e = (Element) nodes.item(0);
		           	object = e.getTextContent() ; 
				} else {
					object = "" ;
				}
	 		} else {
	 		
	 			String[] elementNames;
				elementNames = key.split("\\.");
				key  = elementNames[0] ;
				subkey = elementNames[elementNames.length-1] ;
	        	NodeList nodes = row.getElementsByTagName(key);
	        	if (nodes.getLength()>0) {
		           	Element rootElement = (Element) nodes.item(0);
		           	NodeList subnodes = rootElement.getElementsByTagName(subkey);
		           	if (subnodes.getLength()>0) {
		           		Element e = (Element) subnodes.item(0);
		           		object = e.getTextContent() ; 
		           	} else {
		           		//We need to look one level deeper (but not more)
		           		subnodes = rootElement.getChildNodes() ;
		           		object = "" ;
	           			for( int k = 0 ; k < subnodes.getLength() ; k++ ) {
		           			Element e = (Element)subnodes.item(k) ;
		           			NodeList otherNodes = e.getElementsByTagName(subkey);
		           			if (otherNodes.getLength()>0) {
		           				Element sube = (Element)otherNodes.item(0) ;
		           				object = sube.getTextContent() ; 
		           			}
		           		}
		           	}
				} else {
					object = "" ;
				}
	 			
	 			 
	 		}
			if (object != null) { cityArray.add((String)object); } else {
				cityArray.add("");
			}
			

			}			
		}
	}
	
}



	public HashMap identities() {
		return theaterViewIds ;
	}
	
	public HashMap values() {
		return theaterViewValues ;
	}



	public String textValueForControl(String name) {
		return (String)theaterViewValues.get(name);
	}

	public String idForControl(String name) {
		return (String)theaterViewIds.get(name);
	}

	public void setId(String id , String name) {
		theaterViewIds.put(name,id);
	}	


	public String retrieveFromUserDefaultsFor(String key) {
		 SharedPreferences settings = getSharedPreferences("yherePreferences", MODE_PRIVATE);
	     return settings.getString(key, null) ;
	}

	public void didSelectViewController() {

	
	
			if (this.searchlocQueryParameter == null) this.searchlocQueryParameter = "";
			
			HashMap<String,String> requestParameters = new HashMap<String,String>() ;
			
			requestParameters.put("searchloc", this.searchlocQueryParameter) ;
			ArrayList<Element> searchTeathersByZipResultSet = this.searchTeathersByZip(requestParameters) ;
			fetchDataFromsearchTheaters(searchTeathersByZipResultSet) ;
	
	
	

		
	
	
	
	}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

	public void viewDidLoad() {

		Bundle extras = getIntent().getExtras();
	    if (extras != null)
	    {
			Set<String> keys = extras.keySet() ;
			for (Iterator<String> iter = keys.iterator() ; iter.hasNext() ;   ) {
		    	String key = iter.next() ;
		        Class c = SearchView.class ;
		        try {
					Field f = c.getDeclaredField(key) ;
					Object extra = extras.get(key);
					String value = extra.toString() ;
					f.set(this, extras.getString(value)) ;
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchFieldException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	    }
	    else
	    {
	        
	    }
	
		theaterViewIds = new HashMap() ;
		theaterViewValues = new HashMap() ;
	
		isUserDefault = false ;
		
			

		 
	resultsListView = (ListView)findViewById(R.id.resultsTable);
    resultsAdapter = new ResultsEfficientAdapter(this);
     
	businessNameArray = new ArrayList<String>() ; 
 
	latitudeArray = new ArrayList<String>() ; 
 
	longitudeArray = new ArrayList<String>() ; 
 
	listingIdArray = new ArrayList<String>() ; 
 
	phoneArray = new ArrayList<String>() ; 
 
	callArray = new ArrayList<String>() ; 
 
	streetArray = new ArrayList<String>() ; 
 
	cityArray = new ArrayList<String>() ; 
    resultsListView.setAdapter(resultsAdapter);
			didSelectViewController() ;
		
	

	
	}

    private static String pad(int c) {
        if (c >= 10)
            return String.valueOf(c);
        else
            return "0" + String.valueOf(c);
    }



// Control Actions
	 
	 
	
		 
		
 
		
 
		
 
		
 
	 
 

	public void call(View view) {
		if (view.getId() == R.id.callButton) {

		 

		 
		 
		 
	//Open URL in a browser
		 
           
        Object o = view.getTag() ; 
		int p = (Integer)o;
        
		String callPhone = phoneArray.get(p) ;
		 
    
		if (callPhone != null) {
	        String phone = "tel:"+callPhone ;
	        Intent call = new Intent(Intent.ACTION_CALL, Uri.parse(phone));
			startActivity(call);
	    }
	 	   
		 



		//TODO Implement Action


		//End of Action Implementation
		
		 

	

	
	//TODO implement call action
	
	

		}
	}
	
 
		
 
		
 
	 
	 




	 private static class ResultsEfficientAdapter extends BaseAdapter {
   	 
	   	 private LayoutInflater mInflater;
	
	   	 public ResultsEfficientAdapter(Context context) {
	   	 	mInflater = LayoutInflater.from(context);
	
	   	 }
	
	   	 public int getCount() {
	   		//Log.v("Count :",String.valueOf(vehicleitems.size()));
	   	 	  
	return businessNameArray.size() ;
 
 
 
 
 
 
 

	   	 }
	
	   	 public Object getItem(int position) {
	   	 	return position;
	   	 }
	
	   	 public long getItemId(int position) {
	   	 	return position;
	   	 }
	
	   	 public View getView(int position, View convertView, ViewGroup parent) {
		   	 ViewHolder holder;
		   	 if (convertView == null) {
			   	 convertView = mInflater.inflate(R.layout.row, null);
			   	 holder = new ViewHolder();
			   	  
	holder.businessNameTextView = (TextView) convertView.findViewById(R.id.businessNameTextView);
	holder.businessNameTextView.setTag(new Integer(position)) ;	
 
	holder.latitudeTextView = (TextView) convertView.findViewById(R.id.latitudeTextView);
	holder.latitudeTextView.setTag(new Integer(position)) ;	
 
	holder.longitudeTextView = (TextView) convertView.findViewById(R.id.longitudeTextView);
	holder.longitudeTextView.setTag(new Integer(position)) ;	
 
	holder.listingIdTextView = (TextView) convertView.findViewById(R.id.listingIdTextView);
	holder.listingIdTextView.setTag(new Integer(position)) ;	
 
	holder.phoneEditText = (TextView) convertView.findViewById(R.id.phoneEditText);
	holder.phoneEditText.setTag(new Integer(position)) ;	
 
	holder.callButton = (Button) convertView.findViewById(R.id.callButton);
	holder.callButton.setTag(new Integer(position)) ;	
 
	holder.streetTextView = (TextView) convertView.findViewById(R.id.streetTextView);
	holder.streetTextView.setTag(new Integer(position)) ;	
 
	holder.cityTextView = (TextView) convertView.findViewById(R.id.cityTextView);
	holder.cityTextView.setTag(new Integer(position)) ;	

				
		   	 	convertView.setTag(holder);
		   	 } else {
		   	 	holder = (ViewHolder) convertView.getTag();
		   	 }
		
			  
	holder.businessNameTextView.setText(businessNameArray.get(position));
 
	holder.latitudeTextView.setText(latitudeArray.get(position));
 
	holder.longitudeTextView.setText(longitudeArray.get(position));
 
	holder.listingIdTextView.setText(listingIdArray.get(position));
 
	holder.phoneEditText.setText(phoneArray.get(position));
 
 
	holder.streetTextView.setText(streetArray.get(position));
 
	holder.cityTextView.setText(cityArray.get(position));
		
		
		   	 return convertView;
	   	 }
	
	   	 static class ViewHolder {
			  
	TextView businessNameTextView;
 
	TextView latitudeTextView;
 
	TextView longitudeTextView;
 
	TextView listingIdTextView;
 
	TextView phoneEditText;
 
	Button callButton;
 
	TextView streetTextView;
 
	TextView cityTextView;
		
	   	 }
   	 }





    @Override
    protected Dialog onCreateDialog(int id) {
        switch (id) {

       }
        return null;
    }

    @Override
    protected void onPrepareDialog(int id, Dialog dialog) {
        switch (id) {

        }
    }   
     



	public void viewDidUnload() {

		 
	resultsListView = (ListView)findViewById(R.id.resultsTable);
    resultsAdapter = new ResultsEfficientAdapter(this);
     
	businessNameArray = new ArrayList<String>() ; 
 
	latitudeArray = new ArrayList<String>() ; 
 
	longitudeArray = new ArrayList<String>() ; 
 
	listingIdArray = new ArrayList<String>() ; 
 
	phoneArray = new ArrayList<String>() ; 
 
	callArray = new ArrayList<String>() ; 
 
	streetArray = new ArrayList<String>() ; 
 
	cityArray = new ArrayList<String>() ; 
    resultsListView.setAdapter(resultsAdapter);

	}
	
	
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
	Intent intent ;
    switch (item.getItemId()) {
    	
	 
        case R.layout.searchview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, SearchView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.restaurantview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, RestaurantView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.groceryview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, GroceryView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.gasstationview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, GasStationView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.theaterview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, TheaterView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.couponview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, CouponView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.lubeview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, LubeView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.gameview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, GameView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.bakeryview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, BakeryView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.repairview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, RepairView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.homeview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, HomeView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        case R.layout.settingsview:
            // app icon in Action Bar clicked; go home
            intent = new Intent(this, SettingsView.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            return true;
    
        default:
            return super.onOptionsItemSelected(item);
        }
    }

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
	  //getMenuInflater().inflate(R.menu.menu, menu);
	  //SearchView searchView = (SearchView) menu.findItem(R.id.menu_search).getActionView();
	  // Set appropriate listeners for searchView
	  //...
	  return super.onCreateOptionsMenu(menu);
	}

	
	
	@Override 
	protected void onStart() { 
		super.onStart(); 
		//Toast.makeText(this, "onStart", Toast.LENGTH_SHORT).show(); 
	} 
	
	@Override 
	protected void onResume() { 
		super.onResume(); 
		//Toast.makeText(this, "onResume", Toast.LENGTH_SHORT).show(); 
	} 
	
	@Override 
	protected void onRestart() { 
		super.onRestart(); 
		//Toast.makeText(this, "onRestart", Toast.LENGTH_SHORT).show(); 
	}
	
	@Override 
	protected void onPause() { 
		super.onPause();
		//Toast.makeText(this, "onPause", Toast.LENGTH_SHORT).show(); super.onPause(); 
	} 
	
	@Override protected void onStop() { 
		super.onStop();
		//Toast.makeText(this, "onStop", Toast.LENGTH_SHORT).show(); super.onStop(); 
	} 
	
	@Override protected void onDestroy() { 
		super.onDestroy();
		//Toast.makeText(this, "onDestroy", Toast.LENGTH_SHORT).show(); super.onDestroy(); 
	}

	

}


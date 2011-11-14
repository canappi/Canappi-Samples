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







public class SettingsView extends Activity { 


	Activity parentController ;
	HashMap settingsViewIds ;
	HashMap settingsViewValues ;
	 
	 
	// Layout : settingsLayout	 
 
	private EditText searchlocEditText ; 
	private String searchlocEditTextId ;
	private  CharSequence searchlocResult; 
 
	private Button updateZipButton ;

	
	Boolean isUserDefault ;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.settingsview);
		 
	 
	 
 
		searchlocEditText = (EditText) findViewById(R.id.searchlocEditText);
 
		viewDidLoad();
		
		Log.i("settingsView", "onCreate() callback method");
		
	}

	public void setParentController(Activity a) {
		parentController = a;
	}
	
	public Activity getParentController() {
		return parentController ;
	}


	





	public HashMap identities() {
		return settingsViewIds ;
	}
	
	public HashMap values() {
		return settingsViewValues ;
	}



	public String textValueForControl(String name) {
		return (String)settingsViewValues.get(name);
	}

	public String idForControl(String name) {
		return (String)settingsViewIds.get(name);
	}

	public void setId(String id , String name) {
		settingsViewIds.put(name,id);
	}	

	public void saveToUserDefaults()
	{
		SharedPreferences preferences = getSharedPreferences("yherePreferences", MODE_PRIVATE);
		
		if (isUserDefault) {
				 
			SharedPreferences.Editor e = preferences.edit();
				 

 
			e.putString("searchloc", searchlocEditText.getText().toString());
			if (searchlocEditTextId != null) e.putString("searchlocId", searchlocEditTextId); 
 

	
			e.commit();
		}
	}

	public String retrieveFromUserDefaultsFor(String key) {
		 SharedPreferences settings = getSharedPreferences("yherePreferences", MODE_PRIVATE);
	     return settings.getString(key, null) ;
	}

	public void didSelectViewController() {

	

		
	
	
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
	
		settingsViewIds = new HashMap() ;
		settingsViewValues = new HashMap() ;
	
		isUserDefault = true ;
			

		 


 
	if (isUserDefault) {
		searchlocEditText.setText(retrieveFromUserDefaultsFor("searchloc"),TextView.BufferType.EDITABLE) ;	
	}
 
	String  updateZipButtonText = "Update" ; 
	String  updateZipButtonPressedText = "" ; 
	
	updateZipButton = (Button) findViewById(R.id.updateZipButton);
    updateZipButton.setOnClickListener(new View.OnClickListener() {
             public void onClick(View v) {
                 // Perform action on click
				updateDefaults(v) ;
             }
     }) ;	
			didSelectViewController() ;
		
	

	
	}

    private static String pad(int c) {
        if (c >= 10)
            return String.valueOf(c);
        else
            return "0" + String.valueOf(c);
    }



// Control Actions
	 
		
 
	 
 

	public void updateDefaults(View view) {
		if (view.getId() == R.id.updateZipButton) {

		 

	saveToUserDefaults();
		 
		 
		 
	//Open URL in a browser
		 
		 



		//TODO Implement Action


		//End of Action Implementation
		
		 

	

	
	//TODO implement updateDefaults action
	
	

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

		 


 
	if (isUserDefault) {
		searchlocEditText.setText(retrieveFromUserDefaultsFor("searchloc"),TextView.BufferType.EDITABLE) ;	
	}
 
	String  updateZipButtonText = "Update" ; 
	String  updateZipButtonPressedText = "" ; 
	
	updateZipButton = (Button) findViewById(R.id.updateZipButton);
    updateZipButton.setOnClickListener(new View.OnClickListener() {
             public void onClick(View v) {
                 // Perform action on click
				updateDefaults(v) ;
             }
     }) ;	

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


package br.edu.ifms.controller.i18n;

import java.util.Locale;
import java.util.ResourceBundle;

public class I18nUtil {
	
	public String getMensagem(Locale locale, String key) {		
	    ResourceBundle bundle = ResourceBundle.getBundle("resources.message", locale);

	    String message = bundle.getString(key);
	    return message;
	}

}

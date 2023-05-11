package br.edu.ifms.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.binary.Hex;

public class Crypt {

	
	public static String convertMD5(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
	    byte[] digest = md.digest();	    
	    String result = new String(Hex.encodeHex(digest));
		return result;
	}
	
}





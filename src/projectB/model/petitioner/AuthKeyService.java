package projectB.model.petitioner;

import java.util.Random;
import org.springframework.stereotype.Service;

@Service("authKeyService")
public class AuthKeyService {
	public static final int AUTHKEY_SZIE = 6;
	
	private int authKey;
	private final int encodingValue = 0x1261515;
	
	public void createAuthKey() {
		Random rd = new Random();
		StringBuffer buffer = new StringBuffer();
		
		int num = 0;
		while(buffer.length() < AUTHKEY_SZIE) {
			num = rd.nextInt(AUTHKEY_SZIE);
			buffer.append(num);
		}
				
		authKey = Integer.parseInt(buffer.toString());
	}
	
	public int getEncodingKey() {
		int encodingKey = authKey ^ encodingValue;		
		return encodingKey;
	}
	
	public boolean isDecoding(int mailEncodingKey, int dbEncodingKey) {
		int mailDecodingKey = mailEncodingKey ^ encodingValue;
		int dbDecodingKey = dbEncodingKey ^ encodingValue;
		return (mailDecodingKey == dbDecodingKey);
	}
	
	public int getAuthKey() {
		return authKey;
	}
}

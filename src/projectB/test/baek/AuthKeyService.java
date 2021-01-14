package projectB.test.baek;

import java.util.Random;
import org.springframework.stereotype.Service;

@Service("authKeyService")
public class AuthKeyService {
	public static final int AUTHKEY_SZIE = 6;
	private String authKey;
	
	public void createAuthKey() {
		Random rd = new Random();
		StringBuffer buffer = new StringBuffer();
		
		int num = 0;
		while(buffer.length() < AUTHKEY_SZIE) {
			num = rd.nextInt(AUTHKEY_SZIE);
			buffer.append(num);
		}
				
		authKey = buffer.toString();
	}
	
	public String getAuthKey() {
		return authKey;
	}
}

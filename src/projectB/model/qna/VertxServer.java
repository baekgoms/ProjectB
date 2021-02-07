package projectB.model.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.vertx.java.core.Handler;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;

import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.SocketIOSocket;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

import projectB.model.petitioner.PetitionerDTO;
import projectB.model.petitionerService.PetitionerService;
import projectB.model.qnaService.QnAService;

public class VertxServer extends DefaultEmbeddableVerticle{
	private static SocketIOServer io = null;

	@Autowired
	private QnAService qnaService;
	
	@Override
	public void start(Vertx vertx) {
		int port = 12345;
		HttpServer server = vertx.createHttpServer();

		io = new DefaultSocketIOServer(vertx, server);

		io.sockets().onConnection(new Handler<SocketIOSocket>() {
			public void handle(final SocketIOSocket socket) {

				socket.on("msg", new Handler<JsonObject>() {
					public void handle(JsonObject event) {
						String strMsg = event.getString("msg");						
						event.putString("msg", "잘못된 키워드입니다.");
						
						try {
							QnADTO dto = qnaService.content(strMsg);
							if(dto != null)
								event.putString("msg", dto.getContent());	
										
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						System.out.println("handler ::: " + event.getString("msg"));
						io.sockets().emit("response", event);
					}
				});

			}
		});

		server.listen(port);
	}
}

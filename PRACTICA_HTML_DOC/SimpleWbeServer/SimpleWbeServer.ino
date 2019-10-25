/*
SimpleWebServer.ino
==============
This code implements simple web server
on Arduino Ethernet shield
Based on: WebSrver.ino from example lib 
Modified: 5.04.2019 (last)  
*/
#include <SPI.h>
#include <Ethernet.h>
byte mac[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
IPAddress ip(192, 168, 1, 144);
// Server library initialization
EthernetServer server(80);

void setup() {
  Serial.begin(9600);
  while (!Serial) {
  }
  // Initialization of the network connection and server
  Ethernet.begin(mac, ip);
  server.begin();
  Serial.print("*** Server running:  ");
  Serial.println(Ethernet.localIP());
}

void loop() {
  // listening
  EthernetClient client = server.available();
  if (client) {
    Serial.println("New client:");
    boolean currentLineIsBlank = true;
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        // Information on client
        Serial.write(c);

        if (c == '\n' && currentLineIsBlank) {
      
// Send the standard HTTP document header
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/html");
          client.println("Connection: close");
          client.println("Refresh: 5");
          client.println();
          client.println("<!DOCTYPE HTML>");
          client.println("<html>");

          for (int analogChannel = 0; analogChannel < 6; analogChannel++) {
            int sensorReading = analogRead(analogChannel);
            client.print("Analog output ");
            client.print(analogChannel);
            client.print(": ");
            client.print(sensorReading);
            client.println("<br />");
          }
          client.println("</html>");
          break;
        }
        if (c == '\n') {
          currentLineIsBlank = true;
        } else if (c != '\r') {
          currentLineIsBlank = false;
        }
      }
    }
// delay, in order to receive data through the browser
    delay(1);
    // closing the connection with the client
    client.stop();
    Serial.println("Client disconnected");
  }
}
/* End of File */

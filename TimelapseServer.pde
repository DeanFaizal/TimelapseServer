import processing.net.*;
import processing.serial.*;
import java.io.*;

Serial serialPort;

int port = 10002;       
Server myServer; 

int speed = 2;
//192.168.0.102

void setup()
{
  background(0);
  myServer = new Server(this, port);
  println("Server Started..."); 

  println(Serial.list());
  serialPort = new Serial(this, Serial.list()[2], 115200);//9600);
}

void draw()
{
  // Get the next available client
  Client client = myServer.available();
  // If the client is not null, and says something, display what it said
  if (client !=null) {
    String clientData = client.readString();
    if (clientData != null) {
      for (int i = 0; i < clientData.length (); i++)
      {
        char charToSend = clientData.charAt(i);
        for (int j = 0; j < speed; j++)
        {
          serialPort.write(charToSend);
        }  
        println(charToSend);
      }
    }
  }
}  


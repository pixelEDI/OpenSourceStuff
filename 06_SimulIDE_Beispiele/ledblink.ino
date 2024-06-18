
int led1 = 9;  
int led2 = 8;  

void setup() {
  Serial.begin(115200);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
}

void loop() {
 	
  Serial.println("led1");
  digitalWrite(led1, HIGH);
  delay(500);  
  digitalWrite(led1, LOW);  
  Serial.println("led2");
  digitalWrite(led2, HIGH);
  delay(500);  
  digitalWrite(led2, LOW); 
}
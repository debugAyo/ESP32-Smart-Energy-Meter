#define LED_PIN 8

void setup() {
  Serial.begin(115200);
  pinMode(LED_PIN, OUTPUT);
  delay(1000);
  Serial.println("ESP32 Board Initialized");
}

void loop() {
  digitalWrite(LED_PIN, HIGH);
  Serial.println("LED State: ON");
  delay(1000);

  digitalWrite(LED_PIN, LOW);
  Serial.println("LED State: OFF");
  delay(1000);
}
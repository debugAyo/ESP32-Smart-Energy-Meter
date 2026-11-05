#include <Arduino.h>
#include <PZEM004Tv30.h>

// Hardware Pin Definitions (Update to match your specific header routing)
const int RELAY_PIN = 26;
const int LED_PIN = 27;

// Initialize PZEM using ESP32 HardwareSerial2 (RX=16, TX=17)
PZEM004Tv30 pzem(Serial2, 16, 17);

// Safety parameters
const float MAX_POWER_WATTS = 2500.0;
unsigned long lastReadTime = 0;
const unsigned long READ_INTERVAL = 2000;

void setup() {
    Serial.begin(115200);
    
    pinMode(RELAY_PIN, OUTPUT);
    pinMode(LED_PIN, OUTPUT);
    
    // Default to safe state (contactor OFF)
    digitalWrite(RELAY_PIN, LOW);
    digitalWrite(LED_PIN, LOW);
    
    Serial.println("SEM-V1 Smart Meter Initialized");
}

void loop() {
    if (millis() - lastReadTime >= READ_INTERVAL) {
        lastReadTime = millis();
        
        float voltage = pzem.voltage();
        float current = pzem.current();
        float power = pzem.power();
        float energy = pzem.energy();
        float frequency = pzem.frequency();
        float pf = pzem.pf();

        if (isnan(voltage)) {
            Serial.println("Error: Failed to read from PZEM-004T");
            digitalWrite(LED_PIN, LOW);
            digitalWrite(RELAY_PIN, LOW); // Fail-safe cut
        } else {
            Serial.printf("V: %.1fV | I: %.2fA | P: %.1fW | E: %.3fkWh | F: %.1fHz | PF: %.2f\n", 
                          voltage, current, power, energy, frequency, pf);
            
            // Toggle heartbeat LED
            digitalWrite(LED_PIN, !digitalRead(LED_PIN));

            // Load management / safety cutoff
            if (power > MAX_POWER_WATTS) {
                digitalWrite(RELAY_PIN, LOW);
                Serial.println("ALARM: Over-power cutoff triggered. Load disconnected.");
            } else {
                digitalWrite(RELAY_PIN, HIGH);
            }
        }
    }
}
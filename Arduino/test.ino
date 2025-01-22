void setup() {
    Serial.begin(9600);
    pinMode(3, OUTPUT); // Set D3 as output
    pinMode(LED_BUILTIN, OUTPUT); // Set built-in LED as output
}

void loop() {
    digitalWrite(3, HIGH);
    digitalWrite(LED_BUILTIN, HIGH); // Turn the LED on
    delay(2000); // Wait for 2 seconds
    digitalWrite(LED_BUILTIN, LOW); // Turn the LED off
    delay(2000); // Wait for 2 seconds
}

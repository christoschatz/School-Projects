#include <LiquidCrystal.h>  // include the LCD library

const int rs = PB11, en = PB10, d4 = PA4, d5 = PA3, d6 = PA2, d7 = PA1; //STM32 Pins to which LCD is connected 
LiquidCrystal lcd(rs, en, d4, d5, d6, d7); //Initialize the LCD
 
#include <DHT.h>                     //Library for using DHT sensor 
#define DHTPIN PA0 
#define DHTTYPE DHT11
#define fan PB5
#define UP_BUTTON PA6 //GPIO pin for increasing the threshold
#define DOWN_BUTTON PA7 //GPIO pin for decreasing the threshold
 
DHT dht(DHTPIN, DHTTYPE);     //initilize object dht for class DHT with DHT pin with STM32 and DHT type as DHT11

int maxHum = 80; //Default parameters
int maxTemp = 24;

void setup()
{
  pinMode(fan, OUTPUT); // Define fan output
  pinMode(UP_BUTTON, INPUT); // set UP_BUTTON as input
  pinMode(DOWN_BUTTON, INPUT); // set DOWN_BUTTON as input
  lcd.begin(16,2); // initialize the LCD
  dht.begin(); // initialize the Sensor
  lcd.setCursor(0,0);                                 
  lcd.print("ELECTRONIC");
  lcd.setCursor(0,1);
  lcd.print("MEASUREMENTS");
  delay(3000);
  lcd.clear();
}
 
void loop()
{
  float h = dht.readHumidity();       //Gets Humidity value
  float t = dht.readTemperature();    //Gets Temperature value
  
  // check if the upButton is pressed and increment the temperature threshold by 1
  if (digitalRead(UP_BUTTON) == HIGH) {
    maxTemp += 1;
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Desired Temp ");
    lcd.setCursor(0, 1);
    lcd.print("Set to ");
    lcd.print(maxTemp);
    lcd.print(" C");
    delay(3000);
    lcd.clear();
  }
  
  // check if the downButton is pressed and decrement the temperature threshold by 1
  if (digitalRead(DOWN_BUTTON) == HIGH) {
    maxTemp -= 1;
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Desired Temp ");
    lcd.setCursor(0, 1);
    lcd.print("Set to ");
    lcd.print(maxTemp);
    lcd.print(" C");
    delay(3000);
    lcd.clear();
  }
  
  if(h > maxHum || t > maxTemp) {
      digitalWrite(fan, HIGH);
  } else {
     digitalWrite(fan, LOW); 
  }
  lcd.setCursor(0,0);
  lcd.print("Temp: ");
  lcd.print(t);
  lcd.print(" C");
  lcd.setCursor(0,1);
  lcd.print("Humid: ");
  lcd.print(h);
  lcd.print(" %");
}

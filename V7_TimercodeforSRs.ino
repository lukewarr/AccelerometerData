// Basic demo for accelerometer readings from Adafruit MPU6050

#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <Wire.h>

Adafruit_MPU6050 mpu;

void setup(void) {
  Serial.begin(115200);

  //ADC0.CTRLA = ADC_ENABLE_bm; // Enable ADC
  //ADC0.CTRLB = ADC_PRESC_DIV8_gc; // Set prescaler to 32


  while (!Serial)
    delay(10); // will pause Zero, Leonardo, etc until serial console opens

///Serial.println("Adafruit MPU6050 test!");

   //Try to initialize!
  if (!mpu.begin(0x69)) {
    Serial.println("Failed to find MPU6050 chip");
    while (1) {
      delay(10);
    }
    }
  
  delay(1000);
  unsigned long startTime = micros();

  for (unsigned long i = 0; i < 10000; i++)
  {
     sensors_event_t a, g, temp;
     mpu.getEvent(&a, &g, &temp);

  /* Print out the values */
  //Serial.print("Acceleration X: ");
    Serial.print(a.acceleration.x);
    Serial.print(",");
    Serial.print(a.acceleration.y);
    Serial.print(",");
    Serial.print(a.acceleration.z);
    Serial.println('\n');
    //delay(50);
  }

  unsigned long elapsedTime = micros() - startTime;

  Serial.println(elapsedTime);
}


void loop() {



}
---
title: Sample Post
date: March 27, 2023
description: Meta Description of this post
keywords: whatever, keyword, you, like
---

# This is a title

This is a paragraph. And you can put images like this:

![The ESP8266 - Steampunk Version](esp8266_steampunk.png "The ESP8266 - Steampunk Version")

$~~~~~~~$

## This is a section title

This is a code sample:

```
#include <EEPROM.h>

void setup() {
  Serial.begin(9600);

  // Init EEPROM
  EEPROM.begin(512);

  // Write data to the EEPROM
  int addr = 0;
  int value = 28;
  EEPROM.put(addr, value);
  EEPROM.commit();

  // Read data from the EEPROM
  int readValue;
  EEPROM.get(addr, readValue);
  Serial.println(readValue);
}

void loop() {
  // Do nothing
}
```

You can also put a [link](https://esp8266code.com/webserver.html). Then, test the code with Curl or Postman.

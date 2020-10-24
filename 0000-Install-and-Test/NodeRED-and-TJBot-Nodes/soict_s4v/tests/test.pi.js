/**
 * Copyright 2016-2018 IBM Corp. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Đọc tham số dòng lệnh từ file .env
require('dotenv').config();

var sleep = require('sleep');

const TJBot = require('tjbot');

// just need tjbot to think that it is capable of seeing, don't 
// actually need real Watson credentials for this test
const SteamWatsonCredentials = {
      assistant: {
        apikey: process.env.ASSISTANT_API_KEY,
        url: process.env.ASSISTANT_API_ENDPOINT
      },    
      language_translator: {
        apikey: process.env.LANGUAGE_TRANSLATOR_API_KEY,
        url: process.env.LANGUAGE_TRANSLATOR_API_ENDPOINT
      },
      speech_to_text: {
        apikey: process.env.SPEECH_TO_TEXT_API_KEY,
        url: process.env.SPEECH_TO_TEXT_API_ENDPOINT
      },
      text_to_speech: {
        apikey: process.env.TEXT_TO_SPEECH_API_KEY,
        url: process.env.TEXT_TO_SPEECH_API_ENDPOINT
      },        
      tone_analyzer: {
        apikey: process.env.TONE_ANALYZER_API_KEY,
        url: process.env.TONE_ANALYZER_API_ENDPOINT
      },        
      visual_recognition: {
        apikey: process.env.VISUAL_RECOGNITION_API_KEY,
        url: process.env.VISUAL_RECOGNITION_API_ENDPOINT
      }               
};

var tj = new TJBot(['speaker', 'camera', 'microphone'], 
                   {
                      log: {level: 'debug'},
                      robot: {                      // Text to speech
                        gender: "female"
                      },                      
                      speak: {                      
                        language: "en-EN",          // Text to speech 
                        speakerDeviceId: "default"  // Play sound. Xem ở file /home/pi/.asoundrc
                      }
                    }, 
                    SteamWatsonCredentials
                    );

//----------------------------------------------------------------------------
/*
console.log("Âm thanh in + nhận dạng + đọc lại");
tj.listen((text) => {
  console.log("Kết quả nhận dạng: " + text);
  tj.stopListening();
  console.log("Đọc lại: " + text);
  tj.speak(text);
});
*/
//----------------------------------------------------------------------------
console.log("Âm thanh out");
var sound = '/home/pi/Desktop/soict_s4v/tests/chao.wav';
tj.play(sound).then(function() {
        console.log("    sound done!");
});

//----------------------------------------------------------------------------
/*
console.log("Chụp ảnh, cần credit");
const TEST_IMAGE = '/tmp/picture.jpg';
tj.takePhoto(TEST_IMAGE).then(function(data) {
    if (!fs.existsSync(TEST_IMAGE)) {
        throw new Error("expected picture.jpg to have been created");
    }
    console.log("picture taken successfully, removing the file");
    if (fs.existsSync(TEST_IMAGE)) {
        fs.unlinkSync(TEST_IMAGE);
    }
});
*/

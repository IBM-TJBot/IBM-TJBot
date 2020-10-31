import os
from os.path import join, dirname
from dotenv import load_dotenv

if __name__ == "__main__":
    mail = "tjbotcredential1@gmail.com"

    f = open("tjbot_simulator_enviroment.txt", "w")
    fields = {
        'watson_assisstant_credentials.env': [
            'ASSISTANT_APIKEY',
            'ASSISTANT_URL'
        ],
        'language_translator_credentials.env': [
            'LANGUAGE_TRANSLATOR_APIKEY',
            'LANGUAGE_TRANSLATOR_URL'
        ],
        'speech2text_credentials.env': [
            'SPEECH_TO_TEXT_APIKEY',
            'SPEECH_TO_TEXT_URL'
        ],
        'text2speech_credentials.env': [
            'TEXT_TO_SPEECH_APIKEY',
            'TEXT_TO_SPEECH_URL'
        ],
        'tone_analyser_credentials.env': [
            'TONE_ANALYZER_APIKEY',
            'TONE_ANALYZER_URL'
        ],
        'visual_recognition_credentials.env': [
            'VISUAL_RECOGNITION_APIKEY',
            'VISUAL_RECOGNITION_URL'
        ]
    }

    result_fileds = [
        'ASSISTANT_API_KEY',
        'ASSISTANT_API_ENDPOINT',
        'ASSISTANT_WORKSPACE_ID',
        'LANGUAGE_TRANSLATOR_API_KEY',
        'LANGUAGE_TRANSLATOR_API_ENDPOINT',
        'SPEECH_TO_TEXT_API_KEY',
        'SPEECH_TO_TEXT_API_ENDPOINT',
        'TEXT_TO_SPEECH_API_KEY',
        'TEXT_TO_SPEECH_API_ENDPOINT',
        'TONE_ANALYZER_API_KEY',
        'TONE_ANALYZER_API_ENDPOINT',
        'VISUAL_RECOGNITION_API_KEY',
        'VISUAL_RECOGNITION_API_ENDPOINT'
    ]
    index = 0

    for file in fields:
        dotenv_path = join(dirname(__file__), file)
        load_dotenv(dotenv_path)
        for field in fields[file]:
            print(result_fileds[index] +":"+ field)
            data = os.getenv(field)
            print(data)
            f.write(result_fileds[index] + "=" + data +"\n")
            index += 1
        
        if index == 2:
            f.write(result_fileds[index] + "=\n")
            index += 1
    
    f.close()
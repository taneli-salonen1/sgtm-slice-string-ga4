___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Slice String for GA4",
  "categories": [
    "UTILITY"
  ],
  "description": "This template can be used to slice string values to make them fit into GA4 parameters or user properties. You can send part 1 as param 1 and part 2 as param 2 etc.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "label1",
    "displayName": "Slice the string into 100 character long parts. Select which part to return."
  },
  {
    "type": "TEXT",
    "name": "numCharacters",
    "displayName": "Number of Characters to Extract",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "help": "Number of characters included in each extract.",
    "defaultValue": 100,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "NUMBER"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "stringInput",
    "displayName": "Input Value",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "The input text to be split."
  },
  {
    "type": "TEXT",
    "name": "extractPart",
    "displayName": "Part to Extract",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "POSITIVE_NUMBER"
      }
    ],
    "help": "The input string is split into parts of up to 100 character length. Select the part to be returned by the variable. 1 is the first 100 characters."
  }
]


___SANDBOXED_JS_FOR_SERVER___

const makeInteger = require('makeInteger');
const makeString = require('makeString');

if (data.stringInput && data.extractPart && data.numCharacters) {
  const numChars = makeInteger(data.numCharacters);
  const part = makeInteger(data.extractPart);
  const stringValue = makeString(data.stringInput);
  
  const sliced = stringValue.slice(part*numChars-numChars, part*numChars);
  
  return sliced.length > 0 ? sliced : undefined;
}


___TESTS___

scenarios: []


___NOTES___

Created on 9/2/2022, 8:54:30 AM



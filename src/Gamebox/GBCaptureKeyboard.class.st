Class {
	#name : 'GBCaptureKeyboard',
	#superclass : 'GBElement',
	#instVars : [
		'keydownEventListner',
		'keyupEventListner',
		'parent',
		'pressed'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBCaptureKeyboard >> addedTo: aNode [

	super addedTo: aNode.
	parent := aNode.
	self initEventListner.
	
]

{ #category : 'as yet unclassified' }
GBCaptureKeyboard >> deleteFrom: aNode [
	super deleteFrom: aNode .
	window removeEventListener: keydownEventListner.
	window removeEventListener: keyupEventListner.
]

{ #category : 'as yet unclassified' }
GBCaptureKeyboard >> initEventListner [

	keydownEventListner := window
		                       addEventListener: 'keydown'
		                       block: [ :e |
			                       (pressed includes: e code) ifFalse: [
				                       pressed add: e code.
				                       parent announcer announce:
					                       (GBKeyDown new with: e) ] ].
	keydownEventListner := window
		                       addEventListener: 'keyup'
		                       block: [ :e |
			                       pressed remove: e code ifAbsent: [  ].
			                       parent announcer announce:
				                       (GBKeyUp new with: e) ]
]

{ #category : 'as yet unclassified' }
GBCaptureKeyboard >> initialize [

	pressed := Set new
]

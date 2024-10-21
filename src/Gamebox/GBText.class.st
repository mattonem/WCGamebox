Class {
	#name : 'GBText',
	#superclass : 'GBDrawable',
	#instVars : [
		'text'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBText >> drawOn: ctx [

	ctx font: '48px serif'.
	ctx fillText: text position: 0 and: 0
]

{ #category : 'accessing' }
GBText >> initialize [ 
	super initialize.
	text := 'Default text'
]

{ #category : 'accessing' }
GBText >> text [

	^ text 
]

{ #category : 'accessing' }
GBText >> text: anObject [

	text := anObject
]

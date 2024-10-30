Class {
	#name : 'GBText',
	#superclass : 'GBDrawable',
	#instVars : [
		'text',
		'font',
		'textAlign'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBText >> drawOn: ctx [

	ctx font: font.
	ctx fillStyle: 'black'.
	ctx textAlign: textAlign.
	ctx fillText: text position: 0 and: 0
]

{ #category : 'accessing' }
GBText >> font: aFontString [
	font := aFontString 
]

{ #category : 'accessing' }
GBText >> initialize [ 
	super initialize.
	text := 'Default text'.
	font := '48px serif'.
	textAlign := 'left'
]

{ #category : 'accessing' }
GBText >> text [

	^ text 
]

{ #category : 'accessing' }
GBText >> text: anObject [

	text := anObject
]

{ #category : 'accessing' }
GBText >> textAlign: anObject [

	textAlign := anObject
]

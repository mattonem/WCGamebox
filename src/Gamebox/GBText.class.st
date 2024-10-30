Class {
	#name : 'GBText',
	#superclass : 'GBDrawable',
	#instVars : [
		'text',
		'font'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBText >> drawOn: ctx [

	ctx font: font.
	ctx fillStyle: 'black'.
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
	font := '48px serif'
]

{ #category : 'accessing' }
GBText >> text [

	^ text 
]

{ #category : 'accessing' }
GBText >> text: anObject [

	text := anObject
]

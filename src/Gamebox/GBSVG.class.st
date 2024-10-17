Class {
	#name : 'GBSVG',
	#superclass : 'GBDrawable',
	#instVars : [
		'img'
	],
	#pools : [
		'PjBrowserGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBSVG >> drawOn: ctx [

	ctx drawImage: img with: 0 with: 0
]

{ #category : 'accessing' }
GBSVG >> initialize [

	super initialize.
	img := Image new
		       src:
			       'https://www.svgrepo.com/show/404920/camping.svg';
		       yourself.
	console log: self
]

{ #category : 'accessing' }
GBSVG >> url: anObject [

	img src: anObject
]

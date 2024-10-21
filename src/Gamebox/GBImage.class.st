Class {
	#name : 'GBImage',
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
GBImage >> drawOn: ctx [

	ctx drawImage: img with: 0 with: 0
]

{ #category : 'accessing' }
GBImage >> initialize [

	super initialize.
	img := Image new
		       src:
			       'https://www.svgrepo.com/show/219787/camping-tent.svg';
		       yourself.
]

{ #category : 'accessing' }
GBImage >> url: anObject [

	img src: anObject
]

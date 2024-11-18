Class {
	#name : 'GBKeyDown',
	#superclass : 'GBAnnouncement',
	#instVars : [
		'evt'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'instance creation' }
GBKeyDown >> evt [ 
	^ evt
]

{ #category : 'instance creation' }
GBKeyDown >> with: e [

	evt := e
]

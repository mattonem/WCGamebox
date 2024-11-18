Class {
	#name : 'GBKeyUp',
	#superclass : 'GBAnnouncement',
	#instVars : [
		'evt'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'instance creation' }
GBKeyUp >> evt [ 
	^ evt
]

{ #category : 'instance creation' }
GBKeyUp >> with: e [

	evt := e
]

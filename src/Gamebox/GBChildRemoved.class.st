Class {
	#name : 'GBChildRemoved',
	#superclass : 'GBAnnouncement',
	#instVars : [
		'child'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBChildRemoved >> child [

	^ child
]

{ #category : 'accessing' }
GBChildRemoved >> child: anObject [

	child := anObject
]

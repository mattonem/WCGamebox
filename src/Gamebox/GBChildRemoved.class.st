Class {
	#name : 'GBChildRemoved',
	#superclass : 'GBAnnouncementUp',
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

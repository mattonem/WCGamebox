Class {
	#name : 'GBMouseEvent',
	#superclass : 'GBAnnouncement',
	#instVars : [
		'position'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBMouseEvent >> position [

	^ position
]

{ #category : 'accessing' }
GBMouseEvent >> position: anObject [

	position := anObject
]

{ #category : 'instance creation' }
GBMouseEvent >> with: ev [
	position := ev
]

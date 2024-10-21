Class {
	#name : 'GBTick',
	#superclass : 'GBAnnouncement',
	#instVars : [
		'duration'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBTick >> duration [

	^ duration
]

{ #category : 'accessing' }
GBTick >> duration: anObject [

	duration := anObject
]

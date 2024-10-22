Class {
	#name : 'GBTick',
	#superclass : 'GBAnnouncement',
	#instVars : [
		'duration',
		'clock'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBTick >> clock [

	^ clock
]

{ #category : 'accessing' }
GBTick >> clock: anObject [

	clock := anObject
]

{ #category : 'accessing' }
GBTick >> duration [

	^ duration
]

{ #category : 'accessing' }
GBTick >> duration: anObject [

	duration := anObject
]

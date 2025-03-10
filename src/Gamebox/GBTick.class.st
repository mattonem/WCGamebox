Class {
	#name : 'GBTick',
	#superclass : 'GBAnnouncementDown',
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
GBTick >> clockStartTime [	
	^ clock startedAt 
]

{ #category : 'accessing' }
GBTick >> duration [

	^ duration
]

{ #category : 'accessing' }
GBTick >> duration: anObject [

	duration := anObject
]

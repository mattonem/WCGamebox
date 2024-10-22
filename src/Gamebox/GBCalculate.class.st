Class {
	#name : 'GBCalculate',
	#superclass : 'GBAnnouncement',
	#instVars : [
		'duration',
		'clock'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBCalculate >> duration [ 
^ duration
]

{ #category : 'as yet unclassified' }
GBCalculate >> withTick: anEvt [
	duration := anEvt duration.
	clock := anEvt clock.
]
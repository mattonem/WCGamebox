Class {
	#name : 'GBOrederedAnnouncer',
	#superclass : 'Announcer',
	#category : 'Gamebox-Subscription',
	#package : 'Gamebox',
	#tag : 'Subscription'
}

{ #category : 'initialization' }
GBOrederedAnnouncer >> bringFirst: anObject [
	registry bringFirst: anObject
]

{ #category : 'initialization' }
GBOrederedAnnouncer >> bringLast: subscriber [
	registry bringLast: subscriber
]

{ #category : 'initialization' }
GBOrederedAnnouncer >> initialize [
	super initialize.
	registry := GBOrederedSubscriptionRegistry new
]

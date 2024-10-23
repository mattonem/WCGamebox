"
A GBOrederedAnnouncerTest is a test class for testing the behavior of GBOrederedAnnouncer
"
Class {
	#name : 'GBOrederedAnnouncerTest',
	#superclass : 'TestCase',
	#category : 'Gamebox-Tests-Subscription',
	#package : 'Gamebox-Tests',
	#tag : 'Subscription'
}

{ #category : 'tests' }
GBOrederedAnnouncerTest >> testOrderRemains [

	| ann something |
	ann := GBOrederedAnnouncer new.
	something := 0.
	ann when: Announcement do: [ something := 1 ] for: 1.
	ann when: Announcement do: [ something := 2 ] for: 2.
	ann announce: Announcement new.
	self assert: something equals: 2
]

{ #category : 'tests' }
GBOrederedAnnouncerTest >> testTriggerFirst [

	| ann something |
	ann := GBOrederedAnnouncer new.
	something := 0.
	ann when: Announcement do: [ something := 1 ] for: 1.
	ann when: Announcement do: [ something := 2 ] for: 2.
	ann bringFirst: 2.
	ann announce: Announcement new.
	self assert: something equals: 1
]

{ #category : 'tests' }
GBOrederedAnnouncerTest >> testTriggerLast [

	| ann something |
	ann := GBOrederedAnnouncer new.
	something := 0.
	ann when: Announcement do: [ something := 1 ] for: 1.
	ann when: Announcement do: [ something := 2 ] for: 2.
	ann bringLast: 1.
	ann announce: Announcement new.
	self assert: something equals: 1
]

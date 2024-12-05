Class {
	#name : 'GBElement',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBElement >> addedTo: anElement [
]

{ #category : 'as yet unclassified' }
GBElement >> deleteFrom: aNode [ 

	aNode announcer unsubscribe: self
]

{ #category : 'as yet unclassified' }
GBElement >> ifNode: aBlock [
]

{ #category : 'as yet unclassified' }
GBElement >> initialize [

	super initialize.
]

{ #category : 'as yet unclassified' }
GBElement >> name [
	^ name ifNil: [ name := self asString ] 
]

{ #category : 'as yet unclassified' }
GBElement >> name: aString [

	name := aString
]

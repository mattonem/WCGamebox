"
A GBPolygonTest is a test class for testing the behavior of GBPolygon
"
Class {
	#name : 'GBPolygonTest',
	#superclass : 'TestCase',
	#category : 'Gamebox-Tests',
	#package : 'Gamebox-Tests'
}

{ #category : 'tests' }
GBPolygonTest >> testEdges [

	| poly |
	poly := GBPolygon new points: {
			        (1 @ 1).
			        (2 @ 2).
			        (3 @ 0) }.
	self assert: poly edges size equals: 3.
	self assert: poly edges asSet equals: {
			{
				(1 @ 1).
				(2 @ 2) }.
			{
				(2 @ 2).
				(3 @ 0) }.
			{
				(3 @ 0).
				(1 @ 1) } } asSet
]

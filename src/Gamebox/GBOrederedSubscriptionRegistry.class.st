Class {
	#name : 'GBOrederedSubscriptionRegistry',
	#superclass : 'SubscriptionRegistry',
	#category : 'Gamebox-Subscription',
	#package : 'Gamebox',
	#tag : 'Subscription'
}

{ #category : 'initialization' }
GBOrederedSubscriptionRegistry >> bringFirst: subscriber [

	^ self protected: [ | toBeMoved |
		toBeMoved := subscriptions select: [ :subscription | subscription subscriber == subscriber ].
		toBeMoved do: [ :e | e unregister ].
		subscriptions removeAll: toBeMoved.
		subscriptions addAllFirst: toBeMoved.
		 ]
]

{ #category : 'initialization' }
GBOrederedSubscriptionRegistry >> bringLast: subscriber [

	^ self protected: [ | toBeMoved |
		toBeMoved := subscriptions select: [ :subscription | subscription subscriber == subscriber ].
		toBeMoved do: [ :e | e unregister ].
		subscriptions removeAll: toBeMoved.
		subscriptions addAll: toBeMoved.
		 ]
]

{ #category : 'initialization' }
GBOrederedSubscriptionRegistry >> reset [
	"subscriber -> subscriptions"

	subscriptions := OrderedCollection new
]

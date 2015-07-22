# CoreData-Subclassing-Bug
Showing a swift compiler bug when subclassing a NSManagedObject

## How to see the bug?
Running the tests. You will see that it will fails on this line:

```
        // *****************************************************
        // -- HERE IS THE BUG WHEN I ACCESS AccountModel.foo() *
        account.foo()
        // --
        // ***************************************************** 
```

## Workaround
Go to subclassses/AccountModel.swift and declare AccountModel as **final**

## Discussion
Is taking place on stackoverflow: 
http://stackoverflow.com/questions/31539429/subclassing-a-subclass-of-an-nsmanagedobject

## Credits
This Bug is discoverd by developers form "aus der Technik - Simon & Wolff GbR" (www.ausdertechnik.de) and is filed 
in apples radar system unter: 21936715

## Comments
... are welcome

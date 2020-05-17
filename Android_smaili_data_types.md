## Dalvik's bytecode

### Primitives 
- V : void can only be used for return types
- B : byte
- S : short
- C : char
- I : int
- J : long (64 bits)
- F : float
- D : double
- Z : boolean

### Object
```
Lpackage/name/ObjectName; L indicates that it is an object type
Ljava/lang/String; is equivalent to java.lang.String
````
### Methods
```
Lpackage/name/ObjectName;->MethodName(III)Z
```
- MethodName : Method name
- (III) : Parameters. In this case 3 ints
- Z : return type (boolean)

### Fields
```
Lpackage/name/ObjectName;->FieldName:Ljava/lang/String;
```
- FieldName : Field name
- Ljava/lang/String; : type of the field

### Smali registers
- v0, v1, v2 : local registers
- p0, p1, p2 : method argument alias e.g (p0 == this)

#### References
- https://github.com/JesusFreke/smali/wiki/TypesMethodsAndFields

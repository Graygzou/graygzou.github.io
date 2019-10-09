---
layout: post
title:  "Tips and Tricks C++"
date:   2019-09-28 16:15:00 -0400
categories: C++
---

## `static`  keyword
Values are stored at class level and not at instance level.
You have to initialize static variable outside the class in order to reserve the memory.
```
class C {
    static int i;
    static int j;
}

// Initialize the two static variables (with or without a value)
// Should be put at the top of the declaration (.cpp) file
int C::i = 1;
int C::j;
```
Note: If you declare a global `i` after static variables init, you can acceess it with `::i`.
Example:
```
int i = 20
int C::i = 10;
int C::j = 5;

int g = C::j + ::i; // g = 25
int p = C::j + i;   // p = 15
```

/!\ Static method can only use static declarations.

## `const` keyword
Cannot be modified : attempt to do so directly is a compile-time error.
Modifing it indirectly (modifying const obj through ref or pointer to non const-type) results in undefined behavior.

A const need to be defined when declared aka `const int x = 5; // without = 5 this will not compile`

## `volatile` keyword
Volatile is a hint to the implementation to avoid aggressive optimization involving the object because the value of the object might be changed by means undetectable by an implementation.

## `mutable` keyword
Permits modification of the class member declared mutable even if the containing
object is declared const.

## `inline` keyword
All functions declared **inside** the class/struct/union definition (.h) is an inline function like so :
```
class A
{
public:
    inline int test() // redundant use of inline
    {
        // this function is automatically inline
        // function body
    }
};

```
Inline functions declaration can also be declared inside the .h but **outside** the class definition.
But you need to also declare the signature of this function inside the class definition. An example of this:
```
class A
{
public:
    int test(); // declare the function
};

inline int A::test() // use inline prefix
{
}
```

## `#define`

## arguments

## constructors

## class
You can create instances of a classe either
* statically (Use class name as a type) `MyClass myClass;`
* dynamically (Use operator new followed by the class name and optionally arguments between parentheses) `MyClass myClass = new MyClass(arg1, arg2);`

## Storage class specifiers
* auto: automatic storage duration.

* register: pareil que auto + hint compiler to place obj in processor's register.
* static: static or thread storage duration and internal linkage
* extern: same as static except external linkage
* thread_local: thread storage duration
* mutage: does not affect storage duration or linkage. (const/votatile)

## Possible linkages
* **no linkage** : Can be referred  only from the scope it is in.   
Contains: basic property when declaring local variables + member functions not declared _extern_. Just like typedefs, enumerations, and enumerators declared in the block scope.

* **internal linkage**: Can be referred to from all scopes in the current translation unit.    
Contains: static variables, functions, or function templates. Non-volatile const variables (also constexpr) not declare _extern_. All names in unnamed namespace.

* **external linkage**: Can be referred to from the scopes in the other translation units.   
Contains: variables not list above. Enumerations. Names of classes, members function, static data members. Names of all templates not listed above.

## external
Basically, `extern` is a keyword in C++ language that tells to the compiler that definition of a particular variable is exists elsewhere.
The counter part of `extern` is `static` which tells the variables is only visible to that file/class (depending on where it is declared).

## void
 pointers to void and functions returning type void (procedures in other languages) are permitted. Like so
 ```
void* ptr;          // void pointer
ptr = fct;          // Store a void function in this pointer
((void(*)())ptr)(); // Call the function pointed

void fct () {
  ...
}
 ```
 This can be used to mask the original pointer value :
 ```
 int n = 1;
 int* p1 = &n;
 void* pv = p1;
 int* p2 = static_cast<int*>(pv);
 std::cout << *p2 << '\n';            // prints 1
 ```

# Tips
`string* a, b;` : only `a` is a string pointer. `b` is only a string.
`string* a, *b;` : both `a` and `b` are string pointers.


[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/

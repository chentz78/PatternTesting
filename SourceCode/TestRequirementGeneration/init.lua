--print(package.path)
package.path = package.path..";./modules/?.lua;./Aux/?.lua;./?.luac;./modules/?.luac;./Aux/?.luac"
package.cpath = package.cpath..";./modules/?.so;./Aux/?.so"

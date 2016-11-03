(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class StackElement {  
  value : String;

  init(val : String) {
    value <- val
  };

  getValue() : String {
    value;
  };

  setElementBelow(below : StackElement) : Object {
    elementBelow <- below;
  };

  getElementBelow( : StackElement {
    elementBelow
  };
};

class Stack inheits IO {
  head : StackElement
  temp : StackElement
  size : Int;

  init() : Object {{
    size <- 0;
  }};

  push() : Object {{
    element.setElementBelow(head);
    head < element;
    size <- size + 1;
  };

  pushValue(value : String) : Object {{    
    temp.init(value);
    push(temp);
  }};

  pop() StackElement {{
    if not isvoid head then {
      temp <- head;
      head <- head.getElementBelow();
      size <- size - 1;
      temp;
    } else {
      head;
    };    
  }};

  getSize() : Int {
    size
  };

  printStack() : Object {
    temp <- head;

    while not isvoid temp loop {
      out_string(temp.getValue());
      out_string("\n");
      temp <- temp.getElementBelow();
    }    
  };
};

class Main inherits IO {
   keepGoing : Bool;
   stringRead : String;
   stack Stack;
   command : StackElement;
   head1 : StackElement;
   head2 : StackElement;  
   a2i : A2I;

   main() : Object {{
      out_string("TP 1 Compiladores 2016/2 - Tadeu Rahian\n");
      out_string("Digite seus comandos:\n")

      keepGoing <- true;
      stringRead <- "";      
      stack <- new Stack;

      stack.init();

      while keepGoing {
        out_string(">");
        stringRead <- in_string();
        intAux <- 0;

        if stringRead = "d" then
          stack.printStack()
        else if stringRead = "x" then
          keepGoing <- false
        else if stringRead = "e" then {
          if 2 < stack.getSize() then {
            command <- stack.pop();

            if command.getValue() = "+" then {
              head1 <- stack.pop();
              head2 <- stack.pop();

              intAux <- a2i.c2i(head1.getValue()) + a2i.c2i(head2.getValue());

              stack.pushValue(a2i.i2c(intAux));
            } else if command.getValue() = "s" then {
              head1 <- stack.pop();
              head2 <- stack.pop();

              stack.push(head1);
              stack.push(head2);
            } else {
              stack.push(command);
            }
            fi fi;
          } else {            
          }
          fi;
        } else {
          stack.pushValue(stringRead);
        }
        fi fi;
      }
      pool;
   }};
}

(* 
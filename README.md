
# :mailbox_with_mail: The country letter carrier's problem: research in breadth
OCaml project for Artificial Intelligent Systems - Intelligent Application Development exam.
##  :pencil: Table of contents
* [Description](#description)
* [How to use](#how-to-use)
* [Setup](#setup)
* [Technologies](#technologies)
* [License](#license)



## :books: Description <a name="description"/>
This project aims to create a program that allows you to find, given a graph G with V vertices and E arcs to which a length is associated, a closed circuit or path that starts from a specific vertex defined by the user. This closed path must also verify certain properties:
*  it contains all the arcs of the subset E 
*  it has a total length less than an integer K. 

A BFS search is used to find the circuit, furthermore, it is assumed that graph G is an indirect graph. 

## :man_technologist: How to use <a name="how-to-use"/>
Most of the information on how the code works can be found in the report "Relazione_postino", where you can also see some examples of graphs used in tests. 

## :gear: Setup <a name="setup"/>
To run this project, you can download OCaml from the original [website](https://ocaml.org/learn/tutorials/up_and_running.html), or you can use [TryOCaml], where you can try this language in an interactive mode without downloading anything. If you prefer to use locally then you have run this command to compile it:

```ocaml
ocamlc -o postino.exe postino.ml 
.\postino.exe
```
## :computer: Technologies <a name="technologies"/>
Project is created with:
* [OCaml](https://ocaml.org/)
* [Visual Studio Code](https://code.visualstudio.com/)

## :balance_scale: License <a name="license"/>
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details


(**DEFINIZIONE GRAFO *)
type 'a graph =  {nodi : 'a list; archi : ('a*'a*'a) list; lunghezza: 'a list; };;
type 'a grafo_suc = Graph_suc of ('a -> 'a list );;

let grafo1 =
    {nodi = [1; 2; 3; 4; 5 ; 6 ];
     archi = [(1, 2, 5); (1, 4, 3); (2, 3, 4);(2, 1, 3); (3,6,4);(4,5,6);(5,5,3);(5,7,6)];
     lunghezza =[1;2;4;3;5;6;7]};;

(** funzione che permette di trovare tutti i vicini di un nodo *)
let ricerca_vicini grafo x = 
    let rec ricerca vicini = function
        []-> vicini
        |(a,b,c)::rest -> if a=x then ricerca (c::vicini) rest
            else if x=c then ricerca (a::vicini) rest
            else ricerca vicini rest
    in ricerca [] grafo;;


let fun_suc1 = function
      1 -> ricerca_vicini grafo1.archi 1
    | 2 -> ricerca_vicini grafo1.archi 2
    | 3 -> ricerca_vicini grafo1.archi 3
    | 4 -> ricerca_vicini grafo1.archi 4
    | 5 -> ricerca_vicini grafo1.archi 5
    | 6 -> ricerca_vicini grafo1.archi 6
    |_ -> [];;

let grafo2 =
    {nodi = [1; 2; 3; 4; 5 ; 6; 7];
     archi = [(1,3,2);(1,9,5);(2,2,3);(5,4,6);(3,1,6);(3,7,4);(4,4,6);(6,1,2)];
     lunghezza =[1;2;3;4;7;9]};;


let fun_suc2 = function
    1 -> ricerca_vicini grafo2.archi 1
    | 2 -> ricerca_vicini grafo2.archi 2
    | 3 -> ricerca_vicini grafo2.archi 3
    | 4 -> ricerca_vicini grafo2.archi 4
    | 5 -> ricerca_vicini grafo2.archi 5
    | 6 -> ricerca_vicini grafo2.archi 6
    | 7 -> ricerca_vicini grafo2.archi 7
    | _ -> [];;



let grafo3 =
    {nodi = [1; 2; 3; 4; 5 ; 6; 7; 8; 9];
     archi = [(1,4,2);(1,2,3);(1,5,4);(2,3,5);(2,1,6);(3,7,6);(3,3,7);(4,6,9);(5,5,6);(7,8,8);(8,2,9)];
     lunghezza =[1;4;3;5;7;8;6;2]};;

let fun_suc3 = function
    1 -> ricerca_vicini grafo3.archi 1
    | 2 -> ricerca_vicini grafo3.archi 2
    | 3 -> ricerca_vicini grafo3.archi 3
    | 4 -> ricerca_vicini grafo3.archi 4
    | 5 -> ricerca_vicini grafo3.archi 5
    | 6 -> ricerca_vicini grafo3.archi 6
    | 7 -> ricerca_vicini grafo3.archi 7
    | 8 -> ricerca_vicini grafo3.archi 8
    | 9 -> ricerca_vicini grafo3.archi 9
    | 10 -> ricerca_vicini grafo3.archi 10
    | _ -> [];;

(** grafo a forma di infinito *)
let grafo4 =
    {nodi = [1; 2; 3; 4; 5 ; 6; 7; 8; 9;10;11];
     archi = [(1,1,2);(2,1,3);(3,1,4);(4,1,5);(5,1,6);(6,1,1);(1,1,7);(1,1,11);(7,1,8);(8,1,9);(9,1,10);(10,1,11)];
     lunghezza =[1]};;

let fun_suc4 = function
    1 -> ricerca_vicini grafo4.archi 1
    | 2 -> ricerca_vicini grafo4.archi 2
    | 3 -> ricerca_vicini grafo4.archi 3
    | 4 -> ricerca_vicini grafo4.archi 4
    | 5 -> ricerca_vicini grafo4.archi 5
    | 6 -> ricerca_vicini grafo4.archi 6
    | 7 -> ricerca_vicini grafo4.archi 7
    | 8 -> ricerca_vicini grafo4.archi 8
    | 9 -> ricerca_vicini grafo4.archi 9
    | 10 -> ricerca_vicini grafo4.archi 10
    | 11 -> ricerca_vicini grafo4.archi 11
    | _ -> [];;

let e1 = [(1,5);(5,6);(6,4)];;
let e2 = [(1,2);(2,3);(1,5);(3,4)];;
let e3 = [(1,2);(8,9);(5,2)];;
let e4 = [(2,3)];;

let g_s1 = Graph_suc fun_suc1;;
let g_s2 = Graph_suc fun_suc2;;
let g_s3 = Graph_suc fun_suc3;;
let g_s4 = Graph_suc fun_suc4;;
(**----------- *)

(**ECCEZIONI *)
exception NotFound;;
exception Errore;;
exception Arco_NotFound;;
exception Numero_negativo;;
(**----------- *)

(**FUNZIONI AUSILIARE *)

(*
let get_k  = 
    print_string ("Inserire il numero K:");
    let s = read_int() in
    if s > 0 then s else raise Numero_negativo;;*)

(**stampa il cammino *)
let rec stampalista = function 
    [] -> print_newline()
    | x::rest -> print_int(x); print_string(";"); stampalista rest;;

(**stampa il cammino come lista di archi *)
let rec stampaarchi = function
    [] -> print_newline()
    | (x,y)::rest -> Printf.printf "(%i,%i)" x y; print_string(";"); stampaarchi rest;;

(**funzione che permette di ricavare la lunghezza associata all'arco passato (x,y) *)
let rec valore_arco x y = function
    [] -> 0
    | (a,b,c)::rest -> if (x=a && y=c) || (x=c && y=a) then b else valore_arco x y rest;;


(**calcola il costo del cammino *)
let costo_del_cammino cammino archi = 
    let rec sum costo = function
        []-> raise Errore
        |_::[]-> costo
        |x::y::rest -> sum ( costo + valore_arco x y archi) (y::rest)
in sum 0 cammino ;;


(** trasformo la lista cammino in una lista di archi *)
let trasforma_cammino cammino =
    let rec crea acc = function
        [] -> []
        |_::[] -> acc
        | x::(y :: _ as rest)-> crea ((x,y) :: acc) rest
in List.rev (crea [] cammino);;

(*controllo se tutti gli archi stanno nel cammino *)
let controllo_lista lista cammino =
    let rec controllo = function
        []-> true
        | (x,y)::rest -> if List.mem (x,y) cammino || List.mem (y,x) cammino then controllo rest
        else false
    in controllo lista;;

(**funzione che restituisce gli archi del grafo come una coppia e non una tripla *)
let modifica_archi_grafo archi = 
    let rec modifica mod_archi = function
        []-> mod_archi
        | (x,y,z)::rest -> modifica ((x,z) :: mod_archi) rest
    in modifica [] archi;;

(**funzione che controlla se tutti gli archi scelti dall'utente sono nel grafo *)
let controllo_archi lista archi = 
    let rec controllo = function
        [] -> lista
        |(x,y)::rest ->  if List.mem (x,y) (modifica_archi_grafo archi) || List.mem (y,x) (modifica_archi_grafo archi) then controllo rest
        else raise Arco_NotFound
in controllo lista;;

(**controlla il numero delle occorrenze del nodo v_0 *)
let scan_occorrenze elem lista = List.fold_left(fun acc y -> if elem = y then acc + 1 else acc) 0 lista;;
(**------------ *)


(**BFS CIRCUITO*)
let bfs_circuit inizio k grafo lista_archi (Graph_suc succ) =
    let estendi cammino = stampalista cammino;
        List.map (function x ->  x::cammino )(List.filter (function x ->  if x = inizio then true else not (List.mem x cammino))(succ (List.hd cammino)))
    in let rec ricerca  = function
            [] -> raise NotFound 
            | cammino::rest -> 
                (*se il costo del cammino è minore di k e contiene tutti gli archi passati allora ritorna il cammino*)
                if ((costo_del_cammino cammino grafo < k) && (inizio = List.hd cammino) && (scan_occorrenze inizio cammino = 2) && (controllo_lista lista_archi (trasforma_cammino cammino))) then cammino
                else ricerca (rest @ (estendi cammino))
in ricerca [[inizio]];;


let bfs_circuit2 inizio k grafo lista_archi (Graph_suc succ) =
    let estendi cammino = stampalista cammino;
        List.map (function x ->  x::cammino )(List.filter (function x ->  not (List.mem x cammino))(succ (List.hd cammino)))
    in let rec ricerca  = function
            [] -> raise NotFound 
            | cammino::rest -> 
                (*se il costo del cammino è minore di k e contiene tutti gli archi passati allora ritorna il cammino*)
                if ((costo_del_cammino ([inizio] @ cammino) grafo < k) && (List.mem inizio (succ (List.hd cammino))) && (controllo_lista lista_archi (trasforma_cammino ([inizio] @ cammino)))) 
                    then  [inizio] @ cammino 
                else ricerca (rest @ (estendi cammino))
in ricerca [[inizio]];;

(**------------ *)

(**RICERCA CAMMINO E STAMPA*)
let find_path start k grafo lista_archi (Graph_suc succ)=
    let result = (bfs_circuit start k grafo lista_archi (Graph_suc succ))
    in print_string("Cammino finale:"); stampalista (List.rev result) ;
    print_string("Cammino finale archi:"); stampaarchi (trasforma_cammino (List.rev result));
    print_string("Il peso del cammino è:"); print_int (costo_del_cammino result grafo); print_newline();;

let find_path2 start k grafo lista_archi (Graph_suc succ)=
    let result = (bfs_circuit2 start k grafo lista_archi (Graph_suc succ))
    in print_string("Cammino finale bfs_circuit2:"); stampalista (List.rev result) ;
    print_string("Cammino finale bfs_circuit2 archi:"); stampaarchi (trasforma_cammino (List.rev result));
    print_string("Il peso del cammino con bfs_circuit 2 è:"); print_int (costo_del_cammino result grafo); print_newline();;

(**------------ *)


let lista_archi1= controllo_archi e1 grafo1.archi;;
let lista_archi2= controllo_archi e2 grafo2.archi;;
let lista_archi3= controllo_archi e3 grafo3.archi;;
let lista_archi4= controllo_archi e4 grafo4.archi;;

print_string("Risultati prima funzione bfs_circuit");;
print_newline();;
(*
find_path 2 50 grafo1.archi lista_archi1 g_s1;;
print_newline();;


find_path 3 30 grafo2.archi lista_archi2 g_s2;;
print_newline();;


find_path 5 70 grafo3.archi lista_archi3 g_s3;;
print_newline();;

find_path 1 50 grafo4.archi lista_archi4 g_s4;;
print_newline();;
*)
print_string("Risultati seconda funzione bfs_circuit");;
print_newline();;


find_path2 2 50 grafo1.archi lista_archi1 g_s1;;
print_newline();;


find_path2 3 30 grafo2.archi lista_archi2 g_s2;;
print_newline();;


find_path2 5 70 grafo3.archi lista_archi3 g_s3;;
print_newline();;

find_path2 1 50 grafo4.archi lista_archi4 g_s4;;
print_newline();;

find_path2 1 50 grafo4.archi lista_archi4 g_s4;;
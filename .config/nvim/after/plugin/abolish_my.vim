let g:abolish_save_file = expand('<sfile>')

cabbrev grpe grep
cabbrev Ggrpe Ggrep
cabbrev GIt Git
cabbrev G Git

if !exists(":Abolish")
  finish
endif

Abolish cal{a,e}nder{,s}                      cal{e}ndar{}
Abolish {c,m}arraige{,s}                      {}arriage{}
Abolish {,in}consistan{cy,cies,t,tly}         {}consisten{}
Abolish delimeter{,s}                         delimiter{}
Abolish {,non}existan{ce,t}                   {}existen{}
Abolish despara{te,tely,tion}                 despera{}
Abolish d{e,i}screp{e,a}nc{y,ies}             d{i}screp{a}nc{}
Abolish euphamis{m,ms,tic,tically}            euphemis{}
Abolish hense                                 hence
Abolish {,re}impliment{,s,ing,ed,ation}       {}implement{}
Abolish improvment{,s}                        improvement{}
Abolish lastest                               latest
Abolish {les,compar,compari}sion{,s}          {les,compari,compari}son{}
Abolish {,un}nec{ce,ces,e}sar{y,ily}          {}nec{es}sar{}
Abolish {,un}orgin{,al}                       {}origin{}
Abolish persistan{ce,t,tly}                   persisten{}
Abolish {,ir}releven{ce,cy,t,tly}             {}relevan{}
Abolish rec{co,com,o}mend{,s,ed,ing,ation}    rec{om}mend{}
Abolish seperat{e,es,ed,ing,ely,ion,ions,or}  separat{}
Abolish Tqbf        The quick, brown fox jumps over the lazy dog
Abolish dal Dalmater
Abolish domi Domagoj Dorotic
Abolish P Plug

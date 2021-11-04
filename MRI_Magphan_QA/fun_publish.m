%function [ output_args ] = fun_publish( input_args )
%% CONTROLE QUALITE IRM
% INSTITUT DE CANCEROLOGIE DE LORRAINE
%%
options_doc_nocode.format='pdf';
options_doc_nocode.showCode=true;


publish('fun_publish.m')
macopen('html/fun_publish.pdf')
%end


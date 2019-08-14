import numpy as np 
import pandas as pd
import os
import re
import spacy
import nltk
import heapq

nltk.download('stopwords')

article = ""
with open('001.txt',encoding = 'utf-8') as f:
	for line in f:
		article += line
		
clean_article = re.sub(r'\[[0-9]\]',' ',article)
clean_article = re.sub(r'\s+',' ',clean_article)
clean_article = re.sub(r'\W',' ',clean_article)
clean_article = re.sub(r'\d',' ',clean_article)
clean_article = re.sub(r'\s+',' ',clean_article)

spacy_nlp = spacy.load('en_core_web_sm')
document = spacy_nlp(article)

print(type(document))

entities = ""
for element in document.ents:
	print('type : %s  label : %s' % (element.label_,element))
	entities += str(element) + " "
	
stop_words = nltk.corpus.stopwords.words('english')

ner = []	
for word in nltk.word_tokenize(entities):
	if word not in stop_words:
		ner.append(word)
		
sent2score = {}

sentences = nltk.sent_tokenize(article)
for sentence in sentences:
	for word in nltk.word_tokenize(sentence):
		if word not in stop_words:
			if word in ner:
				if sentence not in sent2score.keys():
					sent2score[sentence] = 1
			else:
					sent2score[sentence] += 1
					
for sentence,score in sent2score.items():
	sent2score[sentence] = sent2score[sentence] / len(sentence)
	
sent2idx = {}
i = 0
for sentence in sentences:
	sent2idx[sentence] = i
	i += 1
	
best_sentences = heapq.nlargest(5,sent2score,key = sent2score.get)

bestsent2idx = {}
for sentence in best_sentences:
	bestsent2idx[sentence] = sent2idx[sentence]

best_sentences = heapq.nsmallest(5,bestsent2idx,key = bestsent2idx.get)

summary = ""

for sentence in best_sentences:
	summary += str(sentence)

print('Article: ',article)
print('Summary: ',summary)	

from keras.preprocessing.text import Tokenizer
from keras.preprocessing.sequence import pad_sequences

article = []
with open('001.txt',encoding = 'utf-8') as f:
	for line in f:
		article.append(line)


tokenizer = Tokenizer(num_words = 500)
tokenizer.fit_on_texts(article)

sequences = tokenizer.texts_to_sequences(article)
print(sequences)
word2idx = tokenizer.word_index

max_len = 0
for sequence in sequences:
	if len(sequence) > max_len:
		max_len = len(sequence)
	
data = pad_sequences(sequences,maxlen = max_len,padding = 'post')
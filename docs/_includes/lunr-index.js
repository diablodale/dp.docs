// docs[i] is current entry within assets/js/search-data.json
const content_to_merge = [docs[i].content, docs[i].uvalues, docs[i].uexamples];
docs[i].content = content_to_merge.join(' ');

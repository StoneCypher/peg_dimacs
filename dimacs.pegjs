
// this parser doesn't require comments to be in any particular place, which the spec requires at the top
// this parser also doesn't require a p row, which the spec does, and if it's there, it doesn't care where
// this parser will refuse multiple p rows, however

{

  let comments = [],
      claims   = [],
      format,
      var_count,
      clause_count;

  function ast(kind, data) {
    data.kind = kind;
    return data;
  }

}



DimacsDocument
  = R:Row Rs:(NL Row)* NL?
  { let parse_tree = [R, ...(Rs.map(lr => lr[1]))];
    return { format, comment: comments.join('\n'), var_count, clause_count, claims }; }

Comment
  = 'c' t:[^\n]*
  { let text = t.join('').trim();
    comments.push(text);
    return ast('comment', { text }); }

Summary
  = 'p' __ fmt:'cnf' __ varcount:Number __ clausecount:Number _
  { format = fmt;
    if (var_count !== undefined) { error('Only one configuration "p" row is permitted'); }
    var_count = varcount;
    clause_count = clausecount;
    return ast('summary', { format, var_count, clause_count }); }

Row
  = Comment
  / Summary
  / ClaimRow

ClaimRow
  = n1:Number f:(__ Number)* _
  { const claim = [n1, ...(f.map(fr => fr[1]))];
    claims.push(claim);
    return ast('claim', { data: claim }); }

Number
  = '-'? [0-9]+ { return parseInt(text()); }

NL
  = '\r\n'
  / '\n'

_  = ' '*
__ = ' '+

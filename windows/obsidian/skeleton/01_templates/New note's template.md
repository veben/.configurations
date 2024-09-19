---
date: <% tp.date.now() %>
<%*
// Move the file to zettlekasten
let newPath = `02_zettlekasten/${tp.file.title}.md`; await tp.file.move(newPath);
// Rename the file
let title = await tp.system.prompt("Enter note title:"); await tp.file.rename(title);
// Manage the tags
let tagsString = await tp.system.prompt("Enter your tags (comma-separated): ");
let tags = tagsString.split(',').map(tag => tag.trim());
%>
tags: <% tagsString %>
description:
---

<% tp.file.cursor() %>

## References

## Related Notes
<% tags.map(tag => `[[${tag}]]`).join(' & ') %>
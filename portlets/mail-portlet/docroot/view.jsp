<%
/**
 * Copyright (c) 2000-2008 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>

<%@ include file="/init.jsp" %>

<script type="text/javascript">
	function <portlet:namespace />initEditor() {
		return '';
	}

	function <portlet:namespace />sendMessage() {
		submitForm(document.<portlet:namespace />fm);
	}

	jQuery(
		function() {
			Liferay.Mail.init(
				{
					sendBodyEditor: window.<portlet:namespace />editor,
					messagesPerPage: <%= PortletProps.get("messages.per.page") %>,
					namespace: '<portlet:namespace />'
				}
			);
		}
	);
</script>

<div id="account-configuration">
	<liferay-ui:message key="click-the-configuration-icon-to-setup-your-email-accounts" />

	<br /><br />

	<liferay-ui:icon image="configuration" message="setup-email-accounts" url="<%= portletDisplay.getURLConfiguration() %>" />
</div>

<table id="account-container">
<tr>
	<td id="selection">
		<select id="account-selection">
		</select>
	</td>
	<td id="status-div">
		<span id="status" />
		<span id="debug" />
	</td>
	<td id="search">
		<input id="search-text">

		<input id="search-button" type="button" value="<liferay-ui:message key="search" />" />
	</td>
</tr>
</table>

<table id="email-container">
<tr>
	<td id="email-left-column">
		<div id="compose-mail">
			<liferay-ui:message key="compose-email" />
		</div>

		<div id="folders">
			<div class="folder" folderName="INBOX">
				<a href="javascript: ;">INBOX</a>
			</div>
		</div>
	</td>
	<td id="email-right-column">
		<div id="folder" folderName="">
			<table class="folder-controls">
			<tr>
				<td class="actions">
					<div>
						<input class="delete" type="button" value="<liferay-ui:message key="delete" />" />

						<select class="select-actions">
							<option value="none"><liferay-ui:message key="more-actions" /></option>

							<option value="read">- <liferay-ui:message key="mark-as-read" /></option>

							<option value="unread">- <liferay-ui:message key="mark-as-unread" /></option>
						</select>

						<a class="refresh" href="javascript: ;"><liferay-ui:message key="refresh" /></a>
					</div>

					<div>
						<liferay-ui:message key="select" />:

						<a class="select-all" href="javascript: ;"><liferay-ui:message key="all" /></a>,

						<a class="select-none" href="javascript: ;"><liferay-ui:message key="none" /></a>,

						<a class="select-read" href="javascript: ;"><liferay-ui:message key="read" /></a>,

						<a class="select-unread" href="javascript: ;"><liferay-ui:message key="unread" /></a>
					</div>
				</td>
				<td class="navigation">
					<a class="newest" href="javascript: ;">&laquo; <liferay-ui:message key="newest" /></a>

					<a class="newer" href="javascript: ;">&lt; <liferay-ui:message key="newer" /></a>

					<span class="status">? - ? of ???</span>

					<a class="older" href="javascript: ;"><liferay-ui:message key="older" /> &gt;</a>

					<!--<a class="oldest" href="javascript: ;"><liferay-ui:message key="oldest" /> &raquo;</a>-->
				</td>
			</tr>
			</table>

			<table id="message-list">
			<tr>
				<td class="alert"><liferay-ui:message key="no-messages-found" /></td>
			</tr>
			</table>

			<table class="folder-controls">
			<tr>
				<td class="actions">
					<div>
						<liferay-ui:message key="select" />:

						<a class="select-all" href="javascript: ;"><liferay-ui:message key="all" /></a>,

						<a class="select-none" href="javascript: ;"><liferay-ui:message key="none" /></a>,

						<a class="select-read" href="javascript: ;"><liferay-ui:message key="read" /></a>,

						<a class="select-unread" href="javascript: ;"><liferay-ui:message key="unread" /></a>
					</div>

					<div>
						<input class="delete" type="button" value="<liferay-ui:message key="delete" />" />

						<select class="select-actions">
							<option value="none"><liferay-ui:message key="more-actions" /></option>

							<option value="read">- <liferay-ui:message key="mark-as-read" /></option>

							<option value="unread">- <liferay-ui:message key="mark-as-unread" /></option>
						</select>

						<a class="refresh" href="javascript: ;"><liferay-ui:message key="refresh" /></a>
					</div>
				</td>
				<td class="navigation">
					<a class="newest" href="javascript: ;">&laquo; <liferay-ui:message key="newest" /></a>

					<a class="newer" href="javascript: ;">&lt; <liferay-ui:message key="newer" /></a>

					<span class="status">? - ? of ???</span>

					<a class="older" href="javascript: ;"><liferay-ui:message key="older" /> &gt;</a>

					<!--<a class="oldest" href="javascript: ;"><liferay-ui:message key="oldest" /> &raquo;</a>-->
				</td>
			</tr>
			</table>
		</div>

		<div id="message">
			<div class="message-controls">
				<div class="actions">
					<span class="back">&laquo; <%= LanguageUtil.format(pageContext, "back-to-x", "<span class=\"folder-name\">INBOX</span>") %></span>
				</div>

				<div class="navigation">
					<span class="newer">&lt; <liferay-ui:message key="newer" /></span>

					<span class="status">? of ???</span>

					<span class="older"><liferay-ui:message key="older" /> &gt;</span>
				</div>
			</div>

			<div id="message-read">
				<div class="details">
					<table>
						<tr>
							<td class="label">
								<liferay-ui:message key="from" />
							</td>
							<td><span id="read-from"></span></td>
						</tr>
						<tr>
							<td class="label">
								<liferay-ui:message key="reply-to" />
							</td>
							<td><span id="read-reply-to"></span></td>
						</tr>
						<tr>
							<td class="label">
								<liferay-ui:message key="to" />
							</td>
							<td><span id="read-to"></span></td>
						</tr>
						<tr>
							<td class="label">
								<liferay-ui:message key="cc" />
							</td>
							<td><span id="read-cc"></span></td>
						</tr>
						<tr>
							<td class="label">
								<liferay-ui:message key="date" />
							</td>
							<td><span id="read-date"></span></td>
						</tr>
						<tr>
							<td class="label">
								<liferay-ui:message key="subject" />
							</td>
							<td><span id="read-subject"></span></td>
						</tr>
						<tr style="display: none">
							<td class="label">
								<liferay-ui:message key="mailed-by" />
							</td>
							<td><span id="read-mailed-by"></span></td>
						</tr>
					</table>
				</div>

				<div id="read-body">
				</div>
			</div>

			<table id="message-options">
			<tr>
				<td id="reply">
					<a href="#message-options"><liferay-ui:message key="reply" /></a>
				</td>
				<td id="reply-all">
					<a href="#message-options"><liferay-ui:message key="reply-all" /></a>
				</td>
				<td id="forward">
					<a href="#message-options"><liferay-ui:message key="forward" /></a>
				</td>
			</tr>
			</table>

			<form action="<portlet:actionURL name="sendMessage" />" enctype="multipart/form-data" id="send-form" method="post" name="<portlet:namespace />fm" onSubmit="<portlet:namespace />sendMessage(); return false;">
			<input id="send-email-address" name="<portlet:namespace />sendEmailAddress" type="hidden" value="">
			<input id="send-folder-name" name="<portlet:namespace />sendFolderName" type="hidden" value="">
			<input id="send-message-type" name="<portlet:namespace />sendMessageType" type="hidden" value="">
			<input id="send-message-uid" name="<portlet:namespace />sendMessageUid" type="hidden" value="">

			<div id="message-send">
				<div class="options">
					<input class="send" type="submit" value="<liferay-ui:message key="send" />">

					<input class="discard" type="button" value="<liferay-ui:message key="discard" />">
				</div>

				<div class="details">
					<table>
					<tr>
						<td class="label">
							<liferay-ui:message key="from" />:
						</td>
						<td>
							<select id="send-from" name="<portlet:namespace />sendFromEmailAddress">
							</select>
						</td>
					</tr>
					<tr>
						<td class="label">
							<liferay-ui:message key="to" />:
						</td>
						<td>
							<textarea name="<portlet:namespace />sendTo"></textarea>
						</td>
					</tr>
					<tr>
						<td class="label">
							<liferay-ui:message key="cc" />:
						</td>
						<td>
							<input name="<portlet:namespace />sendCc" type="text">
						</td>
					</tr>
					<tr>
						<td class="label">
							<liferay-ui:message key="bcc" />:
						</td>
						<td>
							<input name="<portlet:namespace />sendBcc" type="text">
						</td>
					</tr>
					<tr>
						<td class="label">
							<liferay-ui:message key="subject" />:
						</td>
						<td>
							<input name="<portlet:namespace />sendSubject" type="text">
						</td>
					</tr>
					<tr>
						<td class="label">
							<liferay-ui:message key="attachments" />:
						</td>
						<td>
							<input name="<portlet:namespace />sendAttachments" size="50" type="file" />
						</td>
					</tr>
					</table>

					<span id="send-body">
						<liferay-ui:input-editor height="500px" width="95%" />

						<input id="send-body-hidden" name="<portlet:namespace />sendBody" type="hidden" />
					</span>
				</div>

				<div class="options">
					<input class="send" type="submit" value="<liferay-ui:message key="send" />">

					<input class="discard" type="button" value="<liferay-ui:message key="discard" />">
				</div>
			</div>
			</form>

			<div class="message-controls">
				<div class="actions">
					<span class="back">&laquo; <%= LanguageUtil.format(pageContext, "back-to-x", "<span class=\"folder-name\">INBOX</span>") %></span>
				</div>

				<div class="navigation">
					<span class="newer">&lt; <liferay-ui:message key="newer" /></span>

					<span class="status">? of ???</span>

					<span class="older"><liferay-ui:message key="older" /> &gt;</span>
				</div>
			</div>

		</div>
	</td>
</tr>
</table>
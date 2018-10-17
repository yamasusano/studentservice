<?php

function groupMenu()
{
    $renderHTML = '';

    $renderHTML .= '
<div class="col-lg-12">
    <div class="row">
        <div class="menu-lists">
            <div class="group-menu-item">
                <button id="finder-form" class="btn btn-info">Finder Form</button>
                <button id="group-chat" class="btn btn-info">Chating</button>
                <button id="member-list" class="btn btn-info">Members()</button>

                </div>
            <div class="invite-members">
                <input type="text" name="user-name" placeholder="search student,suppervisor here...">
                <button class="btn btn-info" name="search-user">Search</button>
            </div>

         </div>
	</div>
</div>
<div class="col-lg-12">
    <div class="row">
        <div id="group-contents">
        </div>
    </div>
</div>
<div class="col-lg-12" style="text-align:right;margin-top:20px;">
    <button name="leave-group" class="btn btn-info">Leave</button>
</div>
';
    return $renderHTML;
}
function finderForm()
{
    $skills = major_skill();
    $renderHTML = '<h3>Finder Form</h3>
    <div class="finder-form">
        <div class="row">
            <div class="title-form">
                <div class="col-lg-3">
                    <label for="title">title</label>
                </div>
                <div class="col-lg-9">
                    <input type="text" id="title">
                </div>
            </div>
            <div class="description-form">
                <div class="col-lg-3">
                    <label for="title">Description</label>
                </div>
                <div class="col-lg-9">
                <textarea name="description" id="description" rows="3" style="resize:none;width:100%"></textarea>
                </div>
            </div>
            <div class="member-avaiable-form">
                <div class="col-lg-3">
                    <label for="title">member</label>
                </div>
                <div class="col-lg-9">

                </div>
            </div>
            <div class="skill-form">
                <div class="col-lg-3">
                    <label for="title">skill</label>
                </div>
                <div class="col-lg-9">
                    <dl class="dropdown">
                        <dt>
                            <a id="skill">
                            <span class="hida">Select skill</span>
                            <p class="multiSel"></p>
                            </a>
                        </dt>
                        <dd>
                            <div class="mutliSelect">
                                <ul>';
    foreach ($skills as $skill) {
        $renderHTML .= ' <li>
                                        <input type="checkbox" value="' . $skill->total . '"/>' . $skill->total . '</li>';
    }
    $renderHTML .= '</ul>
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="prefix-element">
                <div class="skill-other">
                    <div class="col-lg-3">
                        <label for="title">other</label>
                    </div>
                    <div class="col-lg-9">
                        <input type="text" id="skill-other">
                    </div>
                </div>
                <div class="supervisor-form">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="title">Supervisor</label>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="title">Close date</label>
                            <input type="date"  id="close-date" value="' . date() . '">
                        </div>
                    </div>
                </div>
                <div class="contact-form">
                <div class="col-lg-3">
                    <label for="title">Contact</label>
                </div>
            <div class="col-lg-9">
                <input type="text" id="contact-form">
            </div>
                </div>
             </div>
        </div>
        <div id="group-message">
        </div>
        <div class="col-lg-12  form-btn">
            <button type="submit" id="post-form" class="btn btn-info">post</button>
            <a href="' . home_url('profile') . '" class="btn btn-danger">cancel</a>
        </div>
    </div>
    ';

    return $renderHTML;
}

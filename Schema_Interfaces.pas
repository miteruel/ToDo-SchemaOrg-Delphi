Unit Schema_Interfaces;

Interface
(*

  Schema_Interfaces
  ========================
  Abstract types , base class and interfaces for schema.org

  version 0.1 )

  - Initial version.

  This file is part of ToDoRosetta framework.
  Copyright (C) 2017 Antonio Alcázar Ruiz. Multi-Informática Teruel S.L

  The contents of this file are subject to the Mozilla Public License Version
  1.1 (the "License"); you may not use this file except in compliance with
  the License. You may obtain a copy of the License at http://www.mozilla.org/MPL
  .....


  ******** This file is under construction ********
  *** Please don't use it in production project ***

*)

//implementation end.

uses
     Classes
     //,Simple_Model_Schema
     ;

type

TangibleValue= String;

// You can change the base type for your own IYourbase
TBaseSchema=TInterfacedObject;


// interfaces


IAction=interface; //forward

ICreativeWork=interface; //forward


(* Thing
The most generic type of item.
*)

IThing=Interface  // You can change the base interface for your own IYourbase
(*URL of a reference Web page that unambiguously indicates the item's identity. 
E.g. the URL of the item's Wikipedia page, Wikidata entry, or official 
website.*)
  function Get_sameAs:String;
  procedure Set_sameAs(v:String);
(*An additional type for the item, typically used for adding more specific 
types from external vocabularies in microdata syntax. This is a relationship 
between something and a class that the thing is in. In RDFa syntax, it is 
better to use the native RDFa syntax - the 'typeof' attribute - for multiple 
types. Schema.org tools may have only weaker understanding of extra types, in 
particular those defined externally.*)
  function Get_additionalType:String;
  procedure Set_additionalType(v:String);
(*A sub property of description. A short description of the item used to 
disambiguate from other, similar items. Information from other properties (in 
particular, name) may be necessary for the description to be useful for 
disambiguation.*)
  function Get_disambiguatingDescription:String;
  procedure Set_disambiguatingDescription(v:String);
(*Indicates a potential Action, which describes an idealized action in which 
this thing would play an 'object' role.*)
  function Get_potentialAction:IAction;
  procedure Set_potentialAction(v:IAction);
(*URL of the item.*)
  function Get_url:String;
  procedure Set_url(v:String);
(*An alias for the item.*)
  function Get_alternateName:String;
  procedure Set_alternateName(v:String);
(*The name of the item.*)
  function Get_name:String;
  procedure Set_name(v:String);
(**)
  function Get_mainEntityOfPage:ICreativeWork;
  procedure Set_mainEntityOfPage(v:ICreativeWork);
// properties
  property sameAs:String read Get_sameAs write Set_sameAs;
  property additionalType:String read Get_additionalType write Set_additionalType;
  property disambiguatingDescription:String read Get_disambiguatingDescription write Set_disambiguatingDescription;
  property potentialAction:IAction read Get_potentialAction write Set_potentialAction;
  property url:String read Get_url write Set_url;
  property alternateName:String read Get_alternateName write Set_alternateName;
  property name:String read Get_name write Set_name;
  property mainEntityOfPage:ICreativeWork read Get_mainEntityOfPage write Set_mainEntityOfPage;
end;
(*** end IThing ***)

IEntryPoint=interface; //forward

IActionStatusType=interface; //forward

IOrganization=interface; //forward


(* Action
*)
IAction=Interface (IThing)
(*Indicates a target EntryPoint for an Action.*)
  function Get_target:IEntryPoint;
  procedure Set_target(v:IEntryPoint);
(*Indicates the current disposition of the Action.*)
  function Get_actionStatus:IActionStatusType;
  procedure Set_actionStatus(v:IActionStatusType);
(**)
  function Get_agent:IOrganization;
  procedure Set_agent(v:IOrganization);
(*For failed actions, more information on the cause of the failure.*)
  function Get_error:IThing;
  procedure Set_error(v:IThing);
// properties
  property target:IEntryPoint read Get_target write Set_target;
  property actionStatus:IActionStatusType read Get_actionStatus write Set_actionStatus;
  property agent:IOrganization read Get_agent write Set_agent;
  property error:IThing read Get_error write Set_error;
end;
(*** end IAction ***)


(* Intangible
A utility class that serves as the umbrella for a number of 'intangible' things 
such as quantities, structured values, etc.
*)
IIntangible=Interface (IThing)
  function TangIntangible:TangibleValue;
end;
(*** end IIntangible ***)

ISoftwareApplication=interface; //forward


(* EntryPoint
An entry point, within some Web-based protocol.
*)
IEntryPoint=Interface (IIntangible)
(*An application that can complete the request.*)
  function Get_application:ISoftwareApplication;
  procedure Set_application(v:ISoftwareApplication);
(*The high level platform(s) where the Action can be performed for the given 
URL. To specify a specific application or operating system instance, use 
actionApplication.*)
  function Get_actionPlatform:String;
  procedure Set_actionPlatform(v:String);
(*An HTTP method that specifies the appropriate HTTP method for a request to an 
HTTP EntryPoint. Values are capitalized strings as used in HTTP.*)
  function Get_httpMethod:String;
  procedure Set_httpMethod(v:String);
(*The supported encoding type(s) for an EntryPoint request.*)
  function Get_encodingType:String;
  procedure Set_encodingType(v:String);
(*An url template (RFC6570) that will be used to construct the target of the 
execution of the action.*)
  function Get_urlTemplate:String;
  procedure Set_urlTemplate(v:String);
(*The supported content type(s) for an EntryPoint response.*)
  function Get_contentType:String;
  procedure Set_contentType(v:String);
// properties
  property application:ISoftwareApplication read Get_application write Set_application;
  property actionPlatform:String read Get_actionPlatform write Set_actionPlatform;
  property httpMethod:String read Get_httpMethod write Set_httpMethod;
  property encodingType:String read Get_encodingType write Set_encodingType;
  property urlTemplate:String read Get_urlTemplate write Set_urlTemplate;
  property contentType:String read Get_contentType write Set_contentType;
end;
(*** end IEntryPoint ***)

IReview=interface; //forward

IPerson=interface; //forward

IMediaObject=interface; //forward

IPlace=interface; //forward

IVideoObject=interface; //forward

IPublicationEvent=interface; //forward

IProduct=interface; //forward

INumber=interface; //forward

IDuration=interface; //forward

IAudioObject=interface; //forward

IAlignmentObject=interface; //forward


(* CreativeWork
The most generic kind of creative work, including books, movies, photographs, 
software programs, etc.
*)
ICreativeWork=Interface (IThing)
(*The number of comments this CreativeWork (e.g. Article, Question or Answer) 
has received. This is most applicable to works published in Web sites with 
commenting system; additional comments may exist elsewhere.*)
  function Get_commentCount:Integer;
  procedure Set_commentCount(v:Integer);
(*Review of the item.*)
  function Get_reviews:IReview;
  procedure Set_reviews(v:IReview);
(*Headline of the article.*)
  function Get_headline:String;
  procedure Set_headline(v:String);
(*Specifies the Person who edited the CreativeWork.*)
  function Get_editor:IPerson;
  procedure Set_editor(v:IPerson);
(*A media object that encodes this CreativeWork. This property is a synonym for 
encoding.*)
  function Get_associatedMedia:IMediaObject;
  procedure Set_associatedMedia(v:IMediaObject);
(*A thumbnail image relevant to the Thing.*)
  function Get_thumbnailUrl:String;
  procedure Set_thumbnailUrl(v:String);
(*Indicates that the CreativeWork contains a reference to, but is not 
necessarily about a concept.*)
  function Get_mentions:IThing;
  procedure Set_mentions(v:IThing);
(*Official rating of a piece of content&amp;#x2014;for example,'MPAA PG-13'.*)
  function Get_contentRating:String;
  procedure Set_contentRating(v:String);
(**)
  function Get_accessibilityHazard:String;
  procedure Set_accessibilityHazard(v:String);
(**)
  function Get_accessibilityAPI:String;
  procedure Set_accessibilityAPI(v:String);
(*The location where the CreativeWork was created, which may not be the same as 
the location depicted in the CreativeWork.*)
  function Get_locationCreated:IPlace;
  procedure Set_locationCreated(v:IPlace);
(*A secondary title of the CreativeWork.*)
  function Get_alternativeHeadline:String;
  procedure Set_alternativeHeadline(v:String);
(*Awards won by or for this item.*)
  function Get_awards:String;
  procedure Set_awards(v:String);
(*A media object that encodes this CreativeWork.*)
  function Get_encodings:IMediaObject;
  procedure Set_encodings(v:IMediaObject);
(*The person or organization who produced the work (e.g. music album, movie, 
tv/radio series etc.).*)
  function Get_producer:IPerson;
  procedure Set_producer(v:IPerson);
(**)
  function Get_accessibilityFeature:String;
  procedure Set_accessibilityFeature(v:String);
(*An embedded video object.*)
  function Get_video:IVideoObject;
  procedure Set_video(v:IVideoObject);
(*The place and time the release was issued, expressed as a PublicationEvent.*)
  function Get_releasedEvent:IPublicationEvent;
  procedure Set_releasedEvent(v:IPublicationEvent);
(*The purpose of a work in the context of education; for example, 'assignment', 
'group work'.*)
  function Get_educationalUse:String;
  procedure Set_educationalUse(v:String);
(*A resource that was used in the creation of this resource. This term can be 
repeated for multiple sources. For example, 
http://example.com/great-multiplication-intro.html.*)
  function Get_isBasedOnUrl:IProduct;
  procedure Set_isBasedOnUrl(v:IProduct);
(*The party holding the legal copyright to the CreativeWork.*)
  function Get_copyrightHolder:IOrganization;
  procedure Set_copyrightHolder(v:IOrganization);
(*A link to the page containing the comments of the CreativeWork.*)
  function Get_discussionUrl:String;
  procedure Set_discussionUrl(v:String);
(*The publishing division which published the comic.*)
  function Get_publisherImprint:IOrganization;
  procedure Set_publisherImprint(v:IOrganization);
(**)
  function Get_fileFormat:String;
  procedure Set_fileFormat(v:String);
(*The textual content of this CreativeWork.*)
  function Get_text:String;
  procedure Set_text(v:String);
(*A publication event associated with the item.*)
  function Get_publication:IPublicationEvent;
  procedure Set_publication(v:IPublicationEvent);
(*A license document that applies to this content, typically indicated by URL.*)
  function Get_license:String;
  procedure Set_license(v:String);
(*A list of single or combined accessModes that are sufficient to understand 
all the intellectual content of a resource. Expected values include:  auditory, 
tactile, textual, visual.*)
  function Get_accessModeSufficient:String;
  procedure Set_accessModeSufficient(v:String);
(*Keywords or tags used to describe this content. Multiple entries in a 
keywords list are typically delimited by commas.*)
  function Get_keywords:String;
  procedure Set_keywords(v:String);
(*The specific time described by a creative work, for works (e.g. articles, 
video objects etc.) that emphasise a particular moment within an Event.*)
  function Get_contentReferenceTime:TDateTime;
  procedure Set_contentReferenceTime(v:TDateTime);
(*A human-readable summary of specific accessibility features or deficiencies, 
consistent with the other accessibility metadata but expressing subtleties such 
as "short descriptions are present but long descriptions will be needed for 
non-visual users" or "short descriptions are present and no long descriptions 
are needed."*)
  function Get_accessibilitySummary:String;
  procedure Set_accessibilitySummary(v:String);
(*The version of the CreativeWork embodied by a specified resource.*)
  function Get_version:INumber;
  procedure Set_version(v:INumber);
(*Date of first broadcast/publication.*)
  function Get_datePublished:TDateTime;
  procedure Set_datePublished(v:TDateTime);
(*Approximate or typical time it takes to work with or through this learning 
resource for the typical intended target audience, e.g. 'P30M', 'P1H25M'.*)
  function Get_timeRequired:IDuration;
  procedure Set_timeRequired(v:IDuration);
(*An embedded audio object.*)
  function Get_audio:IAudioObject;
  procedure Set_audio(v:IAudioObject);
(*Indicates whether this content is family friendly.*)
  function Get_isFamilyFriendly:Boolean;
  procedure Set_isFamilyFriendly(v:Boolean);
(*The predominant mode of learning supported by the learning resource. 
Acceptable values are 'active', 'expositive', or 'mixed'.*)
  function Get_interactivityType:String;
  procedure Set_interactivityType(v:String);
(*An alignment to an established educational framework.*)
  function Get_educationalAlignment:IAlignmentObject;
  procedure Set_educationalAlignment(v:IAlignmentObject);
(*Link to page describing the editorial principles of the organization 
primarily responsible for the creation of the CreativeWork.*)
  function Get_publishingPrinciples:String;
  procedure Set_publishingPrinciples(v:String);
(**)
  function Get_accessibilityControl:String;
  procedure Set_accessibilityControl(v:String);
(*Specifies the Person that is legally accountable for the CreativeWork.*)
  function Get_accountablePerson:IPerson;
  procedure Set_accountablePerson(v:IPerson);
(*The human sensory perceptual system or cognitive faculty through which a 
person may process or perceive information. Expected values include: auditory, 
tactile, textual, visual, colorDependent, chartOnVisual, chemOnVisual, 
diagramOnVisual, mathOnVisual, musicOnVisual, textOnVisual.*)
  function Get_accessMode:String;
  procedure Set_accessMode(v:String);
(*The subject matter of the content.*)
  function Get_about:IThing;
  procedure Set_about(v:IThing);
(*The Organization on whose behalf the creator was working.*)
  function Get_sourceOrganization:IOrganization;
  procedure Set_sourceOrganization(v:IOrganization);
(*A citation or reference to another creative work, such as another 
publication, web page, scholarly article, etc.*)
  function Get_citation:ICreativeWork;
  procedure Set_citation(v:ICreativeWork);
(*Indicates (by URL or string) a particular version of a schema used in some 
CreativeWork. For example, a document could declare a schemaVersion using an 
URL such as http://schema.org/version/2.0/ if precise indication of schema 
version was required by some application.*)
  function Get_schemaVersion:String;
  procedure Set_schemaVersion(v:String);
(*The year during which the claimed copyright for the CreativeWork was first 
asserted.*)
  function Get_copyrightYear:INumber;
  procedure Set_copyrightYear(v:INumber);
(*The publisher of the creative work.*)
  function Get_publisher:IPerson;
  procedure Set_publisher(v:IPerson);
(*The predominant type or kind characterizing the learning resource. For 
example, 'presentation', 'handout'.*)
  function Get_learningResourceType:String;
  procedure Set_learningResourceType(v:String);
(*Fictional person connected with a creative work.*)
  function Get_character:IPerson;
  procedure Set_character(v:IPerson);
(*A creative work that this work is an example/instance/realization/derivation 
of.*)
  function Get_exampleOfWork:ICreativeWork;
  procedure Set_exampleOfWork(v:ICreativeWork);
(*A work that is a translation of the content of this work. e.g. 西遊記 has 
an English workTranslation “Journey to the West”,a German workTranslation 
“Monkeys Pilgerfahrt” and a Vietnamese  translation Tây du ký bình 
khảo.*)
  function Get_workTranslation:ICreativeWork;
  procedure Set_workTranslation(v:ICreativeWork);
(*The location depicted or described in the content. For example, the location 
in a photograph or painting.*)
  function Get_contentLocation:IPlace;
  procedure Set_contentLocation(v:IPlace);
// properties
  property commentCount:Integer read Get_commentCount write Set_commentCount;
  property reviews:IReview read Get_reviews write Set_reviews;
  property headline:String read Get_headline write Set_headline;
  property editor:IPerson read Get_editor write Set_editor;
  property associatedMedia:IMediaObject read Get_associatedMedia write Set_associatedMedia;
  property thumbnailUrl:String read Get_thumbnailUrl write Set_thumbnailUrl;
  property mentions:IThing read Get_mentions write Set_mentions;
  property contentRating:String read Get_contentRating write Set_contentRating;
  property accessibilityHazard:String read Get_accessibilityHazard write Set_accessibilityHazard;
  property accessibilityAPI:String read Get_accessibilityAPI write Set_accessibilityAPI;
  property locationCreated:IPlace read Get_locationCreated write Set_locationCreated;
  property alternativeHeadline:String read Get_alternativeHeadline write Set_alternativeHeadline;
  property awards:String read Get_awards write Set_awards;
  property encodings:IMediaObject read Get_encodings write Set_encodings;
  property producer:IPerson read Get_producer write Set_producer;
  property accessibilityFeature:String read Get_accessibilityFeature write Set_accessibilityFeature;
  property video:IVideoObject read Get_video write Set_video;
  property releasedEvent:IPublicationEvent read Get_releasedEvent write Set_releasedEvent;
  property educationalUse:String read Get_educationalUse write Set_educationalUse;
  property isBasedOnUrl:IProduct read Get_isBasedOnUrl write Set_isBasedOnUrl;
  property copyrightHolder:IOrganization read Get_copyrightHolder write Set_copyrightHolder;
  property discussionUrl:String read Get_discussionUrl write Set_discussionUrl;
  property publisherImprint:IOrganization read Get_publisherImprint write Set_publisherImprint;
  property fileFormat:String read Get_fileFormat write Set_fileFormat;
  property text:String read Get_text write Set_text;
  property publication:IPublicationEvent read Get_publication write Set_publication;
  property license:String read Get_license write Set_license;
  property accessModeSufficient:String read Get_accessModeSufficient write Set_accessModeSufficient;
  property keywords:String read Get_keywords write Set_keywords;
  property contentReferenceTime:TDateTime read Get_contentReferenceTime write Set_contentReferenceTime;
  property accessibilitySummary:String read Get_accessibilitySummary write Set_accessibilitySummary;
  property version:INumber read Get_version write Set_version;
  property datePublished:TDateTime read Get_datePublished write Set_datePublished;
  property timeRequired:IDuration read Get_timeRequired write Set_timeRequired;
  property audio:IAudioObject read Get_audio write Set_audio;
  property isFamilyFriendly:Boolean read Get_isFamilyFriendly write Set_isFamilyFriendly;
  property interactivityType:String read Get_interactivityType write Set_interactivityType;
  property educationalAlignment:IAlignmentObject read Get_educationalAlignment write Set_educationalAlignment;
  property publishingPrinciples:String read Get_publishingPrinciples write Set_publishingPrinciples;
  property accessibilityControl:String read Get_accessibilityControl write Set_accessibilityControl;
  property accountablePerson:IPerson read Get_accountablePerson write Set_accountablePerson;
  property accessMode:String read Get_accessMode write Set_accessMode;
  property about:IThing read Get_about write Set_about;
  property sourceOrganization:IOrganization read Get_sourceOrganization write Set_sourceOrganization;
  property citation:ICreativeWork read Get_citation write Set_citation;
  property schemaVersion:String read Get_schemaVersion write Set_schemaVersion;
  property copyrightYear:INumber read Get_copyrightYear write Set_copyrightYear;
  property publisher:IPerson read Get_publisher write Set_publisher;
  property learningResourceType:String read Get_learningResourceType write Set_learningResourceType;
  property character:IPerson read Get_character write Set_character;
  property exampleOfWork:ICreativeWork read Get_exampleOfWork write Set_exampleOfWork;
  property workTranslation:ICreativeWork read Get_workTranslation write Set_workTranslation;
  property contentLocation:IPlace read Get_contentLocation write Set_contentLocation;
end;
(*** end ICreativeWork ***)

IRating=interface; //forward


(* Review
A review of an item - for example, of a restaurant, movie, or store.
*)
IReview=Interface (ICreativeWork)
(**)
  function Get_reviewRating:IRating;
  procedure Set_reviewRating(v:IRating);
(*The item that is being reviewed/rated.*)
  function Get_itemReviewed:IThing;
  procedure Set_itemReviewed(v:IThing);
(*The actual body of the review.*)
  function Get_reviewBody:String;
  procedure Set_reviewBody(v:String);
// properties
  property reviewRating:IRating read Get_reviewRating write Set_reviewRating;
  property itemReviewed:IThing read Get_itemReviewed write Set_itemReviewed;
  property reviewBody:String read Get_reviewBody write Set_reviewBody;
end;
(*** end IReview ***)


(* Rating
A rating is an evaluation on a numeric scale, such as 1 to 5 stars.
*)
IRating=Interface (IIntangible)
(*The author of this content or rating. Please note that author is special in 
that HTML 5 provides a special mechanism for indicating authorship via the rel 
tag. That is equivalent to this and may be used interchangeably.*)
  function Get_author:IPerson;
  procedure Set_author(v:IPerson);
(*The rating for the content.*)
  function Get_ratingValue:String;
  procedure Set_ratingValue(v:String);
(*The lowest value allowed in this rating system. If worstRating is omitted, 1 
is assumed.*)
  function Get_worstRating:String;
  procedure Set_worstRating(v:String);
(*The highest value allowed in this rating system. If bestRating is omitted, 5 
is assumed.*)
  function Get_bestRating:INumber;
  procedure Set_bestRating(v:INumber);
// properties
  property author:IPerson read Get_author write Set_author;
  property ratingValue:String read Get_ratingValue write Set_ratingValue;
  property worstRating:String read Get_worstRating write Set_worstRating;
  property bestRating:INumber read Get_bestRating write Set_bestRating;
end;
(*** end IRating ***)

IContactPoint=interface; //forward

IPriceSpecification=interface; //forward

ICountry=interface; //forward

IEvent=interface; //forward

IEducationalOrganization=interface; //forward


(* Person
A person (alive, dead, undead, or fictional).
*)
IPerson=Interface (IThing)
(*The Value-added Tax ID of the organization or person.*)
  function Get_vatID:String;
  procedure Set_vatID(v:String);
(*The North American Industry Classification System (NAICS) code for a 
particular organization or business person.*)
  function Get_naics:String;
  procedure Set_naics(v:String);
(*A contact location for a person's place of work.*)
  function Get_workLocation:IContactPoint;
  procedure Set_workLocation(v:IContactPoint);
(*Given name. In the U.S., the first name of a Person. This can be used along 
with familyName instead of the name property.*)
  function Get_givenName:String;
  procedure Set_givenName(v:String);
(*The place where the person was born.*)
  function Get_birthPlace:IPlace;
  procedure Set_birthPlace(v:IPlace);
(*Date of death.*)
  function Get_deathDate:TDateTime;
  procedure Set_deathDate(v:TDateTime);
(*The most generic familial relation.*)
  function Get_relatedTo:IPerson;
  procedure Set_relatedTo(v:IPerson);
(*An honorific suffix preceding a Person's name such as M.D. /PhD/MSCSW.*)
  function Get_honorificSuffix:String;
  procedure Set_honorificSuffix(v:String);
(*The International Standard of Industrial Classification of All Economic 
Activities (ISIC), Revision 4 code for a particular organization, business 
person, or place.*)
  function Get_isicV4:String;
  procedure Set_isicV4(v:String);
(*The place where the person died.*)
  function Get_deathPlace:IPlace;
  procedure Set_deathPlace(v:IPlace);
(*A colleague of the person.*)
  function Get_colleagues:IPerson;
  procedure Set_colleagues(v:IPerson);
(*Organizations that the person works for.*)
  function Get_worksFor:IOrganization;
  procedure Set_worksFor(v:IOrganization);
(*An additional name for a Person, can be used for a middle name.*)
  function Get_additionalName:String;
  procedure Set_additionalName(v:String);
(*The most generic uni-directional social relation.*)
  function Get_follows:IPerson;
  procedure Set_follows(v:IPerson);
(*The person's spouse.*)
  function Get_spouse:IPerson;
  procedure Set_spouse(v:IPerson);
(*The most generic bi-directional social/work relation.*)
  function Get_knows:IPerson;
  procedure Set_knows(v:IPerson);
(*Date of birth.*)
  function Get_birthDate:TDateTime;
  procedure Set_birthDate(v:TDateTime);
(*Gender of the person. While http://schema.org/Male and 
http://schema.org/Female may be used, text strings are also acceptable for 
people who do not identify as a binary gender.*)
  function Get_gender:String;
  procedure Set_gender(v:String);
(*A sibling of the person.*)
  function Get_siblings:IPerson;
  procedure Set_siblings(v:IPerson);
(*A child of the person.*)
  function Get_children:IPerson;
  procedure Set_children(v:IPerson);
(*A person or organization that supports (sponsors) something through some kind 
of financial contribution.*)
  function Get_funder:IPerson;
  procedure Set_funder(v:IPerson);
(*An organization that this person is affiliated with. For example, a 
school/university, a club, or a team.*)
  function Get_affiliation:IOrganization;
  procedure Set_affiliation(v:IOrganization);
(*An honorific prefix preceding a Person's name such as Dr/Mrs/Mr.*)
  function Get_honorificPrefix:String;
  procedure Set_honorificPrefix(v:String);
(*The total financial value of the person as calculated by subtracting assets 
from liabilities.*)
  function Get_netWorth:IPriceSpecification;
  procedure Set_netWorth(v:IPriceSpecification);
(*Family name. In the U.S., the last name of an Person. This can be used along 
with givenName instead of the name property.*)
  function Get_familyName:String;
  procedure Set_familyName(v:String);
(*A parents of the person.*)
  function Get_parents:IPerson;
  procedure Set_parents(v:IPerson);
(*A contact location for a person's residence.*)
  function Get_homeLocation:IPlace;
  procedure Set_homeLocation(v:IPlace);
(*Nationality of the person.*)
  function Get_nationality:ICountry;
  procedure Set_nationality(v:ICountry);
(*The job title of the person (for example, Financial Manager).*)
  function Get_jobTitle:String;
  procedure Set_jobTitle(v:String);
(*Event that this person is a performer or participant in.*)
  function Get_performerIn:IEvent;
  procedure Set_performerIn(v:IEvent);
(*An organization that the person is an alumni of.*)
  function Get_alumniOf:IEducationalOrganization;
  procedure Set_alumniOf(v:IEducationalOrganization);
// properties
  property vatID:String read Get_vatID write Set_vatID;
  property naics:String read Get_naics write Set_naics;
  property workLocation:IContactPoint read Get_workLocation write Set_workLocation;
  property givenName:String read Get_givenName write Set_givenName;
  property birthPlace:IPlace read Get_birthPlace write Set_birthPlace;
  property deathDate:TDateTime read Get_deathDate write Set_deathDate;
  property relatedTo:IPerson read Get_relatedTo write Set_relatedTo;
  property honorificSuffix:String read Get_honorificSuffix write Set_honorificSuffix;
  property isicV4:String read Get_isicV4 write Set_isicV4;
  property deathPlace:IPlace read Get_deathPlace write Set_deathPlace;
  property colleagues:IPerson read Get_colleagues write Set_colleagues;
  property worksFor:IOrganization read Get_worksFor write Set_worksFor;
  property additionalName:String read Get_additionalName write Set_additionalName;
  property follows:IPerson read Get_follows write Set_follows;
  property spouse:IPerson read Get_spouse write Set_spouse;
  property knows:IPerson read Get_knows write Set_knows;
  property birthDate:TDateTime read Get_birthDate write Set_birthDate;
  property gender:String read Get_gender write Set_gender;
  property siblings:IPerson read Get_siblings write Set_siblings;
  property children:IPerson read Get_children write Set_children;
  property funder:IPerson read Get_funder write Set_funder;
  property affiliation:IOrganization read Get_affiliation write Set_affiliation;
  property honorificPrefix:String read Get_honorificPrefix write Set_honorificPrefix;
  property netWorth:IPriceSpecification read Get_netWorth write Set_netWorth;
  property familyName:String read Get_familyName write Set_familyName;
  property parents:IPerson read Get_parents write Set_parents;
  property homeLocation:IPlace read Get_homeLocation write Set_homeLocation;
  property nationality:ICountry read Get_nationality write Set_nationality;
  property jobTitle:String read Get_jobTitle write Set_jobTitle;
  property performerIn:IEvent read Get_performerIn write Set_performerIn;
  property alumniOf:IEducationalOrganization read Get_alumniOf write Set_alumniOf;
end;
(*** end IPerson ***)


(* StructuredValue
Structured values are used when the value of a property has a more complex 
structure than simply being a textual value or a reference to another thing.
*)
IStructuredValue=Interface (IIntangible)
  function TangStructuredValue:TangibleValue;
end;
(*** end IStructuredValue ***)

IContactPointOption=interface; //forward

IOpeningHoursSpecification=interface; //forward


(* ContactPoint
A contact point&amp;#x2014;for example, a Customer Complaints department.
*)
IContactPoint=Interface (IStructuredValue)
(**)
  function Get_availableLanguage:String;
  procedure Set_availableLanguage(v:String);
(*A person or organization can have different contact points, for different 
purposes. For example, a sales contact point, a PR contact point and so on. 
This property is used to specify the kind of contact point.*)
  function Get_contactType:String;
  procedure Set_contactType(v:String);
(*The product or service this support contact point is related to (such as 
product support for a particular product line). This can be a specific product 
or product line (e.g. "iPhone") or a general category of products or services 
(e.g. "smartphones").*)
  function Get_productSupported:String;
  procedure Set_productSupported(v:String);
(*An option available on this contact point (e.g. a toll-free number or support 
for hearing-impaired callers).*)
  function Get_contactOption:IContactPointOption;
  procedure Set_contactOption(v:IContactPointOption);
(*The hours during which this service or contact is available.*)
  function Get_hoursAvailable:IOpeningHoursSpecification;
  procedure Set_hoursAvailable(v:IOpeningHoursSpecification);
// properties
  property availableLanguage:String read Get_availableLanguage write Set_availableLanguage;
  property contactType:String read Get_contactType write Set_contactType;
  property productSupported:String read Get_productSupported write Set_productSupported;
  property contactOption:IContactPointOption read Get_contactOption write Set_contactOption;
  property hoursAvailable:IOpeningHoursSpecification read Get_hoursAvailable write Set_hoursAvailable;
end;
(*** end IContactPoint ***)


(* Enumeration
Lists or enumerations—for example, a list of cuisines or music genres, etc.
*)
IEnumeration=Interface (IIntangible)
  function TangEnumeration:TangibleValue;
end;
(*** end IEnumeration ***)


(* ContactPointOption
Enumerated options related to a ContactPoint.
*)
IContactPointOption=Interface (IEnumeration)
  function TangContactPointOption:TangibleValue;
end;
(*** end IContactPointOption ***)

IDayOfWeek=interface; //forward


(* OpeningHoursSpecification
*)
IOpeningHoursSpecification=Interface (IStructuredValue)
(*The opening hour of the place or service on the given day(s) of the week.*)
  function Get_opens:TDateTime;
  procedure Set_opens(v:TDateTime);
(*The day of the week for which these opening hours are valid.*)
  function Get_dayOfWeek:IDayOfWeek;
  procedure Set_dayOfWeek(v:IDayOfWeek);
(*The closing hour of the place or service on the given day(s) of the week.*)
  function Get_closes:TDateTime;
  procedure Set_closes(v:TDateTime);
// properties
  property opens:TDateTime read Get_opens write Set_opens;
  property dayOfWeek:IDayOfWeek read Get_dayOfWeek write Set_dayOfWeek;
  property closes:TDateTime read Get_closes write Set_closes;
end;
(*** end IOpeningHoursSpecification ***)


(* DayOfWeek
*)
IDayOfWeek=Interface (IEnumeration)
  function TangDayOfWeek:TangibleValue;
end;
(*** end IDayOfWeek ***)

IGeoShape=interface; //forward

IImageObject=interface; //forward


(* Place
Entities that have a somewhat fixed, physical extension.
*)
IPlace=Interface (IThing)
(*A URL to a map of the place.*)
  function Get_map:String;
  procedure Set_map(v:String);
(*A URL to a map of the place.*)
  function Get_maps:String;
  procedure Set_maps(v:String);
(*The opening hours of a certain place.*)
  function Get_openingHoursSpecification:IOpeningHoursSpecification;
  procedure Set_openingHoursSpecification(v:IOpeningHoursSpecification);
(*The geo coordinates of the place.*)
  function Get_geo:IGeoShape;
  procedure Set_geo(v:IGeoShape);
(*The fax number.*)
  function Get_faxNumber:String;
  procedure Set_faxNumber(v:String);
(**)
  function Get_specialOpeningHoursSpecification:IOpeningHoursSpecification;
  procedure Set_specialOpeningHoursSpecification(v:IOpeningHoursSpecification);
(*The telephone number.*)
  function Get_telephone:String;
  procedure Set_telephone(v:String);
(**)
  function Get_branchCode:String;
  procedure Set_branchCode(v:String);
(*The total number of individuals that may attend an event or venue.*)
  function Get_maximumAttendeeCapacity:Integer;
  procedure Set_maximumAttendeeCapacity(v:Integer);
(*Photographs of this place.*)
  function Get_photos:IImageObject;
  procedure Set_photos(v:IImageObject);
(*Indicates whether it is allowed to smoke in the place, e.g. in the 
restaurant, hotel or hotel room.*)
  function Get_smokingAllowed:Boolean;
  procedure Set_smokingAllowed(v:Boolean);
(*The basic containment relation between a place and one that contains it.*)
  function Get_containedIn:IPlace;
  procedure Set_containedIn(v:IPlace);
(*The basic containment relation between a place and another that it contains.*)
  function Get_containsPlace:IPlace;
  procedure Set_containsPlace(v:IPlace);
// properties
  property map:String read Get_map write Set_map;
  property maps:String read Get_maps write Set_maps;
  property openingHoursSpecification:IOpeningHoursSpecification read Get_openingHoursSpecification write Set_openingHoursSpecification;
  property geo:IGeoShape read Get_geo write Set_geo;
  property faxNumber:String read Get_faxNumber write Set_faxNumber;
  property specialOpeningHoursSpecification:IOpeningHoursSpecification read Get_specialOpeningHoursSpecification write Set_specialOpeningHoursSpecification;
  property telephone:String read Get_telephone write Set_telephone;
  property branchCode:String read Get_branchCode write Set_branchCode;
  property maximumAttendeeCapacity:Integer read Get_maximumAttendeeCapacity write Set_maximumAttendeeCapacity;
  property photos:IImageObject read Get_photos write Set_photos;
  property smokingAllowed:Boolean read Get_smokingAllowed write Set_smokingAllowed;
  property containedIn:IPlace read Get_containedIn write Set_containedIn;
  property containsPlace:IPlace read Get_containsPlace write Set_containsPlace;
end;
(*** end IPlace ***)

IPostalAddress=interface; //forward


(* GeoShape
The geographic shape of a place. A GeoShape can be described using several 
properties whose values are based on latitude/longitude pairs. Either 
whitespace or commas can be used to separate latitude and longitude; whitespace 
should be used when writing a list of several such points.
*)
IGeoShape=Interface (IStructuredValue)
(**)
  function Get_addressCountry:ICountry;
  procedure Set_addressCountry(v:ICountry);
(*A polygon is the area enclosed by a point-to-point path for which the 
starting and ending points are the same. A polygon is expressed as a series of 
four or more space delimited points where the first and final points are 
identical.*)
  function Get_polygon:String;
  procedure Set_polygon(v:String);
(*Physical address of the item.*)
  function Get_address:IPostalAddress;
  procedure Set_address(v:IPostalAddress);
(*A line is a point-to-point path consisting of two or more points. A line is 
expressed as a series of two or more point objects separated by space.*)
  function Get_line:String;
  procedure Set_line(v:String);
(*A circle is the circular region of a specified radius centered at a specified 
latitude and longitude. A circle is expressed as a pair followed by a radius in 
meters.*)
  function Get_circle:String;
  procedure Set_circle(v:String);
(**)
  function Get_elevation:INumber;
  procedure Set_elevation(v:INumber);
(*A box is the area enclosed by the rectangle formed by two points. The first 
point is the lower corner, the second point is the upper corner. A box is 
expressed as two points separated by a space character.*)
  function Get_box:String;
  procedure Set_box(v:String);
// properties
  property addressCountry:ICountry read Get_addressCountry write Set_addressCountry;
  property polygon:String read Get_polygon write Set_polygon;
  property address:IPostalAddress read Get_address write Set_address;
  property line:String read Get_line write Set_line;
  property circle:String read Get_circle write Set_circle;
  property elevation:INumber read Get_elevation write Set_elevation;
  property box:String read Get_box write Set_box;
end;
(*** end IGeoShape ***)


(* AdministrativeArea
A geographical region, typically under the jurisdiction of a particular 
government.
*)
IAdministrativeArea=Interface (IPlace)
 (*No atribs*)
end;
(*** end IAdministrativeArea ***)


(* Country
A country.
*)
ICountry=Interface (IAdministrativeArea)
 (*No atribs*)
end;
(*** end ICountry ***)


(* PostalAddress
The mailing address.
*)
IPostalAddress=Interface (IContactPoint)
(*The region. For example, CA.*)
  function Get_addressRegion:String;
  procedure Set_addressRegion(v:String);
(*The street address. For example, 1600 Amphitheatre Pkwy.*)
  function Get_streetAddress:String;
  procedure Set_streetAddress(v:String);
(*The post office box number for PO box addresses.*)
  function Get_postOfficeBoxNumber:String;
  procedure Set_postOfficeBoxNumber(v:String);
(*The locality. For example, Mountain View.*)
  function Get_addressLocality:String;
  procedure Set_addressLocality(v:String);
// properties
  property addressRegion:String read Get_addressRegion write Set_addressRegion;
  property streetAddress:String read Get_streetAddress write Set_streetAddress;
  property postOfficeBoxNumber:String read Get_postOfficeBoxNumber write Set_postOfficeBoxNumber;
  property addressLocality:String read Get_addressLocality write Set_addressLocality;
end;
(*** end IPostalAddress ***)


(* Number
Data type: Number.
*)
INumber=Interface
 (*No atribs*)
end;
(*** end INumber ***)

INewsArticle=interface; //forward


(* MediaObject
A media object, such as an image, video, or audio object embedded in a web page 
or a downloadable dataset i.e. DataDownload. Note that a creative work may have 
many media objects associated with it on the same web page. For example, a page 
about a single song (MusicRecording) may have a music video (VideoObject), and 
a high and low bandwidth audio stream (2 AudioObject's).
*)
IMediaObject=Interface (ICreativeWork)
(*mp3, mpeg4, etc.*)
  function Get_encodingFormat:String;
  procedure Set_encodingFormat(v:String);
(*The bitrate of the media object.*)
  function Get_bitrate:String;
  procedure Set_bitrate(v:String);
(**)
  function Get_regionsAllowed:IPlace;
  procedure Set_regionsAllowed(v:IPlace);
(*Date the content expires and is no longer useful or available. Useful for 
videos.*)
  function Get_expires:TDateTime;
  procedure Set_expires(v:TDateTime);
(**)
  function Get_requiresSubscription:Boolean;
  procedure Set_requiresSubscription(v:Boolean);
(*Date when this media object was uploaded to this site.*)
  function Get_uploadDate:TDateTime;
  procedure Set_uploadDate(v:TDateTime);
(*A NewsArticle associated with the Media Object.*)
  function Get_associatedArticle:INewsArticle;
  procedure Set_associatedArticle(v:INewsArticle);
(*The CreativeWork encoded by this media object.*)
  function Get_encodesCreativeWork:ICreativeWork;
  procedure Set_encodesCreativeWork(v:ICreativeWork);
(*Actual bytes of the media object, for example the image file or video file.*)
  function Get_contentUrl:String;
  procedure Set_contentUrl(v:String);
(**)
  function Get_embedUrl:String;
  procedure Set_embedUrl(v:String);
(*Player type required&amp;#x2014;for example, Flash or Silverlight.*)
  function Get_playerType:String;
  procedure Set_playerType(v:String);
(*File size in (mega/kilo) bytes.*)
  function Get_contentSize:String;
  procedure Set_contentSize(v:String);
// properties
  property encodingFormat:String read Get_encodingFormat write Set_encodingFormat;
  property bitrate:String read Get_bitrate write Set_bitrate;
  property regionsAllowed:IPlace read Get_regionsAllowed write Set_regionsAllowed;
  property expires:TDateTime read Get_expires write Set_expires;
  property requiresSubscription:Boolean read Get_requiresSubscription write Set_requiresSubscription;
  property uploadDate:TDateTime read Get_uploadDate write Set_uploadDate;
  property associatedArticle:INewsArticle read Get_associatedArticle write Set_associatedArticle;
  property encodesCreativeWork:ICreativeWork read Get_encodesCreativeWork write Set_encodesCreativeWork;
  property contentUrl:String read Get_contentUrl write Set_contentUrl;
  property embedUrl:String read Get_embedUrl write Set_embedUrl;
  property playerType:String read Get_playerType write Set_playerType;
  property contentSize:String read Get_contentSize write Set_contentSize;
end;
(*** end IMediaObject ***)


(* Article
*)
IArticle=Interface (ICreativeWork)
(*The number of words in the text of the Article.*)
  function Get_wordCount:Integer;
  procedure Set_wordCount(v:Integer);
(*The page on which the work ends; for example "138" or "xvi".*)
  function Get_pageEnd:String;
  procedure Set_pageEnd(v:String);
(*Articles may belong to one or more 'sections' in a magazine or newspaper, 
such as Sports, Lifestyle, etc.*)
  function Get_articleSection:String;
  procedure Set_articleSection(v:String);
(*The actual body of the article.*)
  function Get_articleBody:String;
  procedure Set_articleBody(v:String);
// properties
  property wordCount:Integer read Get_wordCount write Set_wordCount;
  property pageEnd:String read Get_pageEnd write Set_pageEnd;
  property articleSection:String read Get_articleSection write Set_articleSection;
  property articleBody:String read Get_articleBody write Set_articleBody;
end;
(*** end IArticle ***)


(* NewsArticle
A news article.
*)
INewsArticle=Interface (IArticle)
(*The edition of the print product in which the NewsArticle appears.*)
  function Get_printEdition:String;
  procedure Set_printEdition(v:String);
(*The number of the column in which the NewsArticle appears in the print 
edition.*)
  function Get_printColumn:String;
  procedure Set_printColumn(v:String);
(*If this NewsArticle appears in print, this field indicates the name of the 
page on which the article is found. Please note that this field is intended for 
the exact page name (e.g. A5, B18).*)
  function Get_printPage:String;
  procedure Set_printPage(v:String);
(*If this NewsArticle appears in print, this field indicates the print section 
in which the article appeared.*)
  function Get_printSection:String;
  procedure Set_printSection(v:String);
(*The location where the NewsArticle was produced.*)
  function Get_dateline:String;
  procedure Set_dateline(v:String);
// properties
  property printEdition:String read Get_printEdition write Set_printEdition;
  property printColumn:String read Get_printColumn write Set_printColumn;
  property printPage:String read Get_printPage write Set_printPage;
  property printSection:String read Get_printSection write Set_printSection;
  property dateline:String read Get_dateline write Set_dateline;
end;
(*** end INewsArticle ***)


(* ImageObject
An image file.
*)
IImageObject=Interface (IMediaObject)
(*The caption for this object.*)
  function Get_caption:String;
  procedure Set_caption(v:String);
(*exif data for this object.*)
  function Get_exifData:String;
  procedure Set_exifData(v:String);
(*Indicates whether this image is representative of the content of the page.*)
  function Get_representativeOfPage:Boolean;
  procedure Set_representativeOfPage(v:Boolean);
// properties
  property caption:String read Get_caption write Set_caption;
  property exifData:String read Get_exifData write Set_exifData;
  property representativeOfPage:Boolean read Get_representativeOfPage write Set_representativeOfPage;
end;
(*** end IImageObject ***)

IOfferCatalog=interface; //forward

IDemand=interface; //forward

IOffer=interface; //forward


(* Organization
An organization such as a school, NGO, corporation, club, etc.
*)
IOrganization=Interface (IThing)
(*Email address.*)
  function Get_email:String;
  procedure Set_email(v:String);
(*Indicates an OfferCatalog listing for this Organization, Person, or Service.*)
  function Get_hasOfferCatalog:IOfferCatalog;
  procedure Set_hasOfferCatalog(v:IOfferCatalog);
(*An organization identifier that uniquely identifies a legal entity as defined 
in ISO 17442.*)
  function Get_leiCode:String;
  procedure Set_leiCode(v:String);
(*Products owned by the organization or person.*)
  function Get_owns:IProduct;
  procedure Set_owns(v:IProduct);
(*A person who founded this organization.*)
  function Get_founders:IPerson;
  procedure Set_founders(v:IPerson);
(*A member of this organization.*)
  function Get_members:IOrganization;
  procedure Set_members(v:IOrganization);
(*Points-of-Sales operated by the organization or person.*)
  function Get_hasPOS:IPlace;
  procedure Set_hasPOS(v:IPlace);
(*The date that this organization was dissolved.*)
  function Get_dissolutionDate:TDateTime;
  procedure Set_dissolutionDate(v:TDateTime);
(*An associated logo.*)
  function Get_logo:IImageObject;
  procedure Set_logo(v:IImageObject);
(*The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or 
the CIF/NIF in Spain.*)
  function Get_taxID:String;
  procedure Set_taxID(v:String);
(*The brand(s) associated with a product or service, or the brand(s) maintained 
by an organization or business person.*)
  function Get_brand:IOrganization;
  procedure Set_brand(v:IOrganization);
(**)
  function Get_globalLocationNumber:String;
  procedure Set_globalLocationNumber(v:String);
(*The Dun &amp;amp; Bradstreet DUNS number for identifying an organization or 
business person.*)
  function Get_duns:String;
  procedure Set_duns(v:String);
(*The date that this organization was founded.*)
  function Get_foundingDate:TDateTime;
  procedure Set_foundingDate(v:TDateTime);
(*Upcoming or past events associated with this place or organization.*)
  function Get_events:IEvent;
  procedure Set_events(v:IEvent);
(*People working for this organization.*)
  function Get_employees:IPerson;
  procedure Set_employees(v:IPerson);
(*The official name of the organization, e.g. the registered company name.*)
  function Get_legalName:String;
  procedure Set_legalName(v:String);
(*A relationship between an organization and a department of that organization, 
also described as an organization (allowing different urls, logos, opening 
hours). For example: a store with a pharmacy, or a bakery with a cafe.*)
  function Get_department:IOrganization;
  procedure Set_department(v:IOrganization);
(*A pointer to products or services sought by the organization or person 
(demand).*)
  function Get_seeks:IDemand;
  procedure Set_seeks(v:IDemand);
(*A contact point for a person or organization.*)
  function Get_contactPoints:IContactPoint;
  procedure Set_contactPoints(v:IContactPoint);
(*The place where the Organization was founded.*)
  function Get_foundingLocation:IPlace;
  procedure Set_foundingLocation(v:IPlace);
(*A relationship between two organizations where the first includes the second, 
e.g., as a subsidiary. See also: the more specific 'department' property.*)
  function Get_subOrganization:IOrganization;
  procedure Set_subOrganization(v:IOrganization);
(*A pointer to products or services offered by the organization or person.*)
  function Get_makesOffer:IOffer;
  procedure Set_makesOffer(v:IOffer);
// properties
  property email:String read Get_email write Set_email;
  property hasOfferCatalog:IOfferCatalog read Get_hasOfferCatalog write Set_hasOfferCatalog;
  property leiCode:String read Get_leiCode write Set_leiCode;
  property owns:IProduct read Get_owns write Set_owns;
  property founders:IPerson read Get_founders write Set_founders;
  property members:IOrganization read Get_members write Set_members;
  property hasPOS:IPlace read Get_hasPOS write Set_hasPOS;
  property dissolutionDate:TDateTime read Get_dissolutionDate write Set_dissolutionDate;
  property logo:IImageObject read Get_logo write Set_logo;
  property taxID:String read Get_taxID write Set_taxID;
  property brand:IOrganization read Get_brand write Set_brand;
  property globalLocationNumber:String read Get_globalLocationNumber write Set_globalLocationNumber;
  property duns:String read Get_duns write Set_duns;
  property foundingDate:TDateTime read Get_foundingDate write Set_foundingDate;
  property events:IEvent read Get_events write Set_events;
  property employees:IPerson read Get_employees write Set_employees;
  property legalName:String read Get_legalName write Set_legalName;
  property department:IOrganization read Get_department write Set_department;
  property seeks:IDemand read Get_seeks write Set_seeks;
  property contactPoints:IContactPoint read Get_contactPoints write Set_contactPoints;
  property foundingLocation:IPlace read Get_foundingLocation write Set_foundingLocation;
  property subOrganization:IOrganization read Get_subOrganization write Set_subOrganization;
  property makesOffer:IOffer read Get_makesOffer write Set_makesOffer;
end;
(*** end IOrganization ***)


(* ItemList
A list of items of any sort&amp;#x2014;for example, Top 10 Movies About 
Weathermen, or Top 100 Party Songs. Not to be confused with HTML lists, which 
are often used only for formatting.
*)
IItemList=Interface (IIntangible)
(*The number of items in an ItemList. Note that some descriptions might not 
fully describe all items in a list (e.g., multi-page pagination); in such 
cases, the numberOfItems would be for the entire list.*)
  function Get_numberOfItems:Integer;
  procedure Set_numberOfItems(v:Integer);
(*Type of ordering (e.g. Ascending, Descending, Unordered).*)
  function Get_itemListOrder:String;
  procedure Set_itemListOrder(v:String);
(**)
  function Get_itemListElement:IThing;
  procedure Set_itemListElement(v:IThing);
// properties
  property numberOfItems:Integer read Get_numberOfItems write Set_numberOfItems;
  property itemListOrder:String read Get_itemListOrder write Set_itemListOrder;
  property itemListElement:IThing read Get_itemListElement write Set_itemListElement;
end;
(*** end IItemList ***)


(* OfferCatalog
An OfferCatalog is an ItemList that contains related Offers and/or further 
OfferCatalogs that are offeredBy the same provider.
*)
IOfferCatalog=Interface (IItemList)
  function TangOfferCatalog:TangibleValue;
end;
(*** end IOfferCatalog ***)

IProductModel=interface; //forward

IService=interface; //forward

IQuantitativeValue=interface; //forward


(* Product
Any offered product or service. For example: a pair of shoes; a concert ticket; 
the rental of a car; a haircut; or an episode of a TV show streamed online.
*)
IProduct=Interface (IThing)
(*The color of the product.*)
  function Get_color:String;
  procedure Set_color(v:String);
(*The release date of a product or product model. This can be used to 
distinguish the exact variant of a product.*)
  function Get_releaseDate:TDateTime;
  procedure Set_releaseDate(v:TDateTime);
(*The model of the product. Use with the URL of a ProductModel or a textual 
representation of the model identifier. The URL of the ProductModel can be from 
an external source. It is recommended to additionally provide strong product 
identifiers via the gtin8/gtin13/gtin14 and mpn properties.*)
  function Get_model:IProductModel;
  procedure Set_model(v:IProductModel);
(*A category for the item. Greater signs or slashes can be used to informally 
indicate a category hierarchy.*)
  function Get_category:IThing;
  procedure Set_category(v:IThing);
(*A pointer to another product (or multiple products) for which this product is 
an accessory or spare part.*)
  function Get_isAccessoryOrSparePartFor:IProduct;
  procedure Set_isAccessoryOrSparePartFor(v:IProduct);
(**)
  function Get_gtin8:String;
  procedure Set_gtin8(v:String);
(*A pointer to another, functionally similar product (or multiple products).*)
  function Get_isSimilarTo:IService;
  procedure Set_isSimilarTo(v:IService);
(*The weight of the product or person.*)
  function Get_weight:IQuantitativeValue;
  procedure Set_weight(v:IQuantitativeValue);
(*A pointer to another product (or multiple products) for which this product is 
a consumable.*)
  function Get_isConsumableFor:IProduct;
  procedure Set_isConsumableFor(v:IProduct);
(**)
  function Get_gtin12:String;
  procedure Set_gtin12(v:String);
(**)
  function Get_productID:String;
  procedure Set_productID(v:String);
// properties
  property color:String read Get_color write Set_color;
  property releaseDate:TDateTime read Get_releaseDate write Set_releaseDate;
  property model:IProductModel read Get_model write Set_model;
  property category:IThing read Get_category write Set_category;
  property isAccessoryOrSparePartFor:IProduct read Get_isAccessoryOrSparePartFor write Set_isAccessoryOrSparePartFor;
  property gtin8:String read Get_gtin8 write Set_gtin8;
  property isSimilarTo:IService read Get_isSimilarTo write Set_isSimilarTo;
  property weight:IQuantitativeValue read Get_weight write Set_weight;
  property isConsumableFor:IProduct read Get_isConsumableFor write Set_isConsumableFor;
  property gtin12:String read Get_gtin12 write Set_gtin12;
  property productID:String read Get_productID write Set_productID;
end;
(*** end IProduct ***)


(* ProductModel
A datasheet or vendor specification of a product (in the sense of a 
prototypical description).
*)
IProductModel=Interface (IProduct)
(*A pointer from a previous, often discontinued variant of the product to its 
newer variant.*)
  function Get_predecessorOf:IProductModel;
  procedure Set_predecessorOf(v:IProductModel);
(*A pointer to a base product from which this product is a variant. It is safe 
to infer that the variant inherits all product features from the base model, 
unless defined locally. This is not transitive.*)
  function Get_isVariantOf:IProductModel;
  procedure Set_isVariantOf(v:IProductModel);
(*A pointer from a newer variant of a product  to its previous, often 
discontinued predecessor.*)
  function Get_successorOf:IProductModel;
  procedure Set_successorOf(v:IProductModel);
// properties
  property predecessorOf:IProductModel read Get_predecessorOf write Set_predecessorOf;
  property isVariantOf:IProductModel read Get_isVariantOf write Set_isVariantOf;
  property successorOf:IProductModel read Get_successorOf write Set_successorOf;
end;
(*** end IProductModel ***)

IAudience=interface; //forward

IServiceChannel=interface; //forward


(* Service
A service provided by an organization, e.g. delivery service, print services, 
etc.
*)
IService=Interface (IIntangible)
(*A pointer to another, somehow related product (or multiple products).*)
  function Get_isRelatedTo:IService;
  procedure Set_isRelatedTo(v:IService);
(*The tangible thing generated by the service, e.g. a passport, permit, etc.*)
  function Get_produces:IThing;
  procedure Set_produces(v:IThing);
(*The audience eligible for this service.*)
  function Get_serviceAudience:IAudience;
  procedure Set_serviceAudience(v:IAudience);
(*Indicates the mobility of a provided service (e.g. 'static', 'dynamic').*)
  function Get_providerMobility:String;
  procedure Set_providerMobility(v:String);
(*A means of accessing the service (e.g. a phone bank, a web site, a location, 
etc.).*)
  function Get_availableChannel:IServiceChannel;
  procedure Set_availableChannel(v:IServiceChannel);
(*The type of service being offered, e.g. veterans' benefits, emergency relief, 
etc.*)
  function Get_serviceType:String;
  procedure Set_serviceType(v:String);
// properties
  property isRelatedTo:IService read Get_isRelatedTo write Set_isRelatedTo;
  property produces:IThing read Get_produces write Set_produces;
  property serviceAudience:IAudience read Get_serviceAudience write Set_serviceAudience;
  property providerMobility:String read Get_providerMobility write Set_providerMobility;
  property availableChannel:IServiceChannel read Get_availableChannel write Set_availableChannel;
  property serviceType:String read Get_serviceType write Set_serviceType;
end;
(*** end IService ***)


(* Audience
Intended audience for an item, i.e. the group for whom the item was created.
*)
IAudience=Interface (IIntangible)
(*The target group associated with a given audience (e.g. veterans, car owners, 
musicians, etc.).*)
  function Get_audienceType:String;
  procedure Set_audienceType(v:String);
(*The geographic area associated with the audience.*)
  function Get_geographicArea:IAdministrativeArea;
  procedure Set_geographicArea(v:IAdministrativeArea);
// properties
  property audienceType:String read Get_audienceType write Set_audienceType;
  property geographicArea:IAdministrativeArea read Get_geographicArea write Set_geographicArea;
end;
(*** end IAudience ***)


(* ServiceChannel
A means for accessing a service, e.g. a government office location, web site, 
or phone number.
*)
IServiceChannel=Interface (IIntangible)
(*The phone number to use to access the service.*)
  function Get_servicePhone:IContactPoint;
  procedure Set_servicePhone(v:IContactPoint);
(*The location (e.g. civic structure, local business, etc.) where a person can 
go to access the service.*)
  function Get_serviceLocation:IPlace;
  procedure Set_serviceLocation(v:IPlace);
(*The number to access the service by text message.*)
  function Get_serviceSmsNumber:IContactPoint;
  procedure Set_serviceSmsNumber(v:IContactPoint);
(*The website to access the service.*)
  function Get_serviceUrl:String;
  procedure Set_serviceUrl(v:String);
(*The address for accessing the service by mail.*)
  function Get_servicePostalAddress:IPostalAddress;
  procedure Set_servicePostalAddress(v:IPostalAddress);
(*The service provided by this channel.*)
  function Get_providesService:IService;
  procedure Set_providesService(v:IService);
(*Estimated processing time for the service using this channel.*)
  function Get_processingTime:IDuration;
  procedure Set_processingTime(v:IDuration);
// properties
  property servicePhone:IContactPoint read Get_servicePhone write Set_servicePhone;
  property serviceLocation:IPlace read Get_serviceLocation write Set_serviceLocation;
  property serviceSmsNumber:IContactPoint read Get_serviceSmsNumber write Set_serviceSmsNumber;
  property serviceUrl:String read Get_serviceUrl write Set_serviceUrl;
  property servicePostalAddress:IPostalAddress read Get_servicePostalAddress write Set_servicePostalAddress;
  property providesService:IService read Get_providesService write Set_providesService;
  property processingTime:IDuration read Get_processingTime write Set_processingTime;
end;
(*** end IServiceChannel ***)


(* Quantity
Quantities such as distance, time, mass, weight, etc. Particular instances of 
say Mass are entities like '3 Kg' or '4 milligrams'.
*)
IQuantity=Interface (IIntangible)
  function TangQuantity:TangibleValue;
end;
(*** end IQuantity ***)


(* Duration
*)
IDuration=Interface (IQuantity)
  function TangDuration:TangibleValue;
end;
(*** end IDuration ***)


(* QuantitativeValue
A point value or interval for product characteristics and other purposes.
*)
IQuantitativeValue=Interface (IStructuredValue)
(*The upper value of some characteristic or property.*)
  function Get_maxValue:INumber;
  procedure Set_maxValue(v:INumber);
(*A pointer to a secondary value that provides additional information on the 
original value, e.g. a reference temperature.*)
  function Get_valueReference:IQuantitativeValue;
  procedure Set_valueReference(v:IQuantitativeValue);
(**)
  function Get_unitText:String;
  procedure Set_unitText(v:String);
// properties
  property maxValue:INumber read Get_maxValue write Set_maxValue;
  property valueReference:IQuantitativeValue read Get_valueReference write Set_valueReference;
  property unitText:String read Get_unitText write Set_unitText;
end;
(*** end IQuantitativeValue ***)

IEventStatusType=interface; //forward


(* Event
*)
IEvent=Interface (IThing)
(*An eventStatus of an event represents its status; particularly useful when an 
event is cancelled or rescheduled.*)
  function Get_eventStatus:IEventStatusType;
  procedure Set_eventStatus(v:IEventStatusType);
(*A person attending the event.*)
  function Get_attendees:IOrganization;
  procedure Set_attendees(v:IOrganization);
(*The person or organization who wrote a composition, or who is the composer of 
a work performed at some event.*)
  function Get_composer:IOrganization;
  procedure Set_composer(v:IOrganization);
(**)
  function Get_startDate:TDateTime;
  procedure Set_startDate(v:TDateTime);
(*Used in conjunction with eventStatus for rescheduled or cancelled events. 
This property contains the previously scheduled start date. For rescheduled 
events, the startDate property should be used for the newly scheduled start 
date. In the (rare) case of an event that has been postponed and rescheduled 
multiple times, this field may be repeated.*)
  function Get_previousStartDate:TDateTime;
  procedure Set_previousStartDate(v:TDateTime);
(*The main performer or performers of the event&amp;#x2014;for example, a 
presenter, musician, or actor.*)
  function Get_performers:IPerson;
  procedure Set_performers(v:IPerson);
(*Events that are a part of this event. For example, a conference event 
includes many presentations, each subEvents of the conference.*)
  function Get_subEvents:IEvent;
  procedure Set_subEvents(v:IEvent);
(*A secondary contributor to the CreativeWork or Event.*)
  function Get_contributor:IOrganization;
  procedure Set_contributor(v:IOrganization);
(*An organizer of an Event.*)
  function Get_organizer:IOrganization;
  procedure Set_organizer(v:IOrganization);
(*The typical expected age range, e.g. '7-9', '11-'.*)
  function Get_typicalAgeRange:String;
  procedure Set_typicalAgeRange(v:String);
(*An offer to provide this item&amp;#x2014;for example, an offer to sell a 
product, rent the DVD of a movie, perform a service, or give away tickets to an 
event.*)
  function Get_offers:IOffer;
  procedure Set_offers(v:IOffer);
(*The number of attendee places for an event that remain unallocated.*)
  function Get_remainingAttendeeCapacity:Integer;
  procedure Set_remainingAttendeeCapacity(v:Integer);
(*A work performed in some event, for example a play performed in a 
TheaterEvent.*)
  function Get_workPerformed:ICreativeWork;
  procedure Set_workPerformed(v:ICreativeWork);
(*The time admission will commence.*)
  function Get_doorTime:TDateTime;
  procedure Set_doorTime(v:TDateTime);
(*An event that this event is a part of. For example, a collection of 
individual music performances might each have a music festival as their 
superEvent.*)
  function Get_superEvent:IEvent;
  procedure Set_superEvent(v:IEvent);
(*The CreativeWork that captured all or part of this Event.*)
  function Get_recordedIn:ICreativeWork;
  procedure Set_recordedIn(v:ICreativeWork);
// properties
  property eventStatus:IEventStatusType read Get_eventStatus write Set_eventStatus;
  property attendees:IOrganization read Get_attendees write Set_attendees;
  property composer:IOrganization read Get_composer write Set_composer;
  property startDate:TDateTime read Get_startDate write Set_startDate;
  property previousStartDate:TDateTime read Get_previousStartDate write Set_previousStartDate;
  property performers:IPerson read Get_performers write Set_performers;
  property subEvents:IEvent read Get_subEvents write Set_subEvents;
  property contributor:IOrganization read Get_contributor write Set_contributor;
  property organizer:IOrganization read Get_organizer write Set_organizer;
  property typicalAgeRange:String read Get_typicalAgeRange write Set_typicalAgeRange;
  property offers:IOffer read Get_offers write Set_offers;
  property remainingAttendeeCapacity:Integer read Get_remainingAttendeeCapacity write Set_remainingAttendeeCapacity;
  property workPerformed:ICreativeWork read Get_workPerformed write Set_workPerformed;
  property doorTime:TDateTime read Get_doorTime write Set_doorTime;
  property superEvent:IEvent read Get_superEvent write Set_superEvent;
  property recordedIn:ICreativeWork read Get_recordedIn write Set_recordedIn;
end;
(*** end IEvent ***)


(* EventStatusType
EventStatusType is an enumeration type whose instances represent several states 
that an Event may be in.
*)
IEventStatusType=Interface (IEnumeration)
  function TangEventStatusType:TangibleValue;
end;
(*** end IEventStatusType ***)

IAggregateRating=interface; //forward

IDeliveryMethod=interface; //forward

IPaymentMethod=interface; //forward


(* Offer
*)
IOffer=Interface (IIntangible)
(*The overall rating, based on a collection of reviews or ratings, of the 
item.*)
  function Get_aggregateRating:IAggregateRating;
  procedure Set_aggregateRating(v:IAggregateRating);
(*The beginning of the availability of the product or service included in the 
offer.*)
  function Get_availabilityStarts:TDateTime;
  procedure Set_availabilityStarts(v:TDateTime);
(*The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a 
product or service, or the product to which the offer refers.*)
  function Get_sku:String;
  procedure Set_sku(v:String);
(*The item being offered.*)
  function Get_itemOffered:IProduct;
  procedure Set_itemOffered(v:IProduct);
(*The place(s) from which the offer can be obtained (e.g. store locations).*)
  function Get_availableAtOrFrom:IPlace;
  procedure Set_availableAtOrFrom(v:IPlace);
(*An additional offer that can only be obtained in combination with the first 
base offer (e.g. supplements and extensions that are available for a 
surcharge).*)
  function Get_addOn:IOffer;
  procedure Set_addOn(v:IOffer);
(*The interval and unit of measurement of ordering quantities for which the 
offer or price specification is valid. This allows e.g. specifying that a 
certain freight charge is valid only for a certain quantity.*)
  function Get_eligibleQuantity:IQuantitativeValue;
  procedure Set_eligibleQuantity(v:IQuantitativeValue);
(*The delivery method(s) available for this offer.*)
  function Get_availableDeliveryMethod:IDeliveryMethod;
  procedure Set_availableDeliveryMethod(v:IDeliveryMethod);
(*The typical delay between the receipt of the order and the goods either 
leaving the warehouse or being prepared for pickup, in case the delivery method 
is on site pickup.*)
  function Get_deliveryLeadTime:IQuantitativeValue;
  procedure Set_deliveryLeadTime(v:IQuantitativeValue);
(*The payment method(s) accepted by seller for this offer.*)
  function Get_acceptedPaymentMethod:IPaymentMethod;
  procedure Set_acceptedPaymentMethod(v:IPaymentMethod);
(*The amount of time that is required between accepting the offer and the 
actual usage of the resource or service.*)
  function Get_advanceBookingRequirement:IQuantitativeValue;
  procedure Set_advanceBookingRequirement(v:IQuantitativeValue);
(*The date after which the price is no longer available.*)
  function Get_priceValidUntil:TDateTime;
  procedure Set_priceValidUntil(v:TDateTime);
// properties
  property aggregateRating:IAggregateRating read Get_aggregateRating write Set_aggregateRating;
  property availabilityStarts:TDateTime read Get_availabilityStarts write Set_availabilityStarts;
  property sku:String read Get_sku write Set_sku;
  property itemOffered:IProduct read Get_itemOffered write Set_itemOffered;
  property availableAtOrFrom:IPlace read Get_availableAtOrFrom write Set_availableAtOrFrom;
  property addOn:IOffer read Get_addOn write Set_addOn;
  property eligibleQuantity:IQuantitativeValue read Get_eligibleQuantity write Set_eligibleQuantity;
  property availableDeliveryMethod:IDeliveryMethod read Get_availableDeliveryMethod write Set_availableDeliveryMethod;
  property deliveryLeadTime:IQuantitativeValue read Get_deliveryLeadTime write Set_deliveryLeadTime;
  property acceptedPaymentMethod:IPaymentMethod read Get_acceptedPaymentMethod write Set_acceptedPaymentMethod;
  property advanceBookingRequirement:IQuantitativeValue read Get_advanceBookingRequirement write Set_advanceBookingRequirement;
  property priceValidUntil:TDateTime read Get_priceValidUntil write Set_priceValidUntil;
end;
(*** end IOffer ***)


(* AggregateRating
The average rating based on multiple ratings or reviews.
*)
IAggregateRating=Interface (IRating)
(*The count of total number of ratings.*)
  function Get_ratingCount:Integer;
  procedure Set_ratingCount(v:Integer);
(*The count of total number of reviews.*)
  function Get_reviewCount:Integer;
  procedure Set_reviewCount(v:Integer);
// properties
  property ratingCount:Integer read Get_ratingCount write Set_ratingCount;
  property reviewCount:Integer read Get_reviewCount write Set_reviewCount;
end;
(*** end IAggregateRating ***)


(* DeliveryMethod
*)
IDeliveryMethod=Interface (IEnumeration)
  function TangDeliveryMethod:TangibleValue;
end;
(*** end IDeliveryMethod ***)


(* PaymentMethod
*)
IPaymentMethod=Interface (IEnumeration)
  function TangPaymentMethod:TangibleValue;
end;
(*** end IPaymentMethod ***)

IOfferItemCondition=interface; //forward

IItemAvailability=interface; //forward

ITypeAndQuantityNode=interface; //forward

IBusinessEntityType=interface; //forward


(* Demand
A demand entity represents the public, not necessarily binding, not necessarily 
exclusive, announcement by an organization or person to seek a certain type of 
goods or services. For describing demand using this type, the very same 
properties used for Offer apply.
*)
IDemand=Interface (IIntangible)
(*The end of the availability of the product or service included in the offer.*)
  function Get_availabilityEnds:TDateTime;
  procedure Set_availabilityEnds(v:TDateTime);
(*A predefined value from OfferItemCondition or a textual description of the 
condition of the product or service, or the products or services included in 
the offer.*)
  function Get_itemCondition:IOfferItemCondition;
  procedure Set_itemCondition(v:IOfferItemCondition);
(*The duration for which the given offer is valid.*)
  function Get_eligibleDuration:IQuantitativeValue;
  procedure Set_eligibleDuration(v:IQuantitativeValue);
(*The Manufacturer Part Number (MPN) of the product, or the product to which 
the offer refers.*)
  function Get_mpn:String;
  procedure Set_mpn(v:String);
(**)
  function Get_gtin13:String;
  procedure Set_gtin13(v:String);
(**)
  function Get_gtin14:String;
  procedure Set_gtin14(v:String);
(*The date when the item becomes valid.*)
  function Get_validFrom:TDateTime;
  procedure Set_validFrom(v:TDateTime);
(**)
  function Get_ineligibleRegion:IPlace;
  procedure Set_ineligibleRegion(v:IPlace);
(*The availability of this item&amp;#x2014;for example In stock, Out of stock, 
Pre-order, etc.*)
  function Get_availability:IItemAvailability;
  procedure Set_availability(v:IItemAvailability);
(*The transaction volume, in a monetary unit, for which the offer or price 
specification is valid, e.g. for indicating a minimal purchasing volume, to 
express free shipping above a certain order volume, or to limit the acceptance 
of credit cards to purchases to a certain minimal amount.*)
  function Get_eligibleTransactionVolume:IPriceSpecification;
  procedure Set_eligibleTransactionVolume(v:IPriceSpecification);
(*This links to a node or nodes indicating the exact quantity of the products 
included in the offer.*)
  function Get_includesObject:ITypeAndQuantityNode;
  procedure Set_includesObject(v:ITypeAndQuantityNode);
(*The type(s) of customers for which the given offer is valid.*)
  function Get_eligibleCustomerType:IBusinessEntityType;
  procedure Set_eligibleCustomerType(v:IBusinessEntityType);
(*The current approximate inventory level for the item or items.*)
  function Get_inventoryLevel:IQuantitativeValue;
  procedure Set_inventoryLevel(v:IQuantitativeValue);
// properties
  property availabilityEnds:TDateTime read Get_availabilityEnds write Set_availabilityEnds;
  property itemCondition:IOfferItemCondition read Get_itemCondition write Set_itemCondition;
  property eligibleDuration:IQuantitativeValue read Get_eligibleDuration write Set_eligibleDuration;
  property mpn:String read Get_mpn write Set_mpn;
  property gtin13:String read Get_gtin13 write Set_gtin13;
  property gtin14:String read Get_gtin14 write Set_gtin14;
  property validFrom:TDateTime read Get_validFrom write Set_validFrom;
  property ineligibleRegion:IPlace read Get_ineligibleRegion write Set_ineligibleRegion;
  property availability:IItemAvailability read Get_availability write Set_availability;
  property eligibleTransactionVolume:IPriceSpecification read Get_eligibleTransactionVolume write Set_eligibleTransactionVolume;
  property includesObject:ITypeAndQuantityNode read Get_includesObject write Set_includesObject;
  property eligibleCustomerType:IBusinessEntityType read Get_eligibleCustomerType write Set_eligibleCustomerType;
  property inventoryLevel:IQuantitativeValue read Get_inventoryLevel write Set_inventoryLevel;
end;
(*** end IDemand ***)


(* OfferItemCondition
A list of possible conditions for the item.
*)
IOfferItemCondition=Interface (IEnumeration)
  function TangOfferItemCondition:TangibleValue;
end;
(*** end IOfferItemCondition ***)


(* ItemAvailability
A list of possible product availability options.
*)
IItemAvailability=Interface (IEnumeration)
  function TangItemAvailability:TangibleValue;
end;
(*** end IItemAvailability ***)


(* PriceSpecification
*)
IPriceSpecification=Interface (IStructuredValue)
(**)
  function Get_priceCurrency:String;
  procedure Set_priceCurrency(v:String);
(*The date after when the item is not valid. For example the end of an offer, 
salary period, or a period of opening hours.*)
  function Get_validThrough:TDateTime;
  procedure Set_validThrough(v:TDateTime);
(*Specifies whether the applicable value-added tax (VAT) is included in the 
price specification or not.*)
  function Get_valueAddedTaxIncluded:Boolean;
  procedure Set_valueAddedTaxIncluded(v:Boolean);
(*The lowest price if the price is a range.*)
  function Get_minPrice:INumber;
  procedure Set_minPrice(v:INumber);
(*The highest price if the price is a range.*)
  function Get_maxPrice:INumber;
  procedure Set_maxPrice(v:INumber);
// properties
  property priceCurrency:String read Get_priceCurrency write Set_priceCurrency;
  property validThrough:TDateTime read Get_validThrough write Set_validThrough;
  property valueAddedTaxIncluded:Boolean read Get_valueAddedTaxIncluded write Set_valueAddedTaxIncluded;
  property minPrice:INumber read Get_minPrice write Set_minPrice;
  property maxPrice:INumber read Get_maxPrice write Set_maxPrice;
end;
(*** end IPriceSpecification ***)

IBusinessFunction=interface; //forward


(* TypeAndQuantityNode
A structured value indicating the quantity, unit of measurement, and business 
function of goods included in a bundle offer.
*)
ITypeAndQuantityNode=Interface (IStructuredValue)
(*The product that this structured value is referring to.*)
  function Get_typeOfGood:IService;
  procedure Set_typeOfGood(v:IService);
(*The unit of measurement given using the UN/CEFACT Common Code (3 characters) 
or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix 
followed by a colon.*)
  function Get_unitCode:String;
  procedure Set_unitCode(v:String);
(*The business function (e.g. sell, lease, repair, dispose) of the offer or 
component of a bundle (TypeAndQuantityNode). The default is 
http://purl.org/goodrelations/v1#Sell.*)
  function Get_businessFunction:IBusinessFunction;
  procedure Set_businessFunction(v:IBusinessFunction);
(*The quantity of the goods included in the offer.*)
  function Get_amountOfThisGood:INumber;
  procedure Set_amountOfThisGood(v:INumber);
// properties
  property typeOfGood:IService read Get_typeOfGood write Set_typeOfGood;
  property unitCode:String read Get_unitCode write Set_unitCode;
  property businessFunction:IBusinessFunction read Get_businessFunction write Set_businessFunction;
  property amountOfThisGood:INumber read Get_amountOfThisGood write Set_amountOfThisGood;
end;
(*** end ITypeAndQuantityNode ***)


(* BusinessFunction
*)
IBusinessFunction=Interface (IEnumeration)
  function TangBusinessFunction:TangibleValue;
end;
(*** end IBusinessFunction ***)


(* BusinessEntityType
*)
IBusinessEntityType=Interface (IEnumeration)
  function TangBusinessEntityType:TangibleValue;
end;
(*** end IBusinessEntityType ***)


(* EducationalOrganization
An educational organization.
*)
IEducationalOrganization=Interface (IOrganization)
 (*No atribs*)
end;
(*** end IEducationalOrganization ***)


(* VideoObject
A video file.
*)
IVideoObject=Interface (IMediaObject)
(*Thumbnail image for an image or video.*)
  function Get_thumbnail:IImageObject;
  procedure Set_thumbnail(v:IImageObject);
(*The frame size of the video.*)
  function Get_videoFrameSize:String;
  procedure Set_videoFrameSize(v:String);
(*The quality of the video.*)
  function Get_videoQuality:String;
  procedure Set_videoQuality(v:String);
// properties
  property thumbnail:IImageObject read Get_thumbnail write Set_thumbnail;
  property videoFrameSize:String read Get_videoFrameSize write Set_videoFrameSize;
  property videoQuality:String read Get_videoQuality write Set_videoQuality;
end;
(*** end IVideoObject ***)

IBroadcastService=interface; //forward


(* PublicationEvent
A PublicationEvent corresponds indifferently to the event of publication for a 
CreativeWork of any type e.g. a broadcast event, an on-demand event, a 
book/journal publication via a variety of delivery media.
*)
IPublicationEvent=Interface (IEvent)
(*A flag to signal that the publication or event is accessible for free.*)
  function Get_free:Boolean;
  procedure Set_free(v:Boolean);
(*A broadcast service associated with the publication event.*)
  function Get_publishedOn:IBroadcastService;
  procedure Set_publishedOn(v:IBroadcastService);
(*An agent associated with the publication event.*)
  function Get_publishedBy:IOrganization;
  procedure Set_publishedBy(v:IOrganization);
// properties
  property free:Boolean read Get_free write Set_free;
  property publishedOn:IBroadcastService read Get_publishedOn write Set_publishedOn;
  property publishedBy:IOrganization read Get_publishedBy write Set_publishedBy;
end;
(*** end IPublicationEvent ***)


(* BroadcastService
A delivery service through which content is provided via broadcast over the air 
or online.
*)
IBroadcastService=Interface (IService)
(**)
  function Get_broadcastTimezone:String;
  procedure Set_broadcastTimezone(v:String);
(*A broadcast service to which the broadcast service may belong to such as 
regional variations of a national channel.*)
  function Get_parentService:IBroadcastService;
  procedure Set_parentService(v:IBroadcastService);
(*The frequency used for over-the-air broadcasts. Numeric values or simple 
ranges e.g. 87-99. In addition a shortcut idiom is supported for frequences of 
AM and FM radio channels, e.g. "87 FM".*)
  function Get_broadcastFrequency:String;
  procedure Set_broadcastFrequency(v:String);
(*The media network(s) whose content is broadcast on this station.*)
  function Get_broadcastAffiliateOf:IOrganization;
  procedure Set_broadcastAffiliateOf(v:IOrganization);
(*The name displayed in the channel guide. For many US affiliates, it is the 
network name.*)
  function Get_broadcastDisplayName:String;
  procedure Set_broadcastDisplayName(v:String);
(*The area within which users can expect to reach the broadcast service.*)
  function Get_area:IPlace;
  procedure Set_area(v:IPlace);
(*The organization owning or operating the broadcast service.*)
  function Get_broadcaster:IOrganization;
  procedure Set_broadcaster(v:IOrganization);
// properties
  property broadcastTimezone:String read Get_broadcastTimezone write Set_broadcastTimezone;
  property parentService:IBroadcastService read Get_parentService write Set_parentService;
  property broadcastFrequency:String read Get_broadcastFrequency write Set_broadcastFrequency;
  property broadcastAffiliateOf:IOrganization read Get_broadcastAffiliateOf write Set_broadcastAffiliateOf;
  property broadcastDisplayName:String read Get_broadcastDisplayName write Set_broadcastDisplayName;
  property area:IPlace read Get_area write Set_area;
  property broadcaster:IOrganization read Get_broadcaster write Set_broadcaster;
end;
(*** end IBroadcastService ***)


(* AudioObject
An audio file.
*)
IAudioObject=Interface (IMediaObject)
(*If this MediaObject is an AudioObject or VideoObject, the transcript of that 
object.*)
  function Get_transcript:String;
  procedure Set_transcript(v:String);
// properties
  property transcript:String read Get_transcript write Set_transcript;
end;
(*** end IAudioObject ***)


(* AlignmentObject
This class is based on the work of the LRMI project, see lrmi.net for details.
*)
IAlignmentObject=Interface (IIntangible)
(*The name of a node in an established educational framework.*)
  function Get_targetName:String;
  procedure Set_targetName(v:String);
(*The URL of a node in an established educational framework.*)
  function Get_targetUrl:String;
  procedure Set_targetUrl(v:String);
(*The description of a node in an established educational framework.*)
  function Get_targetDescription:String;
  procedure Set_targetDescription(v:String);
(*The framework to which the resource being described is aligned.*)
  function Get_educationalFramework:String;
  procedure Set_educationalFramework(v:String);
(*A category of alignment between the learning resource and the framework node. 
Recommended values include: 'assesses', 'teaches', 'requires', 
'textComplexity', 'readingLevel', 'educationalSubject', and 
'educationalLevel'.*)
  function Get_alignmentType:String;
  procedure Set_alignmentType(v:String);
// properties
  property targetName:String read Get_targetName write Set_targetName;
  property targetUrl:String read Get_targetUrl write Set_targetUrl;
  property targetDescription:String read Get_targetDescription write Set_targetDescription;
  property educationalFramework:String read Get_educationalFramework write Set_educationalFramework;
  property alignmentType:String read Get_alignmentType write Set_alignmentType;
end;
(*** end IAlignmentObject ***)

IDataFeed=interface; //forward


(* SoftwareApplication
A software application.
*)
ISoftwareApplication=Interface (ICreativeWork)
(*Storage requirements (free space required).*)
  function Get_storageRequirements:String;
  procedure Set_storageRequirements(v:String);
(*Description of what changed in this version.*)
  function Get_releaseNotes:String;
  procedure Set_releaseNotes(v:String);
(*Operating systems supported (Windows 7, OSX 10.6, Android 1.6).*)
  function Get_operatingSystem:String;
  procedure Set_operatingSystem(v:String);
(*Countries for which the application is supported. You can also provide the 
two-letter ISO 3166-1 alpha-2 country code.*)
  function Get_countriesSupported:String;
  procedure Set_countriesSupported(v:String);
(*Permission(s) required to run the app (for example, a mobile app may require 
full internet access or may run only on wifi).*)
  function Get_permissions:String;
  procedure Set_permissions(v:String);
(*A link to a screenshot image of the app.*)
  function Get_screenshot:String;
  procedure Set_screenshot(v:String);
(*Software application help.*)
  function Get_softwareHelp:ICreativeWork;
  procedure Set_softwareHelp(v:ICreativeWork);
(*Version of the software instance.*)
  function Get_softwareVersion:String;
  procedure Set_softwareVersion(v:String);
(*If the file can be downloaded, URL to download the binary.*)
  function Get_downloadUrl:String;
  procedure Set_downloadUrl(v:String);
(*Device required to run the application. Used in cases where a specific 
make/model is required to run the application.*)
  function Get_device:String;
  procedure Set_device(v:String);
(*The name of the application suite to which the application belongs (e.g. 
Excel belongs to Office).*)
  function Get_applicationSuite:String;
  procedure Set_applicationSuite(v:String);
(*Features or modules provided by this application (and possibly required by 
other applications).*)
  function Get_featureList:String;
  procedure Set_featureList(v:String);
(*Supporting data for a SoftwareApplication.*)
  function Get_supportingData:IDataFeed;
  procedure Set_supportingData(v:IDataFeed);
(*Type of software application, e.g. 'Game, Multimedia'.*)
  function Get_applicationCategory:String;
  procedure Set_applicationCategory(v:String);
(*URL at which the app may be installed, if different from the URL of the 
item.*)
  function Get_installUrl:String;
  procedure Set_installUrl(v:String);
(*Processor architecture required to run the application (e.g. IA64).*)
  function Get_processorRequirements:String;
  procedure Set_processorRequirements(v:String);
(*Size of the application / package (e.g. 18MB). In the absence of a unit (MB, 
KB etc.), KB will be assumed.*)
  function Get_fileSize:String;
  procedure Set_fileSize(v:String);
(*Subcategory of the application, e.g. 'Arcade Game'.*)
  function Get_applicationSubCategory:String;
  procedure Set_applicationSubCategory(v:String);
(*Countries for which the application is not supported. You can also provide 
the two-letter ISO 3166-1 alpha-2 country code.*)
  function Get_countriesNotSupported:String;
  procedure Set_countriesNotSupported(v:String);
(*Component dependency requirements for application. This includes runtime 
environments and shared libraries that are not included in the application 
distribution package, but required to run the application (Examples: DirectX, 
Java or .NET runtime).*)
  function Get_requirements:String;
  procedure Set_requirements(v:String);
(*Minimum memory requirements.*)
  function Get_memoryRequirements:String;
  procedure Set_memoryRequirements(v:String);
(*Additional content for a software application.*)
  function Get_softwareAddOn:ISoftwareApplication;
  procedure Set_softwareAddOn(v:ISoftwareApplication);
// properties
  property storageRequirements:String read Get_storageRequirements write Set_storageRequirements;
  property releaseNotes:String read Get_releaseNotes write Set_releaseNotes;
  property operatingSystem:String read Get_operatingSystem write Set_operatingSystem;
  property countriesSupported:String read Get_countriesSupported write Set_countriesSupported;
  property permissions:String read Get_permissions write Set_permissions;
  property screenshot:String read Get_screenshot write Set_screenshot;
  property softwareHelp:ICreativeWork read Get_softwareHelp write Set_softwareHelp;
  property softwareVersion:String read Get_softwareVersion write Set_softwareVersion;
  property downloadUrl:String read Get_downloadUrl write Set_downloadUrl;
  property device:String read Get_device write Set_device;
  property applicationSuite:String read Get_applicationSuite write Set_applicationSuite;
  property featureList:String read Get_featureList write Set_featureList;
  property supportingData:IDataFeed read Get_supportingData write Set_supportingData;
  property applicationCategory:String read Get_applicationCategory write Set_applicationCategory;
  property installUrl:String read Get_installUrl write Set_installUrl;
  property processorRequirements:String read Get_processorRequirements write Set_processorRequirements;
  property fileSize:String read Get_fileSize write Set_fileSize;
  property applicationSubCategory:String read Get_applicationSubCategory write Set_applicationSubCategory;
  property countriesNotSupported:String read Get_countriesNotSupported write Set_countriesNotSupported;
  property requirements:String read Get_requirements write Set_requirements;
  property memoryRequirements:String read Get_memoryRequirements write Set_memoryRequirements;
  property softwareAddOn:ISoftwareApplication read Get_softwareAddOn write Set_softwareAddOn;
end;
(*** end ISoftwareApplication ***)

IDataCatalog=interface; //forward

IDataDownload=interface; //forward


(* Dataset
A body of structured information describing some topic(s) of interest.
*)
IDataset=Interface (ICreativeWork)
(*The range of temporal applicability of a dataset, e.g. for a 2011 census 
dataset, the year 2011 (in ISO 8601 time interval format).*)
  function Get_temporal:TDateTime;
  procedure Set_temporal(v:TDateTime);
(*The variables that are measured in some dataset, either described as text or 
as pairs of identifier and description using PropertyValue.*)
  function Get_variablesMeasured:String;
  procedure Set_variablesMeasured(v:String);
(*The range of spatial applicability of a dataset, e.g. for a dataset of New 
York weather, the state of New York.*)
  function Get_spatial:IPlace;
  procedure Set_spatial(v:IPlace);
(*A data catalog which contains this dataset (this property was previously 
'catalog', preferred name is now 'includedInDataCatalog').*)
  function Get_includedDataCatalog:IDataCatalog;
  procedure Set_includedDataCatalog(v:IDataCatalog);
(*The range of temporal applicability of a dataset, e.g. for a 2011 census 
dataset, the year 2011 (in ISO 8601 time interval format).*)
  function Get_datasetTimeInterval:TDateTime;
  procedure Set_datasetTimeInterval(v:TDateTime);
(*A data catalog which contains this dataset.*)
  function Get_catalog:IDataCatalog;
  procedure Set_catalog(v:IDataCatalog);
(*A downloadable form of this dataset, at a specific location, in a specific 
format.*)
  function Get_distribution:IDataDownload;
  procedure Set_distribution(v:IDataDownload);
// properties
  property temporal:TDateTime read Get_temporal write Set_temporal;
  property variablesMeasured:String read Get_variablesMeasured write Set_variablesMeasured;
  property spatial:IPlace read Get_spatial write Set_spatial;
  property includedDataCatalog:IDataCatalog read Get_includedDataCatalog write Set_includedDataCatalog;
  property datasetTimeInterval:TDateTime read Get_datasetTimeInterval write Set_datasetTimeInterval;
  property catalog:IDataCatalog read Get_catalog write Set_catalog;
  property distribution:IDataDownload read Get_distribution write Set_distribution;
end;
(*** end IDataset ***)


(* DataCatalog
A collection of datasets.
*)
IDataCatalog=Interface (ICreativeWork)
(*A dataset contained in this catalog.*)
  function Get_dataset:IDataset;
  procedure Set_dataset(v:IDataset);
// properties
  property dataset:IDataset read Get_dataset write Set_dataset;
end;
(*** end IDataCatalog ***)


(* DataDownload
A dataset in downloadable form.
*)
IDataDownload=Interface (IMediaObject)
 (*No atribs*)
end;
(*** end IDataDownload ***)


(* DataFeed
A single feed providing structured information about one or more entities or 
topics.
*)
IDataFeed=Interface (IDataset)
(*An item within in a data feed. Data feeds may have many elements.*)
  function Get_dataFeedElement:IThing;
  procedure Set_dataFeedElement(v:IThing);
// properties
  property dataFeedElement:IThing read Get_dataFeedElement write Set_dataFeedElement;
end;
(*** end IDataFeed ***)


(* ActionStatusType
The status of an Action.
*)
IActionStatusType=Interface (IEnumeration)
  function TangActionStatusType:TangibleValue;
end;
(*** end IActionStatusType ***)


(* CreativeWorkSeries
*)
ICreativeWorkSeries=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end ICreativeWorkSeries ***)


(* Periodical
*)
IPeriodical=Interface (ICreativeWorkSeries)
(*The International Standard Serial Number (ISSN) that identifies this 
periodical. You can repeat this property to (for example) identify different 
formats of this periodical.*)
  function Get_issn:String;
  procedure Set_issn(v:String);
// properties
  property issn:String read Get_issn write Set_issn;
end;
(*** end IPeriodical ***)


(* Newspaper
A publication containing information about varied topics that are pertinent to 
general information, a geographic area, or a specific subject matter (i.e. 
business, culture, education). Often published daily.
*)
INewspaper=Interface (IPeriodical)
 (*No atribs*)
end;
(*** end INewspaper ***)


(* Permit
A permit issued by an organization, e.g. a parking pass.
*)
IPermit=Interface (IIntangible)
(*The time validity of the permit.*)
  function Get_validFor:IDuration;
  procedure Set_validFor(v:IDuration);
(*The service through with the permit was granted.*)
  function Get_issuedThrough:IService;
  procedure Set_issuedThrough(v:IService);
(*The date when the item is no longer valid.*)
  function Get_validUntil:TDateTime;
  procedure Set_validUntil(v:TDateTime);
(*The geographic area where the permit is valid.*)
  function Get_validIn:IAdministrativeArea;
  procedure Set_validIn(v:IAdministrativeArea);
(*The target audience for this permit.*)
  function Get_permitAudience:IAudience;
  procedure Set_permitAudience(v:IAudience);
(*The organization issuing the ticket or permit.*)
  function Get_issuedBy:IOrganization;
  procedure Set_issuedBy(v:IOrganization);
// properties
  property validFor:IDuration read Get_validFor write Set_validFor;
  property issuedThrough:IService read Get_issuedThrough write Set_issuedThrough;
  property validUntil:TDateTime read Get_validUntil write Set_validUntil;
  property validIn:IAdministrativeArea read Get_validIn write Set_validIn;
  property permitAudience:IAudience read Get_permitAudience write Set_permitAudience;
  property issuedBy:IOrganization read Get_issuedBy write Set_issuedBy;
end;
(*** end IPermit ***)


(* GovernmentPermit
A permit issued by a government agency.
*)
IGovernmentPermit=Interface (IPermit)
  function TangGovernmentPermit:TangibleValue;
end;
(*** end IGovernmentPermit ***)


(* UpdateAction
The act of managing by changing/editing the state of the object.
*)
IUpdateAction=Interface (IAction)
(*A sub property of object. The collection target of the action.*)
  function Get_collection:IThing;
  procedure Set_collection(v:IThing);
// properties
  property collection:IThing read Get_collection write Set_collection;
end;
(*** end IUpdateAction ***)


(* AddAction
The act of editing by adding an object to a collection.
*)
IAddAction=Interface (IUpdateAction)
 (*No atribs*)
end;
(*** end IAddAction ***)


(* InsertAction
The act of adding at a specific location in an ordered collection.
*)
IInsertAction=Interface (IAddAction)
 (*No atribs*)
end;
(*** end IInsertAction ***)


(* PrependAction
The act of inserting at the beginning if an ordered collection.
*)
IPrependAction=Interface (IInsertAction)
 (*No atribs*)
end;
(*** end IPrependAction ***)


(* Episode
A media episode (e.g. TV, radio, video game) which can be part of a series or 
season.
*)
IEpisode=Interface (ICreativeWork)
(*Position of the episode within an ordered group of episodes.*)
  function Get_episodeNumber:String;
  procedure Set_episodeNumber(v:String);
// properties
  property episodeNumber:String read Get_episodeNumber write Set_episodeNumber;
end;
(*** end IEpisode ***)


(* RadioEpisode
A radio episode which can be part of a series or season.
*)
IRadioEpisode=Interface (IEpisode)
 (*No atribs*)
end;
(*** end IRadioEpisode ***)


(* LocalBusiness
A particular physical business or branch of an organization. Examples of 
LocalBusiness include a restaurant, a particular branch of a restaurant chain, 
a branch of a bank, a medical practice, a club, a bowling alley, etc.
*)
ILocalBusiness=Interface (IPlace)
(**)
  function Get_priceRange:String;
  procedure Set_priceRange(v:String);
(**)
  function Get_branchOf:IOrganization;
  procedure Set_branchOf(v:IOrganization);
(**)
  function Get_openingHours:String;
  procedure Set_openingHours(v:String);
(*Cash, credit card, etc.*)
  function Get_paymentAccepted:String;
  procedure Set_paymentAccepted(v:String);
(**)
  function Get_currenciesAccepted:String;
  procedure Set_currenciesAccepted(v:String);
// properties
  property priceRange:String read Get_priceRange write Set_priceRange;
  property branchOf:IOrganization read Get_branchOf write Set_branchOf;
  property openingHours:String read Get_openingHours write Set_openingHours;
  property paymentAccepted:String read Get_paymentAccepted write Set_paymentAccepted;
  property currenciesAccepted:String read Get_currenciesAccepted write Set_currenciesAccepted;
end;
(*** end ILocalBusiness ***)


(* FoodEstablishment
A food-related business.
*)
IFoodEstablishment=Interface (ILocalBusiness)
(**)
  function Get_acceptsReservations:String;
  procedure Set_acceptsReservations(v:String);
(*The cuisine of the restaurant.*)
  function Get_servesCuisine:String;
  procedure Set_servesCuisine(v:String);
(*Either the actual menu or a URL of the menu.*)
  function Get_menu:String;
  procedure Set_menu(v:String);
// properties
  property acceptsReservations:String read Get_acceptsReservations write Set_acceptsReservations;
  property servesCuisine:String read Get_servesCuisine write Set_servesCuisine;
  property menu:String read Get_menu write Set_menu;
end;
(*** end IFoodEstablishment ***)


(* Winery
A winery.
*)
IWinery=Interface (IFoodEstablishment)
 (*No atribs*)
end;
(*** end IWinery ***)

ICableOrSatelliteService=interface; //forward


(* BroadcastChannel
A unique instance of a BroadcastService on a CableOrSatelliteService lineup.
*)
IBroadcastChannel=Interface (IIntangible)
(*The unique address by which the BroadcastService can be identified in a 
provider lineup. In US, this is typically a number.*)
  function Get_broadcastChannelId:String;
  procedure Set_broadcastChannelId(v:String);
(*The type of service required to have access to the channel (e.g. Standard or 
Premium).*)
  function Get_broadcastServiceTier:String;
  procedure Set_broadcastServiceTier(v:String);
(*The CableOrSatelliteService offering the channel.*)
  function Get_inBroadcastLineup:ICableOrSatelliteService;
  procedure Set_inBroadcastLineup(v:ICableOrSatelliteService);
(*The BroadcastService offered on this channel.*)
  function Get_providesBroadcastService:IBroadcastService;
  procedure Set_providesBroadcastService(v:IBroadcastService);
// properties
  property broadcastChannelId:String read Get_broadcastChannelId write Set_broadcastChannelId;
  property broadcastServiceTier:String read Get_broadcastServiceTier write Set_broadcastServiceTier;
  property inBroadcastLineup:ICableOrSatelliteService read Get_inBroadcastLineup write Set_inBroadcastLineup;
  property providesBroadcastService:IBroadcastService read Get_providesBroadcastService write Set_providesBroadcastService;
end;
(*** end IBroadcastChannel ***)


(* CableOrSatelliteService
A service which provides access to media programming like TV or radio. Access 
may be via cable or satellite.
*)
ICableOrSatelliteService=Interface (IService)
  function TangCableOrSatelliteService:TangibleValue;
end;
(*** end ICableOrSatelliteService ***)


(* RadioChannel
A unique instance of a radio BroadcastService on a CableOrSatelliteService 
lineup.
*)
IRadioChannel=Interface (IBroadcastChannel)
  function TangRadioChannel:TangibleValue;
end;
(*** end IRadioChannel ***)


(* AMRadioChannel
A radio channel that uses AM.
*)
IAMRadioChannel=Interface (IRadioChannel)
  function TangAMRadioChannel:TangibleValue;
end;
(*** end IAMRadioChannel ***)


(* Collection
A created collection of Creative Works or other artefacts.
*)
ICollection=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end ICollection ***)


(* Season
A media season e.g. tv, radio, video game etc.
*)
ISeason=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end ISeason ***)


(* Brewery
Brewery.
*)
IBrewery=Interface (IFoodEstablishment)
 (*No atribs*)
end;
(*** end IBrewery ***)

IMedicalCode=interface; //forward

IMedicalGuideline=interface; //forward

IMedicineSystem=interface; //forward

IMedicalStudy=interface; //forward

IMedicalSpecialty=interface; //forward


(* MedicalEntity
The most generic type of entity related to health and the practice of medicine.
*)
IMedicalEntity=Interface (IThing)
(*A medical code for the entity, taken from a controlled vocabulary or ontology 
such as ICD-9, DiseasesDB, MeSH, SNOMED-CT, RxNorm, etc.*)
  function Get_code:IMedicalCode;
  procedure Set_code(v:IMedicalCode);
(*A medical guideline related to this entity.*)
  function Get_guideline:IMedicalGuideline;
  procedure Set_guideline(v:IMedicalGuideline);
(*The system of medicine that includes this MedicalEntity, for example 
'evidence-based', 'homeopathic', 'chiropractic', etc.*)
  function Get_medicineSystem:IMedicineSystem;
  procedure Set_medicineSystem(v:IMedicineSystem);
(*The drug or supplement's legal status, including any controlled substance 
schedules that apply.*)
  function Get_legalStatus:String;
  procedure Set_legalStatus(v:String);
(*If applicable, the organization that officially recognizes this entity as 
part of its endorsed system of medicine.*)
  function Get_recognizingAuthority:IOrganization;
  procedure Set_recognizingAuthority(v:IOrganization);
(*A medical study or trial related to this entity.*)
  function Get_study:IMedicalStudy;
  procedure Set_study(v:IMedicalStudy);
(*If applicable, a medical specialty in which this entity is relevant.*)
  function Get_relevantSpecialty:IMedicalSpecialty;
  procedure Set_relevantSpecialty(v:IMedicalSpecialty);
// properties
  property code:IMedicalCode read Get_code write Set_code;
  property guideline:IMedicalGuideline read Get_guideline write Set_guideline;
  property medicineSystem:IMedicineSystem read Get_medicineSystem write Set_medicineSystem;
  property legalStatus:String read Get_legalStatus write Set_legalStatus;
  property recognizingAuthority:IOrganization read Get_recognizingAuthority write Set_recognizingAuthority;
  property study:IMedicalStudy read Get_study write Set_study;
  property relevantSpecialty:IMedicalSpecialty read Get_relevantSpecialty write Set_relevantSpecialty;
end;
(*** end IMedicalEntity ***)


(* MedicalIntangible
A utility class that serves as the umbrella for a number of 'intangible' things 
in the medical space.
*)
IMedicalIntangible=Interface (IMedicalEntity)
 (*No atribs*)
end;
(*** end IMedicalIntangible ***)


(* MedicalCode
A code for a medical entity.
*)
IMedicalCode=Interface (IMedicalIntangible)
(*The coding system, e.g. 'ICD-10'.*)
  function Get_codingSystem:String;
  procedure Set_codingSystem(v:String);
(*The actual code.*)
  function Get_codeValue:String;
  procedure Set_codeValue(v:String);
// properties
  property codingSystem:String read Get_codingSystem write Set_codingSystem;
  property codeValue:String read Get_codeValue write Set_codeValue;
end;
(*** end IMedicalCode ***)

IMedicalEvidenceLevel=interface; //forward


(* MedicalGuideline
Any recommendation made by a standard society (e.g. ACC/AHA) or consensus 
statement that denotes how to diagnose and treat a particular condition. Note: 
this type should be used to tag the actual guideline recommendation; if the 
guideline recommendation occurs in a larger scholarly article, use 
MedicalScholarlyArticle to tag the overall article, not this type. Note also: 
the organization making the recommendation should be captured in the 
recognizingAuthority base property of MedicalEntity.
*)
IMedicalGuideline=Interface (IMedicalEntity)
(*Source of the data used to formulate the guidance, e.g. RCT, consensus 
opinion, etc.*)
  function Get_evidenceOrigin:String;
  procedure Set_evidenceOrigin(v:String);
(*The medical conditions, treatments, etc. that are the subject of the 
guideline.*)
  function Get_guidelineSubject:IMedicalEntity;
  procedure Set_guidelineSubject(v:IMedicalEntity);
(*Date on which this guideline's recommendation was made.*)
  function Get_guidelineDate:TDateTime;
  procedure Set_guidelineDate(v:TDateTime);
(*Strength of evidence of the data used to formulate the guideline 
(enumerated).*)
  function Get_evidenceLevel:IMedicalEvidenceLevel;
  procedure Set_evidenceLevel(v:IMedicalEvidenceLevel);
// properties
  property evidenceOrigin:String read Get_evidenceOrigin write Set_evidenceOrigin;
  property guidelineSubject:IMedicalEntity read Get_guidelineSubject write Set_guidelineSubject;
  property guidelineDate:TDateTime read Get_guidelineDate write Set_guidelineDate;
  property evidenceLevel:IMedicalEvidenceLevel read Get_evidenceLevel write Set_evidenceLevel;
end;
(*** end IMedicalGuideline ***)


(* MedicalEnumeration
Enumerations related to health and the practice of medicine: A concept that is 
used to attribute a quality to another concept, as a qualifier, a collection of 
items or a listing of all of the elements of a set in medicine practice.
*)
IMedicalEnumeration=Interface (IEnumeration)
  function TangMedicalEnumeration:TangibleValue;
end;
(*** end IMedicalEnumeration ***)


(* MedicalEvidenceLevel
Level of evidence for a medical guideline. Enumerated type.
*)
IMedicalEvidenceLevel=Interface (IMedicalEnumeration)
  function TangMedicalEvidenceLevel:TangibleValue;
end;
(*** end IMedicalEvidenceLevel ***)


(* MedicineSystem
Systems of medical practice.
*)
IMedicineSystem=Interface (IMedicalEnumeration)
  function TangMedicineSystem:TangibleValue;
end;
(*** end IMedicineSystem ***)

IMedicalCondition=interface; //forward


(* MedicalStudy
A medical study is an umbrella type covering all kinds of research studies 
relating to human medicine or health, including observational studies and 
interventional trials and registries, randomized, controlled or not. When the 
specific type of study is known, use one of the extensions of this type, such 
as MedicalTrial or MedicalObservationalStudy. Also, note that this type should 
be used to mark up data that describes the study itself; to tag an article that 
publishes the results of a study, use MedicalScholarlyArticle. Note: use the 
code property of MedicalEntity to store study IDs, e.g. clinicaltrials.gov ID.
*)
IMedicalStudy=Interface (IMedicalEntity)
(*Specifying the health condition(s) of a patient, medical study, or other 
target audience.*)
  function Get_healthCondition:IMedicalCondition;
  procedure Set_healthCondition(v:IMedicalCondition);
(*Any characteristics of the population used in the study, e.g. 'males under 
65'.*)
  function Get_population:String;
  procedure Set_population(v:String);
(*A subject of the study, i.e. one of the medical conditions, therapies, 
devices, drugs, etc. investigated by the study.*)
  function Get_studySubject:IMedicalEntity;
  procedure Set_studySubject(v:IMedicalEntity);
(*The location in which the study is taking/took place.*)
  function Get_studyLocation:IAdministrativeArea;
  procedure Set_studyLocation(v:IAdministrativeArea);
// properties
  property healthCondition:IMedicalCondition read Get_healthCondition write Set_healthCondition;
  property population:String read Get_population write Set_population;
  property studySubject:IMedicalEntity read Get_studySubject write Set_studySubject;
  property studyLocation:IAdministrativeArea read Get_studyLocation write Set_studyLocation;
end;
(*** end IMedicalStudy ***)

IMedicalTherapy=interface; //forward

IMedicalTest=interface; //forward

IMedicalCause=interface; //forward

IMedicalStudyStatus=interface; //forward

IAnatomicalStructure=interface; //forward

IMedicalRiskFactor=interface; //forward

IMedicalSignOrSymptom=interface; //forward

IDDxElement=interface; //forward

IMedicalConditionStage=interface; //forward


(* MedicalCondition
Any condition of the human body that affects the normal functioning of a 
person, whether physically or mentally. Includes diseases, injuries, 
disabilities, disorders, syndromes, etc.
*)
IMedicalCondition=Interface (IMedicalEntity)
(*A preventative therapy used to prevent an initial occurrence of the medical 
condition, such as vaccination.*)
  function Get_primaryPrevention:IMedicalTherapy;
  procedure Set_primaryPrevention(v:IMedicalTherapy);
(*A medical test typically performed given this condition.*)
  function Get_typicalTest:IMedicalTest;
  procedure Set_typicalTest(v:IMedicalTest);
(*Specifying a cause of something in general. e.g in medicine , one of the 
causative agent(s) that are most directly responsible for the pathophysiologic 
process that eventually results in the occurrence.*)
  function Get_cause:IMedicalCause;
  procedure Set_cause(v:IMedicalCause);
(*The status of the study (enumerated).*)
  function Get_status:IMedicalStudyStatus;
  procedure Set_status(v:IMedicalStudyStatus);
(*A more specific type of the condition, where applicable, for example 'Type 1 
Diabetes', 'Type 2 Diabetes', or 'Gestational Diabetes' for Diabetes.*)
  function Get_subtype:String;
  procedure Set_subtype(v:String);
(*The likely outcome in either the short term or long term of the medical 
condition.*)
  function Get_expectedPrognosis:String;
  procedure Set_expectedPrognosis(v:String);
(*A possible unexpected and unfavorable evolution of a medical condition. 
Complications may include worsening of the signs or symptoms of the disease, 
extension of the condition to other organ systems, etc.*)
  function Get_possibleComplication:String;
  procedure Set_possibleComplication(v:String);
(*The anatomy of the underlying organ system or structures associated with this 
entity.*)
  function Get_associatedAnatomy:IAnatomicalStructure;
  procedure Set_associatedAnatomy(v:IAnatomicalStructure);
(*Changes in the normal mechanical, physical, and biochemical functions that 
are associated with this activity or condition.*)
  function Get_pathophysiology:String;
  procedure Set_pathophysiology(v:String);
(*A modifiable or non-modifiable factor that increases the risk of a patient 
contracting this condition, e.g. age,  coexisting condition.*)
  function Get_riskFactor:IMedicalRiskFactor;
  procedure Set_riskFactor(v:IMedicalRiskFactor);
(*A sign or symptom of this condition. Signs are objective or physically 
observable manifestations of the medical condition while symptoms are the 
subjective experience of the medical condition.*)
  function Get_signOrSymptom:IMedicalSignOrSymptom;
  procedure Set_signOrSymptom(v:IMedicalSignOrSymptom);
(*One of a set of differential diagnoses for the condition. Specifically, a 
closely-related or competing diagnosis typically considered later in the 
cognitive process whereby this medical condition is distinguished from others 
most likely responsible for a similar collection of signs and symptoms to reach 
the most parsimonious diagnosis or diagnoses in a patient.*)
  function Get_differentialDiagnosis:IDDxElement;
  procedure Set_differentialDiagnosis(v:IDDxElement);
(*The stage of the condition, if applicable.*)
  function Get_stage:IMedicalConditionStage;
  procedure Set_stage(v:IMedicalConditionStage);
(*The expected progression of the condition if it is not treated and allowed to 
progress naturally.*)
  function Get_naturalProgression:String;
  procedure Set_naturalProgression(v:String);
(*A possible treatment to address this condition, sign or symptom.*)
  function Get_possibleTreatment:IMedicalTherapy;
  procedure Set_possibleTreatment(v:IMedicalTherapy);
(*A preventative therapy used to prevent reoccurrence of the medical condition 
after an initial episode of the condition.*)
  function Get_secondaryPrevention:IMedicalTherapy;
  procedure Set_secondaryPrevention(v:IMedicalTherapy);
// properties
  property primaryPrevention:IMedicalTherapy read Get_primaryPrevention write Set_primaryPrevention;
  property typicalTest:IMedicalTest read Get_typicalTest write Set_typicalTest;
  property cause:IMedicalCause read Get_cause write Set_cause;
  property status:IMedicalStudyStatus read Get_status write Set_status;
  property subtype:String read Get_subtype write Set_subtype;
  property expectedPrognosis:String read Get_expectedPrognosis write Set_expectedPrognosis;
  property possibleComplication:String read Get_possibleComplication write Set_possibleComplication;
  property associatedAnatomy:IAnatomicalStructure read Get_associatedAnatomy write Set_associatedAnatomy;
  property pathophysiology:String read Get_pathophysiology write Set_pathophysiology;
  property riskFactor:IMedicalRiskFactor read Get_riskFactor write Set_riskFactor;
  property signOrSymptom:IMedicalSignOrSymptom read Get_signOrSymptom write Set_signOrSymptom;
  property differentialDiagnosis:IDDxElement read Get_differentialDiagnosis write Set_differentialDiagnosis;
  property stage:IMedicalConditionStage read Get_stage write Set_stage;
  property naturalProgression:String read Get_naturalProgression write Set_naturalProgression;
  property possibleTreatment:IMedicalTherapy read Get_possibleTreatment write Set_possibleTreatment;
  property secondaryPrevention:IMedicalTherapy read Get_secondaryPrevention write Set_secondaryPrevention;
end;
(*** end IMedicalCondition ***)

IMedicalIndication=interface; //forward

IMedicalProcedureType=interface; //forward


(* MedicalProcedure
A process of care used in either a diagnostic, therapeutic, preventive or 
palliative capacity that relies on invasive (surgical), non-invasive, or other 
techniques.
*)
IMedicalProcedure=Interface (IMedicalEntity)
(*Typical or recommended followup care after the procedure is performed.*)
  function Get_followup:String;
  procedure Set_followup(v:String);
(*Typical preparation that a patient must undergo before having the procedure 
performed.*)
  function Get_preparation:IMedicalEntity;
  procedure Set_preparation(v:IMedicalEntity);
(*How the procedure is performed.*)
  function Get_howPerformed:String;
  procedure Set_howPerformed(v:String);
(*A factor that indicates use of this therapy for treatment and/or prevention 
of a condition, symptom, etc. For therapies such as drugs, indications can 
include both officially-approved indications as well as off-label uses. These 
can be distinguished by using the ApprovedIndication subtype of 
MedicalIndication.*)
  function Get_indication:IMedicalIndication;
  procedure Set_indication(v:IMedicalIndication);
(*The type of procedure, for example Surgical, Noninvasive, or Percutaneous.*)
  function Get_procedureType:IMedicalProcedureType;
  procedure Set_procedureType(v:IMedicalProcedureType);
(*Location in the body of the anatomical structure.*)
  function Get_bodyLocation:String;
  procedure Set_bodyLocation(v:String);
(*Expected or actual outcomes of the study.*)
  function Get_outcome:IMedicalEntity;
  procedure Set_outcome(v:IMedicalEntity);
// properties
  property followup:String read Get_followup write Set_followup;
  property preparation:IMedicalEntity read Get_preparation write Set_preparation;
  property howPerformed:String read Get_howPerformed write Set_howPerformed;
  property indication:IMedicalIndication read Get_indication write Set_indication;
  property procedureType:IMedicalProcedureType read Get_procedureType write Set_procedureType;
  property bodyLocation:String read Get_bodyLocation write Set_bodyLocation;
  property outcome:IMedicalEntity read Get_outcome write Set_outcome;
end;
(*** end IMedicalProcedure ***)


(* MedicalIndication
A condition or factor that indicates use of a medical therapy, including signs, 
symptoms, risk factors, anatomical states, etc.
*)
IMedicalIndication=Interface (IMedicalEntity)
 (*No atribs*)
end;
(*** end IMedicalIndication ***)


(* MedicalProcedureType
An enumeration that describes different types of medical procedures.
*)
IMedicalProcedureType=Interface (IMedicalEnumeration)
  function TangMedicalProcedureType:TangibleValue;
end;
(*** end IMedicalProcedureType ***)


(* TherapeuticProcedure
A medical procedure intended primarily for therapeutic purposes, aimed at 
improving a health condition.
*)
ITherapeuticProcedure=Interface (IMedicalProcedure)
 (*No atribs*)
end;
(*** end ITherapeuticProcedure ***)


(* MedicalTherapy
Any medical intervention designed to prevent, treat, and cure human diseases 
and medical conditions, including both curative and palliative therapies. 
Medical therapies are typically processes of care relying upon pharmacotherapy, 
behavioral therapy, supportive therapy (with fluid or nutrition for example), 
or detoxification (e.g. hemodialysis) aimed at improving or preventing a health 
condition.
*)
IMedicalTherapy=Interface (ITherapeuticProcedure)
(*A possible serious complication and/or serious side effect of this therapy. 
Serious adverse outcomes include those that are life-threatening; result in 
death, disability, or permanent damage; require hospitalization or prolong 
existing hospitalization; cause congenital anomalies or birth defects; or 
jeopardize the patient and may require medical or surgical intervention to 
prevent one of the outcomes in this definition.*)
  function Get_seriousAdverseOutcome:IMedicalEntity;
  procedure Set_seriousAdverseOutcome(v:IMedicalEntity);
(*A therapy that duplicates or overlaps this one.*)
  function Get_duplicateTherapy:IMedicalTherapy;
  procedure Set_duplicateTherapy(v:IMedicalTherapy);
// properties
  property seriousAdverseOutcome:IMedicalEntity read Get_seriousAdverseOutcome write Set_seriousAdverseOutcome;
  property duplicateTherapy:IMedicalTherapy read Get_duplicateTherapy write Set_duplicateTherapy;
end;
(*** end IMedicalTherapy ***)

IMedicalDevice=interface; //forward

IDrug=interface; //forward

IMedicalSign=interface; //forward


(* MedicalTest
Any medical test, typically performed for diagnostic purposes.
*)
IMedicalTest=Interface (IMedicalEntity)
(*Device used to perform the test.*)
  function Get_usesDevice:IMedicalDevice;
  procedure Set_usesDevice(v:IMedicalDevice);
(*Drugs that affect the test's results.*)
  function Get_affectedBy:IDrug;
  procedure Set_affectedBy(v:IDrug);
(*Range of acceptable values for a typical patient, when applicable.*)
  function Get_normalRange:IMedicalEnumeration;
  procedure Set_normalRange(v:IMedicalEnumeration);
(*A sign detected by the test.*)
  function Get_signDetected:IMedicalSign;
  procedure Set_signDetected(v:IMedicalSign);
(*A condition the test is used to diagnose.*)
  function Get_usedToDiagnose:IMedicalCondition;
  procedure Set_usedToDiagnose(v:IMedicalCondition);
// properties
  property usesDevice:IMedicalDevice read Get_usesDevice write Set_usesDevice;
  property affectedBy:IDrug read Get_affectedBy write Set_affectedBy;
  property normalRange:IMedicalEnumeration read Get_normalRange write Set_normalRange;
  property signDetected:IMedicalSign read Get_signDetected write Set_signDetected;
  property usedToDiagnose:IMedicalCondition read Get_usedToDiagnose write Set_usedToDiagnose;
end;
(*** end IMedicalTest ***)

IMedicalContraindication=interface; //forward


(* MedicalDevice
Any object used in a medical capacity, such as to diagnose or treat a patient.
*)
IMedicalDevice=Interface (IMedicalEntity)
(*A description of the workup, testing, and other preparations required before 
implanting this device.*)
  function Get_preOp:String;
  procedure Set_preOp(v:String);
(*A description of the postoperative procedures, care, and/or followups for 
this device.*)
  function Get_postOp:String;
  procedure Set_postOp(v:String);
(*A goal towards an action is taken. Can be concrete or abstract.*)
  function Get_purpose:IThing;
  procedure Set_purpose(v:IThing);
(*A possible complication and/or side effect of this therapy. If it is known 
that an adverse outcome is serious (resulting in death, disability, or 
permanent damage; requiring hospitalization; or is otherwise life-threatening 
or requires immediate medical attention), tag it as a seriouseAdverseOutcome 
instead.*)
  function Get_adverseOutcome:IMedicalEntity;
  procedure Set_adverseOutcome(v:IMedicalEntity);
(*A contraindication for this therapy.*)
  function Get_contraindication:IMedicalContraindication;
  procedure Set_contraindication(v:IMedicalContraindication);
(*A description of the procedure involved in setting up, using, and/or 
installing the device.*)
  function Get__procedure:String;
  procedure Set__procedure(v:String);
// properties
  property preOp:String read Get_preOp write Set_preOp;
  property postOp:String read Get_postOp write Set_postOp;
  property purpose:IThing read Get_purpose write Set_purpose;
  property adverseOutcome:IMedicalEntity read Get_adverseOutcome write Set_adverseOutcome;
  property contraindication:IMedicalContraindication read Get_contraindication write Set_contraindication;
  property _procedure:String read Get__procedure write Set__procedure;
end;
(*** end IMedicalDevice ***)


(* MedicalContraindication
A condition or factor that serves as a reason to withhold a certain medical 
therapy. Contraindications can be absolute (there are no reasonable 
circumstances for undertaking a course of action) or relative (the patient is 
at higher risk of complications, but that these risks may be outweighed by 
other considerations or mitigated by other measures).
*)
IMedicalContraindication=Interface (IMedicalEntity)
 (*No atribs*)
end;
(*** end IMedicalContraindication ***)

IMaximumDoseSchedule=interface; //forward


(* Substance
Any matter of defined composition that has discrete existence, whose origin may 
be biological, mineral or chemical.
*)
ISubstance=Interface (IMedicalEntity)
(*Recommended intake of this supplement for a given population as defined by a 
specific recommending authority.*)
  function Get_maximumIntake:IMaximumDoseSchedule;
  procedure Set_maximumIntake(v:IMaximumDoseSchedule);
// properties
  property maximumIntake:IMaximumDoseSchedule read Get_maximumIntake write Set_maximumIntake;
end;
(*** end ISubstance ***)

IQualitativeValue=interface; //forward


(* DoseSchedule
A specific dosing schedule for a drug or supplement.
*)
IDoseSchedule=Interface (IMedicalIntangible)
(*The unit of the dose, e.g. 'mg'.*)
  function Get_doseUnit:String;
  procedure Set_doseUnit(v:String);
(*The value of the dose, e.g. 500.*)
  function Get_doseValue:IQualitativeValue;
  procedure Set_doseValue(v:IQualitativeValue);
(*How often the dose is taken, e.g. 'daily'.*)
  function Get_frequency:String;
  procedure Set_frequency(v:String);
// properties
  property doseUnit:String read Get_doseUnit write Set_doseUnit;
  property doseValue:IQualitativeValue read Get_doseValue write Set_doseValue;
  property frequency:String read Get_frequency write Set_frequency;
end;
(*** end IDoseSchedule ***)

IPropertyValue=interface; //forward


(* QualitativeValue
A predefined value for a product characteristic, e.g. the power cord plug type 
'US' or the garment sizes 'S', 'M', 'L', and 'XL'.
*)
IQualitativeValue=Interface (IEnumeration)
(*This ordering relation for qualitative values indicates that the subject is 
lesser than the object.*)
  function Get_lesser:IQualitativeValue;
  procedure Set_lesser(v:IQualitativeValue);
(*This ordering relation for qualitative values indicates that the subject is 
not equal to the object.*)
  function Get_nonEqual:IQualitativeValue;
  procedure Set_nonEqual(v:IQualitativeValue);
(*This ordering relation for qualitative values indicates that the subject is 
lesser than or equal to the object.*)
  function Get_lesserOrEqual:IQualitativeValue;
  procedure Set_lesserOrEqual(v:IQualitativeValue);
(*This ordering relation for qualitative values indicates that the subject is 
greater than the object.*)
  function Get_greater:IQualitativeValue;
  procedure Set_greater(v:IQualitativeValue);
(**)
  function Get_additionalProperty:IPropertyValue;
  procedure Set_additionalProperty(v:IPropertyValue);
(*This ordering relation for qualitative values indicates that the subject is 
equal to the object.*)
  function Get_equal:IQualitativeValue;
  procedure Set_equal(v:IQualitativeValue);
(*This ordering relation for qualitative values indicates that the subject is 
greater than or equal to the object.*)
  function Get_greaterOrEqual:IQualitativeValue;
  procedure Set_greaterOrEqual(v:IQualitativeValue);
// properties
  property lesser:IQualitativeValue read Get_lesser write Set_lesser;
  property nonEqual:IQualitativeValue read Get_nonEqual write Set_nonEqual;
  property lesserOrEqual:IQualitativeValue read Get_lesserOrEqual write Set_lesserOrEqual;
  property greater:IQualitativeValue read Get_greater write Set_greater;
  property additionalProperty:IPropertyValue read Get_additionalProperty write Set_additionalProperty;
  property equal:IQualitativeValue read Get_equal write Set_equal;
  property greaterOrEqual:IQualitativeValue read Get_greaterOrEqual write Set_greaterOrEqual;
end;
(*** end IQualitativeValue ***)


(* PropertyValue
*)
IPropertyValue=Interface (IStructuredValue)
(*The lower value of some characteristic or property.*)
  function Get_minValue:INumber;
  procedure Set_minValue(v:INumber);
(*A commonly used identifier for the characteristic represented by the 
property, e.g. a manufacturer or a standard code for a property. propertyID can 
be
(1) a prefixed string, mainly meant to be used with standards for product 
properties; (2) a site-specific, non-prefixed string (e.g. the primary key of 
the property or the vendor-specific id of the property), or (3)
a URL 
indicating the type of the property, either pointing to an external vocabulary, 
or a Web resource that describes the property (e.g. a glossary 
entry).
Standards bodies should promote a standard prefix for the identifiers 
of properties from their standards.*)
  function Get_propertyID:String;
  procedure Set_propertyID(v:String);
// properties
  property minValue:INumber read Get_minValue write Set_minValue;
  property propertyID:String read Get_propertyID write Set_propertyID;
end;
(*** end IPropertyValue ***)


(* MaximumDoseSchedule
The maximum dosing schedule considered safe for a drug or supplement as 
recommended by an authority or by the drug/supplement's manufacturer. Capture 
the recommending authority in the recognizingAuthority property of 
MedicalEntity.
*)
IMaximumDoseSchedule=Interface (IDoseSchedule)
 (*No atribs*)
end;
(*** end IMaximumDoseSchedule ***)

IHealthInsurancePlan=interface; //forward

IDrugCost=interface; //forward

IDrugPregnancyCategory=interface; //forward

IDrugPrescriptionStatus=interface; //forward

IDrugStrength=interface; //forward

IDrugClass=interface; //forward


(* Drug
A chemical or biologic substance, used as a medical therapy, that has a 
physiological effect on an organism. Here the term drug is used interchangeably 
with the term medicine although clinical knowledge make a clear difference 
between them.
*)
IDrug=Interface (ISubstance)
(*Any FDA or other warnings about the drug (text or URL).*)
  function Get_warning:String;
  procedure Set_warning(v:String);
(*The insurance plans that cover this drug.*)
  function Get_includedInHealthInsurancePlan:IHealthInsurancePlan;
  procedure Set_includedInHealthInsurancePlan(v:IHealthInsurancePlan);
(*Proprietary name given to the diet plan, typically by its originator or 
creator.*)
  function Get_proprietaryName:String;
  procedure Set_proprietaryName(v:String);
(*Cost per unit of the drug, as reported by the source being tagged.*)
  function Get_cost:IDrugCost;
  procedure Set_cost(v:IDrugCost);
(*The unit in which the drug is measured, e.g. '5 mg tablet'.*)
  function Get_drugUnit:String;
  procedure Set_drugUnit(v:String);
(*Pregnancy category of this drug.*)
  function Get_pregnancyCategory:IDrugPregnancyCategory;
  procedure Set_pregnancyCategory(v:IDrugPregnancyCategory);
(*A dosing schedule for the drug for a given population, either observed, 
recommended, or maximum dose based on the type used.*)
  function Get_doseSchedule:IDoseSchedule;
  procedure Set_doseSchedule(v:IDoseSchedule);
(*A dosage form in which this drug/supplement is available, e.g. 'tablet', 
'suspension', 'injection'.*)
  function Get_dosageForm:String;
  procedure Set_dosageForm(v:String);
(*Link to prescribing information for the drug.*)
  function Get_prescribingInfo:String;
  procedure Set_prescribingInfo(v:String);
(*Indicates the status of drug prescription eg. local catalogs classifications 
or whether the drug is available by prescription or over-the-counter, etc.*)
  function Get_prescriptionStatus:IDrugPrescriptionStatus;
  procedure Set_prescriptionStatus(v:IDrugPrescriptionStatus);
(*The RxCUI drug identifier from RXNORM.*)
  function Get_rxcui:String;
  procedure Set_rxcui(v:String);
(*Any precaution, guidance, contraindication, etc. related to this drug's use 
during pregnancy.*)
  function Get_pregnancyWarning:String;
  procedure Set_pregnancyWarning(v:String);
(*An available dosage strength for the drug.*)
  function Get_availableStrength:IDrugStrength;
  procedure Set_availableStrength(v:IDrugStrength);
(*Description of the absorption and elimination of drugs, including their 
concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, 
pD).*)
  function Get_clincalPharmacology:String;
  procedure Set_clincalPharmacology(v:String);
(*Any other drug related to this one, for example commonly-prescribed 
alternatives.*)
  function Get_relatedDrug:IDrug;
  procedure Set_relatedDrug(v:IDrug);
(*The class of drug this belongs to (e.g., statins).*)
  function Get_drugClass:IDrugClass;
  procedure Set_drugClass(v:IDrugClass);
(*A route by which this drug may be administered, e.g. 'oral'.*)
  function Get_administrationRoute:String;
  procedure Set_administrationRoute(v:String);
(*Any precaution, guidance, contraindication, etc. related to this drug's use 
by breastfeeding mothers.*)
  function Get_breastfeedingWarning:String;
  procedure Set_breastfeedingWarning(v:String);
(*Another drug that is known to interact with this drug in a way that impacts 
the effect of this drug or causes a risk to the patient. Note: disease 
interactions are typically captured as contraindications.*)
  function Get_interactingDrug:IDrug;
  procedure Set_interactingDrug(v:IDrug);
(*Any precaution, guidance, contraindication, etc. related to consumption of 
specific foods while taking this drug.*)
  function Get_foodWarning:String;
  procedure Set_foodWarning(v:String);
(*Any precaution, guidance, contraindication, etc. related to consumption of 
alcohol while taking this drug.*)
  function Get_alcoholWarning:String;
  procedure Set_alcoholWarning(v:String);
(*Link to the drug's label details.*)
  function Get_labelDetails:String;
  procedure Set_labelDetails(v:String);
(*Any information related to overdose on a drug, including signs or symptoms, 
treatments, contact information for emergency response.*)
  function Get_overdosage:String;
  procedure Set_overdosage(v:String);
(*True if the drug is available in a generic form (regardless of name).*)
  function Get_isAvailableGenerically:Boolean;
  procedure Set_isAvailableGenerically(v:Boolean);
// properties
  property warning:String read Get_warning write Set_warning;
  property includedInHealthInsurancePlan:IHealthInsurancePlan read Get_includedInHealthInsurancePlan write Set_includedInHealthInsurancePlan;
  property proprietaryName:String read Get_proprietaryName write Set_proprietaryName;
  property cost:IDrugCost read Get_cost write Set_cost;
  property drugUnit:String read Get_drugUnit write Set_drugUnit;
  property pregnancyCategory:IDrugPregnancyCategory read Get_pregnancyCategory write Set_pregnancyCategory;
  property doseSchedule:IDoseSchedule read Get_doseSchedule write Set_doseSchedule;
  property dosageForm:String read Get_dosageForm write Set_dosageForm;
  property prescribingInfo:String read Get_prescribingInfo write Set_prescribingInfo;
  property prescriptionStatus:IDrugPrescriptionStatus read Get_prescriptionStatus write Set_prescriptionStatus;
  property rxcui:String read Get_rxcui write Set_rxcui;
  property pregnancyWarning:String read Get_pregnancyWarning write Set_pregnancyWarning;
  property availableStrength:IDrugStrength read Get_availableStrength write Set_availableStrength;
  property clincalPharmacology:String read Get_clincalPharmacology write Set_clincalPharmacology;
  property relatedDrug:IDrug read Get_relatedDrug write Set_relatedDrug;
  property drugClass:IDrugClass read Get_drugClass write Set_drugClass;
  property administrationRoute:String read Get_administrationRoute write Set_administrationRoute;
  property breastfeedingWarning:String read Get_breastfeedingWarning write Set_breastfeedingWarning;
  property interactingDrug:IDrug read Get_interactingDrug write Set_interactingDrug;
  property foodWarning:String read Get_foodWarning write Set_foodWarning;
  property alcoholWarning:String read Get_alcoholWarning write Set_alcoholWarning;
  property labelDetails:String read Get_labelDetails write Set_labelDetails;
  property overdosage:String read Get_overdosage write Set_overdosage;
  property isAvailableGenerically:Boolean read Get_isAvailableGenerically write Set_isAvailableGenerically;
end;
(*** end IDrug ***)

IHealthPlanNetwork=interface; //forward

IHealthPlanFormulary=interface; //forward


(* HealthInsurancePlan
A US-style health insurance plan, including PPOs, EPOs, and HMOs.
*)
IHealthInsurancePlan=Interface (IIntangible)
(*Networks covered by this plan.*)
  function Get_includesHealthPlanNetwork:IHealthPlanNetwork;
  procedure Set_includesHealthPlanNetwork(v:IHealthPlanNetwork);
(*The 14-character, HIOS-generated Plan ID number. (Plan IDs must be unique, 
even across different markets.)*)
  function Get_healthPlanId:String;
  procedure Set_healthPlanId(v:String);
(*The tier(s) of drugs offered by this formulary or insurance plan.*)
  function Get_healthPlanDrugTier:String;
  procedure Set_healthPlanDrugTier(v:String);
(*The URL that goes directly to the plan brochure for the specific standard 
plan or plan variation.*)
  function Get_healthPlanMarketingUrl:String;
  procedure Set_healthPlanMarketingUrl(v:String);
(*The standard for interpreting thePlan ID. The preferred is "HIOS". See the 
Centers for Medicare &amp;amp; Medicaid Services for more details.*)
  function Get_usesHealthPlanIdStandard:String;
  procedure Set_usesHealthPlanIdStandard(v:String);
(*TODO.*)
  function Get_healthPlanDrugOption:String;
  procedure Set_healthPlanDrugOption(v:String);
(*Formularies covered by this plan.*)
  function Get_includesHealthPlanFormulary:IHealthPlanFormulary;
  procedure Set_includesHealthPlanFormulary(v:IHealthPlanFormulary);
(*The URL that goes directly to the summary of benefits and coverage for the 
specific standard plan or plan variation.*)
  function Get_benefitsSummaryUrl:String;
  procedure Set_benefitsSummaryUrl(v:String);
// properties
  property includesHealthPlanNetwork:IHealthPlanNetwork read Get_includesHealthPlanNetwork write Set_includesHealthPlanNetwork;
  property healthPlanId:String read Get_healthPlanId write Set_healthPlanId;
  property healthPlanDrugTier:String read Get_healthPlanDrugTier write Set_healthPlanDrugTier;
  property healthPlanMarketingUrl:String read Get_healthPlanMarketingUrl write Set_healthPlanMarketingUrl;
  property usesHealthPlanIdStandard:String read Get_usesHealthPlanIdStandard write Set_usesHealthPlanIdStandard;
  property healthPlanDrugOption:String read Get_healthPlanDrugOption write Set_healthPlanDrugOption;
  property includesHealthPlanFormulary:IHealthPlanFormulary read Get_includesHealthPlanFormulary write Set_includesHealthPlanFormulary;
  property benefitsSummaryUrl:String read Get_benefitsSummaryUrl write Set_benefitsSummaryUrl;
end;
(*** end IHealthInsurancePlan ***)


(* HealthPlanNetwork
A US-style health insurance plan network.
*)
IHealthPlanNetwork=Interface (IIntangible)
(*The tier(s) for this network.*)
  function Get_healthPlanNetworkTier:String;
  procedure Set_healthPlanNetworkTier(v:String);
(*Whether The costs to the patient for services under this network or 
formulary.*)
  function Get_healthPlanCostSharing:Boolean;
  procedure Set_healthPlanCostSharing(v:Boolean);
// properties
  property healthPlanNetworkTier:String read Get_healthPlanNetworkTier write Set_healthPlanNetworkTier;
  property healthPlanCostSharing:Boolean read Get_healthPlanCostSharing write Set_healthPlanCostSharing;
end;
(*** end IHealthPlanNetwork ***)


(* HealthPlanFormulary
For a given health insurance plan, the specification for costs and coverage of 
prescription drugs.
*)
IHealthPlanFormulary=Interface (IIntangible)
(*Whether prescriptions can be delivered by mail.*)
  function Get_offersPrescriptionByMail:Boolean;
  procedure Set_offersPrescriptionByMail(v:Boolean);
// properties
  property offersPrescriptionByMail:Boolean read Get_offersPrescriptionByMail write Set_offersPrescriptionByMail;
end;
(*** end IHealthPlanFormulary ***)

IDrugCostCategory=interface; //forward


(* DrugCost
The cost per unit of a medical drug. Note that this type is not meant to 
represent the price in an offer of a drug for sale; see the Offer type for 
that. This type will typically be used to tag wholesale or average retail cost 
of a drug, or maximum reimbursable cost. Costs of medical drugs vary widely 
depending on how and where they are paid for, so while this type captures some 
of the variables, costs should be used with caution by consumers of this 
schema's markup.
*)
IDrugCost=Interface (IMedicalEnumeration)
(*The cost per unit of the drug.*)
  function Get_costPerUnit:IQualitativeValue;
  procedure Set_costPerUnit(v:IQualitativeValue);
(*The location in which the status applies.*)
  function Get_applicableLocation:IAdministrativeArea;
  procedure Set_applicableLocation(v:IAdministrativeArea);
(*The category of cost, such as wholesale, retail, reimbursement cap, etc.*)
  function Get_costCategory:IDrugCostCategory;
  procedure Set_costCategory(v:IDrugCostCategory);
(*The currency (in 3-letter of the drug cost. See: 
http://en.wikipedia.org/wiki/ISO_4217*)
  function Get_costCurrency:String;
  procedure Set_costCurrency(v:String);
(*Additional details to capture the origin of the cost data. For example, 
'Medicare Part B'.*)
  function Get_costOrigin:String;
  procedure Set_costOrigin(v:String);
// properties
  property costPerUnit:IQualitativeValue read Get_costPerUnit write Set_costPerUnit;
  property applicableLocation:IAdministrativeArea read Get_applicableLocation write Set_applicableLocation;
  property costCategory:IDrugCostCategory read Get_costCategory write Set_costCategory;
  property costCurrency:String read Get_costCurrency write Set_costCurrency;
  property costOrigin:String read Get_costOrigin write Set_costOrigin;
end;
(*** end IDrugCost ***)


(* DrugCostCategory
Enumerated categories of medical drug costs.
*)
IDrugCostCategory=Interface (IMedicalEnumeration)
  function TangDrugCostCategory:TangibleValue;
end;
(*** end IDrugCostCategory ***)


(* DrugPregnancyCategory
Categories that represent an assessment of the risk of fetal injury due to a 
drug or pharmaceutical used as directed by the mother during pregnancy.
*)
IDrugPregnancyCategory=Interface (IMedicalEnumeration)
  function TangDrugPregnancyCategory:TangibleValue;
end;
(*** end IDrugPregnancyCategory ***)


(* DrugPrescriptionStatus
Indicates whether this drug is available by prescription or over-the-counter.
*)
IDrugPrescriptionStatus=Interface (IMedicalEnumeration)
  function TangDrugPrescriptionStatus:TangibleValue;
end;
(*** end IDrugPrescriptionStatus ***)


(* DrugStrength
A specific strength in which a medical drug is available in a specific country.
*)
IDrugStrength=Interface (IMedicalIntangible)
(*The units of an active ingredient's strength, e.g. mg.*)
  function Get_strengthUnit:String;
  procedure Set_strengthUnit(v:String);
(*An active ingredient, typically chemical compounds and/or biologic 
substances.*)
  function Get_activeIngredient:String;
  procedure Set_activeIngredient(v:String);
(*The location in which the strength is available.*)
  function Get_availableIn:IAdministrativeArea;
  procedure Set_availableIn(v:IAdministrativeArea);
(*The value of an active ingredient's strength, e.g. 325.*)
  function Get_strengthValue:INumber;
  procedure Set_strengthValue(v:INumber);
// properties
  property strengthUnit:String read Get_strengthUnit write Set_strengthUnit;
  property activeIngredient:String read Get_activeIngredient write Set_activeIngredient;
  property availableIn:IAdministrativeArea read Get_availableIn write Set_availableIn;
  property strengthValue:INumber read Get_strengthValue write Set_strengthValue;
end;
(*** end IDrugStrength ***)


(* DrugClass
A class of medical drugs, e.g., statins. Classes can represent general 
pharmacological class, common mechanisms of action, common physiological 
effects, etc.
*)
IDrugClass=Interface (IMedicalEnumeration)
(*Specifying a drug or medicine used in a medication procedure*)
  function Get_drug:IDrug;
  procedure Set_drug(v:IDrug);
// properties
  property drug:IDrug read Get_drug write Set_drug;
end;
(*** end IDrugClass ***)


(* MedicalSignOrSymptom
Any feature associated or not with a medical condition. In medicine a symptom 
is generally subjective while a sign is objective.
*)
IMedicalSignOrSymptom=Interface (IMedicalCondition)
 (*No atribs*)
end;
(*** end IMedicalSignOrSymptom ***)

IPhysicalExam=interface; //forward


(* MedicalSign
Any physical manifestation of a person's medical condition discoverable by 
objective diagnostic tests or physical examination.
*)
IMedicalSign=Interface (IMedicalSignOrSymptom)
(*A diagnostic test that can identify this sign.*)
  function Get_identifyingTest:IMedicalTest;
  procedure Set_identifyingTest(v:IMedicalTest);
(*A physical examination that can identify this sign.*)
  function Get_identifyingExam:IPhysicalExam;
  procedure Set_identifyingExam(v:IPhysicalExam);
// properties
  property identifyingTest:IMedicalTest read Get_identifyingTest write Set_identifyingTest;
  property identifyingExam:IPhysicalExam read Get_identifyingExam write Set_identifyingExam;
end;
(*** end IMedicalSign ***)


(* PhysicalExam
A type of physical examination of a patient performed by a physician.
*)
IPhysicalExam=Interface (IMedicalEnumeration)
  function TangPhysicalExam:TangibleValue;
end;
(*** end IPhysicalExam ***)


(* MedicalCause
The causative agent(s) that are responsible for the pathophysiologic process 
that eventually results in a medical condition, symptom or sign. In this 
schema, unless otherwise specified this is meant to be the proximate cause of 
the medical condition, symptom or sign. The proximate cause is defined as the 
causative agent that most directly results in the medical condition, symptom or 
sign. For example, the HIV virus could be considered a cause of AIDS. Or in a 
diagnostic context, if a patient fell and sustained a hip fracture and two days 
later sustained a pulmonary embolism which eventuated in a cardiac arrest, the 
cause of the cardiac arrest (the proximate cause) would be the pulmonary 
embolism and not the fall. Medical causes can include cardiovascular, chemical, 
dermatologic, endocrine, environmental, gastroenterologic, genetic, 
hematologic, gynecologic, iatrogenic, infectious, musculoskeletal, neurologic, 
nutritional, obstetric, oncologic, otolaryngologic, pharmacologic, psychiatric, 
pulmonary, renal, rheumatologic, toxic, traumatic, or urologic causes; medical 
conditions can be causes as well.
*)
IMedicalCause=Interface (IMedicalEntity)
(*The condition, complication, symptom, sign, etc. caused.*)
  function Get_causeOf:IMedicalEntity;
  procedure Set_causeOf(v:IMedicalEntity);
// properties
  property causeOf:IMedicalEntity read Get_causeOf write Set_causeOf;
end;
(*** end IMedicalCause ***)


(* MedicalStudyStatus
The status of a medical study. Enumerated type.
*)
IMedicalStudyStatus=Interface (IMedicalEnumeration)
  function TangMedicalStudyStatus:TangibleValue;
end;
(*** end IMedicalStudyStatus ***)

IAnatomicalSystem=interface; //forward


(* AnatomicalStructure
Any part of the human body, typically a component of an anatomical system. 
Organs, tissues, and cells are all anatomical structures.
*)
IAnatomicalStructure=Interface (IMedicalEntity)
(*A medical therapy related to this anatomy.*)
  function Get_relatedTherapy:IMedicalTherapy;
  procedure Set_relatedTherapy(v:IMedicalTherapy);
(*Function of the anatomical structure.*)
  function Get__function:String;
  procedure Set__function(v:String);
(*Other anatomical structures to which this structure is connected.*)
  function Get_connectedTo:IAnatomicalStructure;
  procedure Set_connectedTo(v:IAnatomicalStructure);
(*An image containing a diagram that illustrates the structure and/or its 
component substructures and/or connections with other structures.*)
  function Get_diagram:IImageObject;
  procedure Set_diagram(v:IImageObject);
(*The anatomical or organ system that this structure is part of.*)
  function Get_partOfSystem:IAnatomicalSystem;
  procedure Set_partOfSystem(v:IAnatomicalSystem);
(*Component (sub-)structure(s) that comprise this anatomical structure.*)
  function Get_subStructure:IAnatomicalStructure;
  procedure Set_subStructure(v:IAnatomicalStructure);
// properties
  property relatedTherapy:IMedicalTherapy read Get_relatedTherapy write Set_relatedTherapy;
  property _function:String read Get__function write Set__function;
  property connectedTo:IAnatomicalStructure read Get_connectedTo write Set_connectedTo;
  property diagram:IImageObject read Get_diagram write Set_diagram;
  property partOfSystem:IAnatomicalSystem read Get_partOfSystem write Set_partOfSystem;
  property subStructure:IAnatomicalStructure read Get_subStructure write Set_subStructure;
end;
(*** end IAnatomicalStructure ***)


(* AnatomicalSystem
An anatomical system is a group of anatomical structures that work together to 
perform a certain task. Anatomical systems, such as organ systems, are one 
organizing principle of anatomy, and can includes circulatory, digestive, 
endocrine, integumentary, immune, lymphatic, muscular, nervous, reproductive, 
respiratory, skeletal, urinary, vestibular, and other systems.
*)
IAnatomicalSystem=Interface (IMedicalEntity)
(*Specifying something physically contained by something else. Typically used 
here for the underlying anatomical structures, such as organs, that comprise 
the anatomical system.*)
  function Get_comprisedOf:IAnatomicalStructure;
  procedure Set_comprisedOf(v:IAnatomicalStructure);
(*If applicable, a description of the pathophysiology associated with the 
anatomical system, including potential abnormal changes in the mechanical, 
physical, and biochemical functions of the system.*)
  function Get_associatedPathophysiology:String;
  procedure Set_associatedPathophysiology(v:String);
(*A medical condition associated with this anatomy.*)
  function Get_relatedCondition:IMedicalCondition;
  procedure Set_relatedCondition(v:IMedicalCondition);
(*Related anatomical structure(s) that are not part of the system but relate or 
connect to it, such as vascular bundles associated with an organ system.*)
  function Get_relatedStructure:IAnatomicalStructure;
  procedure Set_relatedStructure(v:IAnatomicalStructure);
// properties
  property comprisedOf:IAnatomicalStructure read Get_comprisedOf write Set_comprisedOf;
  property associatedPathophysiology:String read Get_associatedPathophysiology write Set_associatedPathophysiology;
  property relatedCondition:IMedicalCondition read Get_relatedCondition write Set_relatedCondition;
  property relatedStructure:IAnatomicalStructure read Get_relatedStructure write Set_relatedStructure;
end;
(*** end IAnatomicalSystem ***)


(* MedicalRiskFactor
A risk factor is anything that increases a person's likelihood of developing or 
contracting a disease, medical condition, or complication.
*)
IMedicalRiskFactor=Interface (IMedicalEntity)
(*The condition, complication, etc. influenced by this factor.*)
  function Get_increasesRiskOf:IMedicalEntity;
  procedure Set_increasesRiskOf(v:IMedicalEntity);
// properties
  property increasesRiskOf:IMedicalEntity read Get_increasesRiskOf write Set_increasesRiskOf;
end;
(*** end IMedicalRiskFactor ***)


(* DDxElement
An alternative, closely-related condition typically considered later in the 
differential diagnosis process along with the signs that are used to 
distinguish it.
*)
IDDxElement=Interface (IMedicalIntangible)
(*One or more alternative conditions considered in the differential diagnosis 
process as output of a diagnosis process.*)
  function Get_diagnosis:IMedicalCondition;
  procedure Set_diagnosis(v:IMedicalCondition);
(*One of a set of signs and symptoms that can be used to distinguish this 
diagnosis from others in the differential diagnosis.*)
  function Get_distinguishingSign:IMedicalSignOrSymptom;
  procedure Set_distinguishingSign(v:IMedicalSignOrSymptom);
// properties
  property diagnosis:IMedicalCondition read Get_diagnosis write Set_diagnosis;
  property distinguishingSign:IMedicalSignOrSymptom read Get_distinguishingSign write Set_distinguishingSign;
end;
(*** end IDDxElement ***)


(* MedicalConditionStage
A stage of a medical condition, such as 'Stage IIIa'.
*)
IMedicalConditionStage=Interface (IMedicalIntangible)
(*The stage represented as a number, e.g. 3.*)
  function Get_stageAsNumber:INumber;
  procedure Set_stageAsNumber(v:INumber);
(*The substage, e.g. 'a' for Stage IIIa.*)
  function Get_subStageSuffix:String;
  procedure Set_subStageSuffix(v:String);
// properties
  property stageAsNumber:INumber read Get_stageAsNumber write Set_stageAsNumber;
  property subStageSuffix:String read Get_subStageSuffix write Set_subStageSuffix;
end;
(*** end IMedicalConditionStage ***)


(* Specialty
Any branch of a field in which people typically develop specific expertise, 
usually after significant study, time, and effort.
*)
ISpecialty=Interface (IEnumeration)
  function TangSpecialty:TangibleValue;
end;
(*** end ISpecialty ***)


(* MedicalSpecialty
Any specific branch of medical science or practice. Medical specialities 
include clinical specialties that pertain to particular organ systems and their 
respective disease states, as well as allied health specialties. Enumerated 
type.
*)
IMedicalSpecialty=Interface (ISpecialty)
  function TangMedicalSpecialty:TangibleValue;
end;
(*** end IMedicalSpecialty ***)


(* BloodTest
A medical test performed on a sample of a patient's blood.
*)
IBloodTest=Interface (IMedicalTest)
 (*No atribs*)
end;
(*** end IBloodTest ***)


(* Store
A retail good store.
*)
IStore=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IStore ***)


(* OutletStore
An outlet store.
*)
IOutletStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IOutletStore ***)

ICreativeWorkSeason=interface; //forward


(* Clip
A short TV or radio program or a segment/part of a program.
*)
IClip=Interface (ICreativeWork)
(*The episode to which this clip belongs.*)
  function Get_partOfEpisode:IEpisode;
  procedure Set_partOfEpisode(v:IEpisode);
(*Position of the clip within an ordered group of clips.*)
  function Get_clipNumber:String;
  procedure Set_clipNumber(v:String);
(*The season to which this episode belongs.*)
  function Get_partOfSeason:ICreativeWorkSeason;
  procedure Set_partOfSeason(v:ICreativeWorkSeason);
(*A director of e.g. tv, radio, movie, video games etc. content. Directors can 
be associated with individual items or with a series, episode, clip.*)
  function Get_directors:IPerson;
  procedure Set_directors(v:IPerson);
// properties
  property partOfEpisode:IEpisode read Get_partOfEpisode write Set_partOfEpisode;
  property clipNumber:String read Get_clipNumber write Set_clipNumber;
  property partOfSeason:ICreativeWorkSeason read Get_partOfSeason write Set_partOfSeason;
  property directors:IPerson read Get_directors write Set_directors;
end;
(*** end IClip ***)


(* CreativeWorkSeason
A media season e.g. tv, radio, video game etc.
*)
ICreativeWorkSeason=Interface (ICreativeWork)
(*An episode of a TV/radio series or season.*)
  function Get_episodes:IEpisode;
  procedure Set_episodes(v:IEpisode);
(*Position of the season within an ordered group of seasons.*)
  function Get_seasonNumber:Integer;
  procedure Set_seasonNumber(v:Integer);
// properties
  property episodes:IEpisode read Get_episodes write Set_episodes;
  property seasonNumber:Integer read Get_seasonNumber write Set_seasonNumber;
end;
(*** end ICreativeWorkSeason ***)


(* VideoGameClip
A short segment/part of a video game.
*)
IVideoGameClip=Interface (IClip)
 (*No atribs*)
end;
(*** end IVideoGameClip ***)


(* SurgicalProcedure
A type of medical procedure that involves invasive surgical techniques.
*)
ISurgicalProcedure=Interface (IMedicalProcedure)
 (*No atribs*)
end;
(*** end ISurgicalProcedure ***)


(* DepartmentStore
A department store.
*)
IDepartmentStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IDepartmentStore ***)


(* ToyStore
A toy store.
*)
IToyStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IToyStore ***)


(* Library
A library.
*)
ILibrary=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end ILibrary ***)


(* HighSchool
A high school.
*)
IHighSchool=Interface (IEducationalOrganization)
 (*No atribs*)
end;
(*** end IHighSchool ***)


(* LegalService
*)
ILegalService=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end ILegalService ***)


(* Notary
A notary.
*)
INotary=Interface (ILegalService)
 (*No atribs*)
end;
(*** end INotary ***)


(* MovieClip
A short segment/part of a movie.
*)
IMovieClip=Interface (IClip)
 (*No atribs*)
end;
(*** end IMovieClip ***)


(* ConsumeAction
The act of ingesting information/resources/food.
*)
IConsumeAction=Interface (IAction)
(*An Offer which must be accepted before the user can perform the Action. For 
example, the user may need to buy a movie before being able to watch it.*)
  function Get_expectsAcceptanceOf:IOffer;
  procedure Set_expectsAcceptanceOf(v:IOffer);
// properties
  property expectsAcceptanceOf:IOffer read Get_expectsAcceptanceOf write Set_expectsAcceptanceOf;
end;
(*** end IConsumeAction ***)


(* DrinkAction
The act of swallowing liquids.
*)
IDrinkAction=Interface (IConsumeAction)
 (*No atribs*)
end;
(*** end IDrinkAction ***)


(* CivicStructure
A public structure, such as a town hall or concert hall.
*)
ICivicStructure=Interface (IPlace)
 (*No atribs*)
end;
(*** end ICivicStructure ***)


(* GovernmentBuilding
A government building.
*)
IGovernmentBuilding=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IGovernmentBuilding ***)


(* CityHall
A city hall.
*)
ICityHall=Interface (IGovernmentBuilding)
 (*No atribs*)
end;
(*** end ICityHall ***)


(* SportsActivityLocation
A sports location, such as a playing field.
*)
ISportsActivityLocation=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end ISportsActivityLocation ***)


(* ExerciseGym
A gym.
*)
IExerciseGym=Interface (ISportsActivityLocation)
 (*No atribs*)
end;
(*** end IExerciseGym ***)


(* ElementarySchool
An elementary school.
*)
IElementarySchool=Interface (IEducationalOrganization)
 (*No atribs*)
end;
(*** end IElementarySchool ***)


(* OrganizeAction
The act of manipulating/administering/supervising/controlling one or more 
objects.
*)
IOrganizeAction=Interface (IAction)
 (*No atribs*)
end;
(*** end IOrganizeAction ***)


(* AllocateAction
The act of organizing tasks/objects/events by associating resources to it.
*)
IAllocateAction=Interface (IOrganizeAction)
 (*No atribs*)
end;
(*** end IAllocateAction ***)


(* AssignAction
The act of allocating an action/event/task to some destination (someone or 
something).
*)
IAssignAction=Interface (IAllocateAction)
 (*No atribs*)
end;
(*** end IAssignAction ***)


(* EntertainmentBusiness
A business providing entertainment.
*)
IEntertainmentBusiness=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IEntertainmentBusiness ***)


(* Casino
A casino.
*)
ICasino=Interface (IEntertainmentBusiness)
 (*No atribs*)
end;
(*** end ICasino ***)


(* MoveAction
*)
IMoveAction=Interface (IAction)
(*A sub property of location. The final location of the object or the agent 
after the action.*)
  function Get_toLocation:IPlace;
  procedure Set_toLocation(v:IPlace);
// properties
  property toLocation:IPlace read Get_toLocation write Set_toLocation;
end;
(*** end IMoveAction ***)


(* DepartAction
The act of  departing from a place. An agent departs from an fromLocation for a 
destination, optionally with participants.
*)
IDepartAction=Interface (IMoveAction)
 (*No atribs*)
end;
(*** end IDepartAction ***)


(* TelevisionChannel
A unique instance of a television BroadcastService on a CableOrSatelliteService 
lineup.
*)
ITelevisionChannel=Interface (IBroadcastChannel)
  function TangTelevisionChannel:TangibleValue;
end;
(*** end ITelevisionChannel ***)


(* HobbyShop
A store that sells materials useful or necessary for various hobbies.
*)
IHobbyShop=Interface (IStore)
 (*No atribs*)
end;
(*** end IHobbyShop ***)


(* UserInteraction
*)
IUserInteraction=Interface (IEvent)
 (*No atribs*)
end;
(*** end IUserInteraction ***)


(* UserLikes
*)
IUserLikes=Interface (IUserInteraction)
 (*No atribs*)
end;
(*** end IUserLikes ***)


(* Float
Data type: Floating number.
*)
IFloat=Interface (INumber)
 (*No atribs*)
end;
(*** end IFloat ***)


(* Ligament
A short band of tough, flexible, fibrous connective tissue that functions to 
connect multiple bones, cartilages, and structurally support joints.
*)
ILigament=Interface (IAnatomicalStructure)
 (*No atribs*)
end;
(*** end ILigament ***)


(* HealthAndBeautyBusiness
Health and beauty.
*)
IHealthAndBeautyBusiness=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IHealthAndBeautyBusiness ***)


(* TattooParlor
A tattoo parlor.
*)
ITattooParlor=Interface (IHealthAndBeautyBusiness)
 (*No atribs*)
end;
(*** end ITattooParlor ***)


(* WebPageElement
A web page element, like a table or an image.
*)
IWebPageElement=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end IWebPageElement ***)


(* WPAdBlock
An advertising section of the page.
*)
IWPAdBlock=Interface (IWebPageElement)
 (*No atribs*)
end;
(*** end IWPAdBlock ***)


(* ApplyAction
*)
IApplyAction=Interface (IOrganizeAction)
 (*No atribs*)
end;
(*** end IApplyAction ***)


(* TheaterEvent
Event type: Theater performance.
*)
ITheaterEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end ITheaterEvent ***)


(* WatchAction
The act of consuming dynamic/moving visual content.
*)
IWatchAction=Interface (IConsumeAction)
 (*No atribs*)
end;
(*** end IWatchAction ***)


(* TouristAttraction
A tourist attraction.
*)
ITouristAttraction=Interface (IPlace)
 (*No atribs*)
end;
(*** end ITouristAttraction ***)


(* Landform
A landform or physical feature.  Landform elements include mountains, plains, 
lakes, rivers, seascape and oceanic waterbody interface features such as bays, 
peninsulas, seas and so forth, including sub-aqueous terrain features such as 
submersed mountain ranges, volcanoes, and the great ocean basins.
*)
ILandform=Interface (IPlace)
 (*No atribs*)
end;
(*** end ILandform ***)


(* Continent
One of the continents (for example, Europe or Africa).
*)
IContinent=Interface (ILandform)
 (*No atribs*)
end;
(*** end IContinent ***)


(* ControlAction
An agent controls a device or application.
*)
IControlAction=Interface (IAction)
 (*No atribs*)
end;
(*** end IControlAction ***)


(* ResumeAction
The act of resuming a device or application which was formerly paused (e.g. 
resume music playback or resume a timer).
*)
IResumeAction=Interface (IControlAction)
 (*No atribs*)
end;
(*** end IResumeAction ***)


(* Atlas
A collection or bound volume of maps, charts, plates or tables, physical or in 
media form illustrating any subject.
*)
IAtlas=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end IAtlas ***)


(* DanceEvent
Event type: A social dance.
*)
IDanceEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end IDanceEvent ***)


(* LodgingBusiness
A lodging business, such as a motel, hotel, or inn.
*)
ILodgingBusiness=Interface (ILocalBusiness)
(*Indicates whether pets are allowed to enter the accommodation or lodging 
business. More detailed information can be put in a text value.*)
  function Get_petsAllowed:Boolean;
  procedure Set_petsAllowed(v:Boolean);
(*The latest someone may check out of a lodging establishment.*)
  function Get_checkoutTime:TDateTime;
  procedure Set_checkoutTime(v:TDateTime);
(*The earliest someone may check into a lodging establishment.*)
  function Get_checkinTime:TDateTime;
  procedure Set_checkinTime(v:TDateTime);
(*An official rating for a lodging business or food establishment, e.g. from 
national associations or standards bodies. Use the author property to indicate 
the rating organization, e.g. as an Organization with name such as (e.g. 
HOTREC, DEHOGA, WHR, or Hotelstars).*)
  function Get_starRating:IRating;
  procedure Set_starRating(v:IRating);
// properties
  property petsAllowed:Boolean read Get_petsAllowed write Set_petsAllowed;
  property checkoutTime:TDateTime read Get_checkoutTime write Set_checkoutTime;
  property checkinTime:TDateTime read Get_checkinTime write Set_checkinTime;
  property starRating:IRating read Get_starRating write Set_starRating;
end;
(*** end ILodgingBusiness ***)


(* Hotel
*)
IHotel=Interface (ILodgingBusiness)
 (*No atribs*)
end;
(*** end IHotel ***)


(* MusicEvent
Event type: Music event.
*)
IMusicEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end IMusicEvent ***)


(* BowlingAlley
A bowling alley.
*)
IBowlingAlley=Interface (ISportsActivityLocation)
 (*No atribs*)
end;
(*** end IBowlingAlley ***)


(* CreateAction
The act of deliberately creating/producing/generating/building a result out of 
the agent.
*)
ICreateAction=Interface (IAction)
 (*No atribs*)
end;
(*** end ICreateAction ***)


(* FilmAction
The act of capturing sound and moving images on film, video, or digitally.
*)
IFilmAction=Interface (ICreateAction)
 (*No atribs*)
end;
(*** end IFilmAction ***)

IProgramMembership=interface; //forward

ITicket=interface; //forward

IReservationStatusType=interface; //forward


(* Reservation
*)
IReservation=Interface (IIntangible)
(*The total price for the reservation or ticket, including applicable taxes, 
shipping, etc.*)
  function Get_totalPrice:String;
  procedure Set_totalPrice(v:String);
(*A unique identifier for the reservation.*)
  function Get_reservationId:String;
  procedure Set_reservationId(v:String);
(*The date and time the reservation was modified.*)
  function Get_modifiedTime:TDateTime;
  procedure Set_modifiedTime(v:TDateTime);
(*Any membership in a frequent flyer, hotel loyalty program, etc. being applied 
to the reservation.*)
  function Get_programMembershipUsed:IProgramMembership;
  procedure Set_programMembershipUsed(v:IProgramMembership);
(*The date and time the reservation was booked.*)
  function Get_bookingTime:TDateTime;
  procedure Set_bookingTime(v:TDateTime);
(*A ticket associated with the reservation.*)
  function Get_reservedTicket:ITicket;
  procedure Set_reservedTicket(v:ITicket);
(*The thing -- flight, event, restaurant,etc. being reserved.*)
  function Get_reservationFor:IThing;
  procedure Set_reservationFor(v:IThing);
(*'bookingAgent' is an out-dated term indicating a 'broker' that serves as a 
booking agent.*)
  function Get_bookingAgent:IOrganization;
  procedure Set_bookingAgent(v:IOrganization);
(*The current status of the reservation.*)
  function Get_reservationStatus:IReservationStatusType;
  procedure Set_reservationStatus(v:IReservationStatusType);
// properties
  property totalPrice:String read Get_totalPrice write Set_totalPrice;
  property reservationId:String read Get_reservationId write Set_reservationId;
  property modifiedTime:TDateTime read Get_modifiedTime write Set_modifiedTime;
  property programMembershipUsed:IProgramMembership read Get_programMembershipUsed write Set_programMembershipUsed;
  property bookingTime:TDateTime read Get_bookingTime write Set_bookingTime;
  property reservedTicket:ITicket read Get_reservedTicket write Set_reservedTicket;
  property reservationFor:IThing read Get_reservationFor write Set_reservationFor;
  property bookingAgent:IOrganization read Get_bookingAgent write Set_bookingAgent;
  property reservationStatus:IReservationStatusType read Get_reservationStatus write Set_reservationStatus;
end;
(*** end IReservation ***)


(* ProgramMembership
Used to describe membership in a loyalty programs (e.g. "StarAliance"), 
traveler clubs (e.g. "AAA"), purchase clubs ("Safeway Club"), etc.
*)
IProgramMembership=Interface (IIntangible)
(*The organization (airline, travelers' club, etc.) the membership is made 
with.*)
  function Get_hostingOrganization:IOrganization;
  procedure Set_hostingOrganization(v:IOrganization);
(*The program providing the membership.*)
  function Get_programName:String;
  procedure Set_programName(v:String);
(*A unique identifier for the membership.*)
  function Get_membershipNumber:String;
  procedure Set_membershipNumber(v:String);
// properties
  property hostingOrganization:IOrganization read Get_hostingOrganization write Set_hostingOrganization;
  property programName:String read Get_programName write Set_programName;
  property membershipNumber:String read Get_membershipNumber write Set_membershipNumber;
end;
(*** end IProgramMembership ***)

ISeat=interface; //forward


(* Ticket
Used to describe a ticket to an event, a flight, a bus ride, etc.
*)
ITicket=Interface (IIntangible)
(*Reference to an asset (e.g., Barcode, QR code image or PDF) usable for 
entrance.*)
  function Get_ticketToken:String;
  procedure Set_ticketToken(v:String);
(*The seat associated with the ticket.*)
  function Get_ticketedSeat:ISeat;
  procedure Set_ticketedSeat(v:ISeat);
(*The unique identifier for the ticket.*)
  function Get_ticketNumber:String;
  procedure Set_ticketNumber(v:String);
(*The person or organization the reservation or ticket is for.*)
  function Get_underName:IOrganization;
  procedure Set_underName(v:IOrganization);
(*The date the ticket was issued.*)
  function Get_dateIssued:TDateTime;
  procedure Set_dateIssued(v:TDateTime);
// properties
  property ticketToken:String read Get_ticketToken write Set_ticketToken;
  property ticketedSeat:ISeat read Get_ticketedSeat write Set_ticketedSeat;
  property ticketNumber:String read Get_ticketNumber write Set_ticketNumber;
  property underName:IOrganization read Get_underName write Set_underName;
  property dateIssued:TDateTime read Get_dateIssued write Set_dateIssued;
end;
(*** end ITicket ***)


(* Seat
Used to describe a seat, such as a reserved seat in an event reservation.
*)
ISeat=Interface (IIntangible)
(*The row location of the reserved seat (e.g., B).*)
  function Get_seatRow:String;
  procedure Set_seatRow(v:String);
(*The location of the reserved seat (e.g., 27).*)
  function Get_seatNumber:String;
  procedure Set_seatNumber(v:String);
(*The section location of the reserved seat (e.g. Orchestra).*)
  function Get_seatSection:String;
  procedure Set_seatSection(v:String);
(*The type/class of the seat.*)
  function Get_seatingType:IQualitativeValue;
  procedure Set_seatingType(v:IQualitativeValue);
// properties
  property seatRow:String read Get_seatRow write Set_seatRow;
  property seatNumber:String read Get_seatNumber write Set_seatNumber;
  property seatSection:String read Get_seatSection write Set_seatSection;
  property seatingType:IQualitativeValue read Get_seatingType write Set_seatingType;
end;
(*** end ISeat ***)


(* ReservationStatusType
Enumerated status values for Reservation.
*)
IReservationStatusType=Interface (IEnumeration)
  function TangReservationStatusType:TangibleValue;
end;
(*** end IReservationStatusType ***)


(* BusReservation
*)
IBusReservation=Interface (IReservation)
  function TangBusReservation:TangibleValue;
end;
(*** end IBusReservation ***)


(* Taxi
A taxi.
*)
ITaxi=Interface (IService)
  function TangTaxi:TangibleValue;
end;
(*** end ITaxi ***)


(* OfficeEquipmentStore
An office equipment store.
*)
IOfficeEquipmentStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IOfficeEquipmentStore ***)


(* LiquorStore
A shop that sells alcoholic drinks such as wine, beer, whisky and other spirits.
*)
ILiquorStore=Interface (IStore)
 (*No atribs*)
end;
(*** end ILiquorStore ***)


(* Embassy
An embassy.
*)
IEmbassy=Interface (IGovernmentBuilding)
 (*No atribs*)
end;
(*** end IEmbassy ***)

IDriveWheelConfigurationValue=interface; //forward

ISteeringPositionValue=interface; //forward

IEngineSpecification=interface; //forward


(* Vehicle
A vehicle is a device that is designed or used to transport people or cargo 
over land, water, air, or through space.
*)
IVehicle=Interface (IProduct)
(**)
  function Get_numberOfPreviousOwners:INumber;
  procedure Set_numberOfPreviousOwners(v:INumber);
(*Indicates that the vehicle meets the respective emission standard.*)
  function Get_meetsEmissionStandard:IQualitativeValue;
  procedure Set_meetsEmissionStandard(v:IQualitativeValue);
(*The drive wheel configuration, i.e. which roadwheels will receive torque from 
the vehicle's engine via the drivetrain.*)
  function Get_driveWheelConfiguration:IDriveWheelConfigurationValue;
  procedure Set_driveWheelConfiguration(v:IDriveWheelConfigurationValue);
(**)
  function Get_fuelConsumption:IQuantitativeValue;
  procedure Set_fuelConsumption(v:IQuantitativeValue);
(**)
  function Get_wheelbase:IQuantitativeValue;
  procedure Set_wheelbase(v:IQuantitativeValue);
(*The type or material of the interior of the vehicle (e.g. synthetic fabric, 
leather, wood, etc.). While most interior types are characterized by the 
material used, an interior type can also be based on vehicle usage or target 
audience.*)
  function Get_vehicleInteriorType:String;
  procedure Set_vehicleInteriorType(v:String);
(*The release date of a vehicle model (often used to differentiate versions of 
the same make and model).*)
  function Get_modelDate:TDateTime;
  procedure Set_modelDate(v:TDateTime);
(*A textual description of known damages, both repaired and unrepaired.*)
  function Get_knownVehicleDamages:String;
  procedure Set_knownVehicleDamages(v:String);
(*Indicates the design and body style of the vehicle (e.g. station wagon, 
hatchback, etc.).*)
  function Get_bodyType:String;
  procedure Set_bodyType(v:String);
(*The color or color combination of the interior of the vehicle.*)
  function Get_vehicleInteriorColor:String;
  procedure Set_vehicleInteriorColor(v:String);
(*Indicates whether the vehicle has been used for special purposes, like 
commercial rental, driving school, or as a taxi. The legislation in many 
countries requires this information to be revealed when offering a car for 
sale.*)
  function Get_vehicleSpecialUsage:String;
  procedure Set_vehicleSpecialUsage(v:String);
(*The date of production of the item, e.g. vehicle.*)
  function Get_productionDate:TDateTime;
  procedure Set_productionDate(v:TDateTime);
(**)
  function Get_mileageFromOdometer:IQuantitativeValue;
  procedure Set_mileageFromOdometer(v:IQuantitativeValue);
(*The release date of a vehicle model (often used to differentiate versions of 
the same make and model).*)
  function Get_vehicleModelDate:TDateTime;
  procedure Set_vehicleModelDate(v:TDateTime);
(*The number or type of airbags in the vehicle.*)
  function Get_numberOfAirbags:INumber;
  procedure Set_numberOfAirbags(v:INumber);
(**)
  function Get_seatingCapacity:IQuantitativeValue;
  procedure Set_seatingCapacity(v:IQuantitativeValue);
(*The position of the steering wheel or similar device (mostly for cars).*)
  function Get_steeringPosition:ISteeringPositionValue;
  procedure Set_steeringPosition(v:ISteeringPositionValue);
(*The date of the first registration of the vehicle with the respective public 
authorities.*)
  function Get_dateVehicleFirstRegistered:TDateTime;
  procedure Set_dateVehicleFirstRegistered(v:TDateTime);
(**)
  function Get_numberOfDoors:INumber;
  procedure Set_numberOfDoors(v:INumber);
(**)
  function Get_weightTotal:IQuantitativeValue;
  procedure Set_weightTotal(v:IQuantitativeValue);
(**)
  function Get_numberOfForwardGears:INumber;
  procedure Set_numberOfForwardGears(v:INumber);
(**)
  function Get_tongueWeight:IQuantitativeValue;
  procedure Set_tongueWeight(v:IQuantitativeValue);
(*A short text indicating the configuration of the vehicle, e.g. '5dr hatchback 
ST 2.5 MT 225 hp' or 'limited edition'.*)
  function Get_vehicleConfiguration:String;
  procedure Set_vehicleConfiguration(v:String);
(**)
  function Get_fuelEfficiency:IQuantitativeValue;
  procedure Set_fuelEfficiency(v:IQuantitativeValue);
(**)
  function Get_cargoVolume:IQuantitativeValue;
  procedure Set_cargoVolume(v:IQuantitativeValue);
(*The type of component used for transmitting the power from a rotating power 
source to the wheels or other relevant component(s) ("gearbox" for cars).*)
  function Get_vehicleTransmission:IQualitativeValue;
  procedure Set_vehicleTransmission(v:IQualitativeValue);
(**)
  function Get_vehicleSeatingCapacity:IQuantitativeValue;
  procedure Set_vehicleSeatingCapacity(v:IQuantitativeValue);
(**)
  function Get_accelerationTime:IQuantitativeValue;
  procedure Set_accelerationTime(v:IQuantitativeValue);
(*The date the item e.g. vehicle was purchased by the current owner.*)
  function Get_purchaseDate:TDateTime;
  procedure Set_purchaseDate(v:TDateTime);
(**)
  function Get_payload:IQuantitativeValue;
  procedure Set_payload(v:IQuantitativeValue);
(**)
  function Get_fuelCapacity:IQuantitativeValue;
  procedure Set_fuelCapacity(v:IQuantitativeValue);
(*Information about the engine or engines of the vehicle.*)
  function Get_vehicleEngine:IEngineSpecification;
  procedure Set_vehicleEngine(v:IEngineSpecification);
(*The CO2 emissions in g/km. When used in combination with a QuantitativeValue, 
put "g/km" into the unitText property of that value, since there is no 
UN/CEFACT Common Code for "g/km".*)
  function Get_emissionsCO2:INumber;
  procedure Set_emissionsCO2(v:INumber);
(**)
  function Get_numberOfAxles:INumber;
  procedure Set_numberOfAxles(v:INumber);
(**)
  function Get_speed:IQuantitativeValue;
  procedure Set_speed(v:IQuantitativeValue);
(*The Vehicle Identification Number (VIN) is a unique serial number used by the 
automotive industry to identify individual motor vehicles.*)
  function Get_vehicleIdentificationNumber:String;
  procedure Set_vehicleIdentificationNumber(v:String);
(**)
  function Get_trailerWeight:IQuantitativeValue;
  procedure Set_trailerWeight(v:IQuantitativeValue);
// properties
  property numberOfPreviousOwners:INumber read Get_numberOfPreviousOwners write Set_numberOfPreviousOwners;
  property meetsEmissionStandard:IQualitativeValue read Get_meetsEmissionStandard write Set_meetsEmissionStandard;
  property driveWheelConfiguration:IDriveWheelConfigurationValue read Get_driveWheelConfiguration write Set_driveWheelConfiguration;
  property fuelConsumption:IQuantitativeValue read Get_fuelConsumption write Set_fuelConsumption;
  property wheelbase:IQuantitativeValue read Get_wheelbase write Set_wheelbase;
  property vehicleInteriorType:String read Get_vehicleInteriorType write Set_vehicleInteriorType;
  property modelDate:TDateTime read Get_modelDate write Set_modelDate;
  property knownVehicleDamages:String read Get_knownVehicleDamages write Set_knownVehicleDamages;
  property bodyType:String read Get_bodyType write Set_bodyType;
  property vehicleInteriorColor:String read Get_vehicleInteriorColor write Set_vehicleInteriorColor;
  property vehicleSpecialUsage:String read Get_vehicleSpecialUsage write Set_vehicleSpecialUsage;
  property productionDate:TDateTime read Get_productionDate write Set_productionDate;
  property mileageFromOdometer:IQuantitativeValue read Get_mileageFromOdometer write Set_mileageFromOdometer;
  property vehicleModelDate:TDateTime read Get_vehicleModelDate write Set_vehicleModelDate;
  property numberOfAirbags:INumber read Get_numberOfAirbags write Set_numberOfAirbags;
  property seatingCapacity:IQuantitativeValue read Get_seatingCapacity write Set_seatingCapacity;
  property steeringPosition:ISteeringPositionValue read Get_steeringPosition write Set_steeringPosition;
  property dateVehicleFirstRegistered:TDateTime read Get_dateVehicleFirstRegistered write Set_dateVehicleFirstRegistered;
  property numberOfDoors:INumber read Get_numberOfDoors write Set_numberOfDoors;
  property weightTotal:IQuantitativeValue read Get_weightTotal write Set_weightTotal;
  property numberOfForwardGears:INumber read Get_numberOfForwardGears write Set_numberOfForwardGears;
  property tongueWeight:IQuantitativeValue read Get_tongueWeight write Set_tongueWeight;
  property vehicleConfiguration:String read Get_vehicleConfiguration write Set_vehicleConfiguration;
  property fuelEfficiency:IQuantitativeValue read Get_fuelEfficiency write Set_fuelEfficiency;
  property cargoVolume:IQuantitativeValue read Get_cargoVolume write Set_cargoVolume;
  property vehicleTransmission:IQualitativeValue read Get_vehicleTransmission write Set_vehicleTransmission;
  property vehicleSeatingCapacity:IQuantitativeValue read Get_vehicleSeatingCapacity write Set_vehicleSeatingCapacity;
  property accelerationTime:IQuantitativeValue read Get_accelerationTime write Set_accelerationTime;
  property purchaseDate:TDateTime read Get_purchaseDate write Set_purchaseDate;
  property payload:IQuantitativeValue read Get_payload write Set_payload;
  property fuelCapacity:IQuantitativeValue read Get_fuelCapacity write Set_fuelCapacity;
  property vehicleEngine:IEngineSpecification read Get_vehicleEngine write Set_vehicleEngine;
  property emissionsCO2:INumber read Get_emissionsCO2 write Set_emissionsCO2;
  property numberOfAxles:INumber read Get_numberOfAxles write Set_numberOfAxles;
  property speed:IQuantitativeValue read Get_speed write Set_speed;
  property vehicleIdentificationNumber:String read Get_vehicleIdentificationNumber write Set_vehicleIdentificationNumber;
  property trailerWeight:IQuantitativeValue read Get_trailerWeight write Set_trailerWeight;
end;
(*** end IVehicle ***)


(* DriveWheelConfigurationValue
A value indicating which roadwheels will receive torque.
*)
IDriveWheelConfigurationValue=Interface (IQualitativeValue)
  function TangDriveWheelConfigurationValue:TangibleValue;
end;
(*** end IDriveWheelConfigurationValue ***)


(* SteeringPositionValue
A value indicating a steering position.
*)
ISteeringPositionValue=Interface (IQualitativeValue)
  function TangSteeringPositionValue:TangibleValue;
end;
(*** end ISteeringPositionValue ***)


(* EngineSpecification
Information about the engine of the vehicle. A vehicle can have multiple 
engines represented by multiple engine specification entities.
*)
IEngineSpecification=Interface (IStructuredValue)
(**)
  function Get_enginePower:IQuantitativeValue;
  procedure Set_enginePower(v:IQuantitativeValue);
(**)
  function Get_engineDisplacement:IQuantitativeValue;
  procedure Set_engineDisplacement(v:IQuantitativeValue);
(*The type of fuel suitable for the engine or engines of the vehicle. If the 
vehicle has only one engine, this property can be attached directly to the 
vehicle.*)
  function Get_fuelType:String;
  procedure Set_fuelType(v:String);
(*The type of engine or engines powering the vehicle.*)
  function Get_engineType:String;
  procedure Set_engineType(v:String);
(**)
  function Get_torque:IQuantitativeValue;
  procedure Set_torque(v:IQuantitativeValue);
// properties
  property enginePower:IQuantitativeValue read Get_enginePower write Set_enginePower;
  property engineDisplacement:IQuantitativeValue read Get_engineDisplacement write Set_engineDisplacement;
  property fuelType:String read Get_fuelType write Set_fuelType;
  property engineType:String read Get_engineType write Set_engineType;
  property torque:IQuantitativeValue read Get_torque write Set_torque;
end;
(*** end IEngineSpecification ***)


(* Motorcycle
A motorcycle or motorbike is a single-track, two-wheeled motor vehicle.
*)
IMotorcycle=Interface (IVehicle)
 (*No atribs*)
end;
(*** end IMotorcycle ***)


(* BodyOfWater
A body of water, such as a sea, ocean, or lake.
*)
IBodyOfWater=Interface (ILandform)
 (*No atribs*)
end;
(*** end IBodyOfWater ***)


(* Canal
A canal, like the Panama Canal.
*)
ICanal=Interface (IBodyOfWater)
 (*No atribs*)
end;
(*** end ICanal ***)


(* ViewAction
The act of consuming static visual content.
*)
IViewAction=Interface (IConsumeAction)
 (*No atribs*)
end;
(*** end IViewAction ***)


(* PawnShop
A shop that will buy, or lend money against the security of, personal 
possessions.
*)
IPawnShop=Interface (IStore)
 (*No atribs*)
end;
(*** end IPawnShop ***)


(* HairSalon
A hair salon.
*)
IHairSalon=Interface (IHealthAndBeautyBusiness)
 (*No atribs*)
end;
(*** end IHairSalon ***)

IBreadcrumbList=interface; //forward


(* WebPage
*)
IWebPage=Interface (ICreativeWork)
(*Indicates the main image on the page.*)
  function Get_primaryImageOfPage:IImageObject;
  procedure Set_primaryImageOfPage(v:IImageObject);
(*A set of links that can help a user understand and navigate a website 
hierarchy.*)
  function Get_breadcrumb:IBreadcrumbList;
  procedure Set_breadcrumb(v:IBreadcrumbList);
(*The most significant URLs on the page. Typically, these are the 
non-navigation links that are clicked on the most.*)
  function Get_significantLinks:String;
  procedure Set_significantLinks(v:String);
(*A link related to this web page, for example to other related web pages.*)
  function Get_relatedLink:String;
  procedure Set_relatedLink(v:String);
(*People or organizations that have reviewed the content on this web page for 
accuracy and/or completeness.*)
  function Get_reviewedBy:IPerson;
  procedure Set_reviewedBy(v:IPerson);
(*One of the domain specialities to which this web page's content applies.*)
  function Get_specialty:ISpecialty;
  procedure Set_specialty(v:ISpecialty);
(*Date on which the content on this web page was last reviewed for accuracy 
and/or completeness.*)
  function Get_lastReviewed:TDateTime;
  procedure Set_lastReviewed(v:TDateTime);
// properties
  property primaryImageOfPage:IImageObject read Get_primaryImageOfPage write Set_primaryImageOfPage;
  property breadcrumb:IBreadcrumbList read Get_breadcrumb write Set_breadcrumb;
  property significantLinks:String read Get_significantLinks write Set_significantLinks;
  property relatedLink:String read Get_relatedLink write Set_relatedLink;
  property reviewedBy:IPerson read Get_reviewedBy write Set_reviewedBy;
  property specialty:ISpecialty read Get_specialty write Set_specialty;
  property lastReviewed:TDateTime read Get_lastReviewed write Set_lastReviewed;
end;
(*** end IWebPage ***)


(* BreadcrumbList
*)
IBreadcrumbList=Interface (IItemList)
  function TangBreadcrumbList:TangibleValue;
end;
(*** end IBreadcrumbList ***)


(* ItemPage
A page devoted to a single item, such as a particular product or hotel.
*)
IItemPage=Interface (IWebPage)
 (*No atribs*)
end;
(*** end IItemPage ***)


(* InteractAction
The act of interacting with another person or organization.
*)
IInteractAction=Interface (IAction)
 (*No atribs*)
end;
(*** end IInteractAction ***)


(* CommunicateAction
The act of conveying information to another person via a communication medium 
(instrument) such as speech, email, or telephone conversation.
*)
ICommunicateAction=Interface (IInteractAction)
 (*No atribs*)
end;
(*** end ICommunicateAction ***)


(* ShareAction
The act of distributing content to people for their amusement or edification.
*)
IShareAction=Interface (ICommunicateAction)
 (*No atribs*)
end;
(*** end IShareAction ***)


(* Painting
A painting.
*)
IPainting=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end IPainting ***)


(* FinancialService
Financial services business.
*)
IFinancialService=Interface (ILocalBusiness)
(*Description of fees, commissions, and other terms applied either to a class 
of financial product, or by a financial service organization.*)
  function Get_feesAndCommissionsSpecification:String;
  procedure Set_feesAndCommissionsSpecification(v:String);
// properties
  property feesAndCommissionsSpecification:String read Get_feesAndCommissionsSpecification write Set_feesAndCommissionsSpecification;
end;
(*** end IFinancialService ***)


(* InsuranceAgency
An Insurance agency.
*)
IInsuranceAgency=Interface (IFinancialService)
 (*No atribs*)
end;
(*** end IInsuranceAgency ***)


(* ContactPage
Web page type: Contact page.
*)
IContactPage=Interface (IWebPage)
 (*No atribs*)
end;
(*** end IContactPage ***)


(* UserPlays
*)
IUserPlays=Interface (IUserInteraction)
 (*No atribs*)
end;
(*** end IUserPlays ***)


(* PsychologicalTreatment
A process of care relying upon counseling, dialogue and communication  aimed at 
improving a mental health condition without use of drugs.
*)
IPsychologicalTreatment=Interface (ITherapeuticProcedure)
 (*No atribs*)
end;
(*** end IPsychologicalTreatment ***)


(* Zoo
A zoo.
*)
IZoo=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IZoo ***)


(* MarryAction
The act of marrying a person.
*)
IMarryAction=Interface (IInteractAction)
 (*No atribs*)
end;
(*** end IMarryAction ***)


(* FireStation
A fire station. With firemen.
*)
IFireStation=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IFireStation ***)


(* SubwayStation
A subway station.
*)
ISubwayStation=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end ISubwayStation ***)


(* EventSeries
*)
IEventSeries=Interface (IEvent)
 (*No atribs*)
end;
(*** end IEventSeries ***)


(* Volcano
A volcano, like Fuji san.
*)
IVolcano=Interface (ILandform)
 (*No atribs*)
end;
(*** end IVolcano ***)


(* AutomotiveBusiness
Car repair, sales, or parts.
*)
IAutomotiveBusiness=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IAutomotiveBusiness ***)


(* AutoWash
A car wash business.
*)
IAutoWash=Interface (IAutomotiveBusiness)
 (*No atribs*)
end;
(*** end IAutoWash ***)


(* GardenStore
A garden store.
*)
IGardenStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IGardenStore ***)


(* UserBlocks
*)
IUserBlocks=Interface (IUserInteraction)
 (*No atribs*)
end;
(*** end IUserBlocks ***)


(* GoodRelationsClass
*)
IGoodRelationsClass=Interface (IDeliveryMethod)
  function TangGoodRelationsClass:TangibleValue;
end;
(*** end IGoodRelationsClass ***)


(* Code
Computer programming source code. Example: Full (compile ready) solutions, code 
snippet samples, scripts, templates.
*)
ICode=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end ICode ***)


(* TransferAction
The act of transferring/moving (abstract or concrete) animate or inanimate 
objects from one place to another.
*)
ITransferAction=Interface (IAction)
 (*No atribs*)
end;
(*** end ITransferAction ***)


(* DownloadAction
The act of downloading an object.
*)
IDownloadAction=Interface (ITransferAction)
 (*No atribs*)
end;
(*** end IDownloadAction ***)


(* OceanBodyOfWater
An ocean (for example, the Pacific).
*)
IOceanBodyOfWater=Interface (IBodyOfWater)
 (*No atribs*)
end;
(*** end IOceanBodyOfWater ***)


(* AssessAction
The act of forming one's opinion, reaction or sentiment.
*)
IAssessAction=Interface (IAction)
 (*No atribs*)
end;
(*** end IAssessAction ***)


(* ReactAction
The act of responding instinctively and emotionally to an object, expressing a 
sentiment.
*)
IReactAction=Interface (IAssessAction)
 (*No atribs*)
end;
(*** end IReactAction ***)


(* WantAction
The act of expressing a desire about the object. An agent wants an object.
*)
IWantAction=Interface (IReactAction)
 (*No atribs*)
end;
(*** end IWantAction ***)


(* VitalSign
Vital signs are measures of various physiological functions in order to assess 
the most basic body functions.
*)
IVitalSign=Interface (IMedicalSign)
 (*No atribs*)
end;
(*** end IVitalSign ***)


(* PerformingGroup
A performance group, such as a band, an orchestra, or a circus.
*)
IPerformingGroup=Interface (IOrganization)
 (*No atribs*)
end;
(*** end IPerformingGroup ***)


(* DanceGroup
A dance group&amp;#x2014;for example, the Alvin Ailey Dance Theater or 
Riverdance.
*)
IDanceGroup=Interface (IPerformingGroup)
 (*No atribs*)
end;
(*** end IDanceGroup ***)


(* Florist
A florist.
*)
IFlorist=Interface (IStore)
 (*No atribs*)
end;
(*** end IFlorist ***)


(* WPSideBar
A sidebar section of the page.
*)
IWPSideBar=Interface (IWebPageElement)
 (*No atribs*)
end;
(*** end IWPSideBar ***)


(* TheaterGroup
A theater group or company, for example, the Royal Shakespeare Company or Druid 
Theatre.
*)
ITheaterGroup=Interface (IPerformingGroup)
 (*No atribs*)
end;
(*** end ITheaterGroup ***)


(* ArriveAction
The act of arriving at a place. An agent arrives at a destination from a 
fromLocation, optionally with participants.
*)
IArriveAction=Interface (IMoveAction)
 (*No atribs*)
end;
(*** end IArriveAction ***)


(* RadiationTherapy
A process of care using radiation aimed at improving a health condition.
*)
IRadiationTherapy=Interface (IMedicalTherapy)
 (*No atribs*)
end;
(*** end IRadiationTherapy ***)


(* AutoPartsStore
An auto parts store.
*)
IAutoPartsStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IAutoPartsStore ***)


(* AppendAction
The act of inserting at the end if an ordered collection.
*)
IAppendAction=Interface (IInsertAction)
 (*No atribs*)
end;
(*** end IAppendAction ***)


(* WPHeader
The header section of the page.
*)
IWPHeader=Interface (IWebPageElement)
 (*No atribs*)
end;
(*** end IWPHeader ***)

IDigitalDocumentPermission=interface; //forward


(* DigitalDocument
An electronic file or document.
*)
IDigitalDocument=Interface (ICreativeWork)
(*A permission related to the access to this document (e.g. permission to read 
or write an electronic document). For a public document, specify a grantee with 
an Audience with audienceType equal to "public".*)
  function Get_hasDigitalDocumentPermission:IDigitalDocumentPermission;
  procedure Set_hasDigitalDocumentPermission(v:IDigitalDocumentPermission);
// properties
  property hasDigitalDocumentPermission:IDigitalDocumentPermission read Get_hasDigitalDocumentPermission write Set_hasDigitalDocumentPermission;
end;
(*** end IDigitalDocument ***)

IDigitalDocumentPermissionType=interface; //forward


(* DigitalDocumentPermission
A permission for a particular person or group to access a particular file.
*)
IDigitalDocumentPermission=Interface (IIntangible)
(*The type of permission granted the person, organization, or audience.*)
  function Get_permissionType:IDigitalDocumentPermissionType;
  procedure Set_permissionType(v:IDigitalDocumentPermissionType);
(*The person, organization, contact point, or audience that has been granted 
this permission.*)
  function Get_grantee:IAudience;
  procedure Set_grantee(v:IAudience);
// properties
  property permissionType:IDigitalDocumentPermissionType read Get_permissionType write Set_permissionType;
  property grantee:IAudience read Get_grantee write Set_grantee;
end;
(*** end IDigitalDocumentPermission ***)


(* DigitalDocumentPermissionType
A type of permission which can be granted for accessing a digital document.
*)
IDigitalDocumentPermissionType=Interface (IEnumeration)
  function TangDigitalDocumentPermissionType:TangibleValue;
end;
(*** end IDigitalDocumentPermissionType ***)


(* NoteDigitalDocument
A file containing a note, primarily for the author.
*)
INoteDigitalDocument=Interface (IDigitalDocument)
 (*No atribs*)
end;
(*** end INoteDigitalDocument ***)


(* SocialMediaPosting
A post to a social media platform, including blog posts, tweets, Facebook 
posts, etc.
*)
ISocialMediaPosting=Interface (IArticle)
(*A CreativeWork such as an image, video, or audio clip shared as part of this 
posting.*)
  function Get_sharedContent:ICreativeWork;
  procedure Set_sharedContent(v:ICreativeWork);
// properties
  property sharedContent:ICreativeWork read Get_sharedContent write Set_sharedContent;
end;
(*** end ISocialMediaPosting ***)


(* DiscussionForumPosting
A posting to a discussion forum.
*)
IDiscussionForumPosting=Interface (ISocialMediaPosting)
 (*No atribs*)
end;
(*** end IDiscussionForumPosting ***)


(* CheckOutAction
*)
ICheckOutAction=Interface (ICommunicateAction)
 (*No atribs*)
end;
(*** end ICheckOutAction ***)


(* TextDigitalDocument
A file composed primarily of text.
*)
ITextDigitalDocument=Interface (IDigitalDocument)
 (*No atribs*)
end;
(*** end ITextDigitalDocument ***)


(* BedAndBreakfast
*)
IBedAndBreakfast=Interface (ILodgingBusiness)
 (*No atribs*)
end;
(*** end IBedAndBreakfast ***)


(* Reservoir
A reservoir of water, typically an artificially created lake, like the Lake 
Kariba reservoir.
*)
IReservoir=Interface (IBodyOfWater)
 (*No atribs*)
end;
(*** end IReservoir ***)


(* SaleEvent
Event type: Sales event.
*)
ISaleEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end ISaleEvent ***)


(* RadioStation
A radio station.
*)
IRadioStation=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IRadioStation ***)


(* BookmarkAction
An agent bookmarks/flags/labels/tags/marks an object.
*)
IBookmarkAction=Interface (IOrganizeAction)
 (*No atribs*)
end;
(*** end IBookmarkAction ***)


(* MedicalOrganization
A medical organization (physical or not), such as hospital, institution or 
clinic.
*)
IMedicalOrganization=Interface (IOrganization)
(*A medical specialty of the provider.*)
  function Get_medicalSpecialty:IMedicalSpecialty;
  procedure Set_medicalSpecialty(v:IMedicalSpecialty);
(*Name or unique ID of network. (Networks are often reused across different 
insurance plans).*)
  function Get_healthPlanNetworkId:String;
  procedure Set_healthPlanNetworkId(v:String);
(*Whether the provider is accepting new patients.*)
  function Get_isAcceptingNewPatients:Boolean;
  procedure Set_isAcceptingNewPatients(v:Boolean);
// properties
  property medicalSpecialty:IMedicalSpecialty read Get_medicalSpecialty write Set_medicalSpecialty;
  property healthPlanNetworkId:String read Get_healthPlanNetworkId write Set_healthPlanNetworkId;
  property isAcceptingNewPatients:Boolean read Get_isAcceptingNewPatients write Set_isAcceptingNewPatients;
end;
(*** end IMedicalOrganization ***)


(* Pharmacy
A pharmacy or drugstore.
*)
IPharmacy=Interface (IMedicalOrganization)
 (*No atribs*)
end;
(*** end IPharmacy ***)


(* UserTweets
*)
IUserTweets=Interface (IUserInteraction)
 (*No atribs*)
end;
(*** end IUserTweets ***)


(* TireShop
A tire shop.
*)
ITireShop=Interface (IStore)
 (*No atribs*)
end;
(*** end ITireShop ***)


(* Series
A Series in schema.org is a group of related items, typically but not 
necessarily of the same kind.
*)
ISeries=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end ISeries ***)


(* UnRegisterAction
*)
IUnRegisterAction=Interface (IInteractAction)
 (*No atribs*)
end;
(*** end IUnRegisterAction ***)


(* FurnitureStore
A furniture store.
*)
IFurnitureStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IFurnitureStore ***)


(* MobilePhoneStore
A store that sells mobile phones and related accessories.
*)
IMobilePhoneStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IMobilePhoneStore ***)


(* CollectionPage
Web page type: Collection page.
*)
ICollectionPage=Interface (IWebPage)
 (*No atribs*)
end;
(*** end ICollectionPage ***)


(* ImageGallery
Web page type: Image gallery page.
*)
IImageGallery=Interface (ICollectionPage)
 (*No atribs*)
end;
(*** end IImageGallery ***)


(* FinancialProduct
A product provided to consumers and businesses by financial institutions such 
as banks, insurance companies, brokerage firms, consumer finance companies, and 
investment companies which comprise the financial services industry.
*)
IFinancialProduct=Interface (IService)
(*The annual rate that is charged for borrowing (or made by investing), 
expressed as a single percentage number that represents the actual yearly cost 
of funds over the term of a loan. This includes any fees or additional costs 
associated with the transaction.*)
  function Get_annualPercentageRate:IQuantitativeValue;
  procedure Set_annualPercentageRate(v:IQuantitativeValue);
(*The interest rate, charged or paid, applicable to the financial product. 
Note: This is different from the calculated annualPercentageRate.*)
  function Get_interestRate:INumber;
  procedure Set_interestRate(v:INumber);
// properties
  property annualPercentageRate:IQuantitativeValue read Get_annualPercentageRate write Set_annualPercentageRate;
  property interestRate:INumber read Get_interestRate write Set_interestRate;
end;
(*** end IFinancialProduct ***)


(* CurrencyConversionService
A service to convert funds from one currency to another currency.
*)
ICurrencyConversionService=Interface (IFinancialProduct)
  function TangCurrencyConversionService:TangibleValue;
end;
(*** end ICurrencyConversionService ***)


(* InstallAction
The act of installing an application.
*)
IInstallAction=Interface (IConsumeAction)
 (*No atribs*)
end;
(*** end IInstallAction ***)


(* VideoGallery
Web page type: Video gallery page.
*)
IVideoGallery=Interface (ICollectionPage)
 (*No atribs*)
end;
(*** end IVideoGallery ***)


(* Sculpture
A piece of sculpture.
*)
ISculpture=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end ISculpture ***)


(* EventVenue
An event venue.
*)
IEventVenue=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IEventVenue ***)


(* AdultEntertainment
An adult entertainment establishment.
*)
IAdultEntertainment=Interface (IEntertainmentBusiness)
 (*No atribs*)
end;
(*** end IAdultEntertainment ***)


(* TakeAction
*)
ITakeAction=Interface (ITransferAction)
 (*No atribs*)
end;
(*** end ITakeAction ***)


(* SuspendAction
The act of momentarily pausing a device or application (e.g. pause music 
playback or pause a timer).
*)
ISuspendAction=Interface (IControlAction)
 (*No atribs*)
end;
(*** end ISuspendAction ***)


(* MusicStore
A music store.
*)
IMusicStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IMusicStore ***)


(* TradeAction
The act of participating in an exchange of goods and services for monetary 
compensation. An agent trades an object, product or service with a participant 
in exchange for a one time or periodic payment.
*)
ITradeAction=Interface (IAction)
(**)
  function Get_price:INumber;
  procedure Set_price(v:INumber);
(*One or more detailed price specifications, indicating the unit price and 
delivery or payment charges.*)
  function Get_priceSpecification:IPriceSpecification;
  procedure Set_priceSpecification(v:IPriceSpecification);
// properties
  property price:INumber read Get_price write Set_price;
  property priceSpecification:IPriceSpecification read Get_priceSpecification write Set_priceSpecification;
end;
(*** end ITradeAction ***)


(* PreOrderAction
An agent orders a (not yet released) object/product/service to be 
delivered/sent.
*)
IPreOrderAction=Interface (ITradeAction)
 (*No atribs*)
end;
(*** end IPreOrderAction ***)


(* PetStore
A pet store.
*)
IPetStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IPetStore ***)


(* Dentist
A dentist.
*)
IDentist=Interface (IMedicalOrganization)
 (*No atribs*)
end;
(*** end IDentist ***)


(* HomeAndConstructionBusiness
*)
IHomeAndConstructionBusiness=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IHomeAndConstructionBusiness ***)


(* RoofingContractor
A roofing contractor.
*)
IRoofingContractor=Interface (IHomeAndConstructionBusiness)
 (*No atribs*)
end;
(*** end IRoofingContractor ***)


(* MovingCompany
A moving company.
*)
IMovingCompany=Interface (IHomeAndConstructionBusiness)
 (*No atribs*)
end;
(*** end IMovingCompany ***)


(* Table
A table on a Web page.
*)
ITable=Interface (IWebPageElement)
 (*No atribs*)
end;
(*** end ITable ***)


(* HealthClub
A health club.
*)
IHealthClub=Interface (IHealthAndBeautyBusiness)
 (*No atribs*)
end;
(*** end IHealthClub ***)


(* Festival
Event type: Festival.
*)
IFestival=Interface (IEvent)
 (*No atribs*)
end;
(*** end IFestival ***)


(* AchieveAction
The act of accomplishing something via previous efforts. It is an instantaneous 
action rather than an ongoing process.
*)
IAchieveAction=Interface (IAction)
 (*No atribs*)
end;
(*** end IAchieveAction ***)


(* TieAction
The act of reaching a draw in a competitive activity.
*)
ITieAction=Interface (IAchieveAction)
 (*No atribs*)
end;
(*** end ITieAction ***)


(* LakeBodyOfWater
A lake (for example, Lake Pontrachain).
*)
ILakeBodyOfWater=Interface (IBodyOfWater)
 (*No atribs*)
end;
(*** end ILakeBodyOfWater ***)


(* AutoRepair
Car repair business.
*)
IAutoRepair=Interface (IAutomotiveBusiness)
 (*No atribs*)
end;
(*** end IAutoRepair ***)


(* ReadAction
The act of consuming written content.
*)
IReadAction=Interface (IConsumeAction)
 (*No atribs*)
end;
(*** end IReadAction ***)


(* Aquarium
Aquarium.
*)
IAquarium=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IAquarium ***)


(* PaymentCard
A payment method using a credit, debit, store or other card to associate the 
payment with an account.
*)
IPaymentCard=Interface (IFinancialProduct)
  function TangPaymentCard:TangibleValue;
end;
(*** end IPaymentCard ***)


(* CreditCard
*)
ICreditCard=Interface (IPaymentCard)
  function TangCreditCard:TangibleValue;
end;
(*** end ICreditCard ***)


(* LandmarksOrHistoricalBuildings
An historical landmark or building.
*)
ILandmarksOrHistoricalBuildings=Interface (IPlace)
 (*No atribs*)
end;
(*** end ILandmarksOrHistoricalBuildings ***)


(* GovernmentOrganization
A governmental organization or agency.
*)
IGovernmentOrganization=Interface (IOrganization)
 (*No atribs*)
end;
(*** end IGovernmentOrganization ***)


(* Preschool
A preschool.
*)
IPreschool=Interface (IEducationalOrganization)
 (*No atribs*)
end;
(*** end IPreschool ***)


(* Electrician
An electrician.
*)
IElectrician=Interface (IHomeAndConstructionBusiness)
 (*No atribs*)
end;
(*** end IElectrician ***)


(* TaxiStand
A taxi stand.
*)
ITaxiStand=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end ITaxiStand ***)


(* AmusementPark
An amusement park.
*)
IAmusementPark=Interface (IEntertainmentBusiness)
 (*No atribs*)
end;
(*** end IAmusementPark ***)


(* ReportedDoseSchedule
A patient-reported or observed dosing schedule for a drug or supplement.
*)
IReportedDoseSchedule=Interface (IDoseSchedule)
 (*No atribs*)
end;
(*** end IReportedDoseSchedule ***)


(* PhysicalTherapy
A process of progressive physical care and rehabilitation aimed at improving a 
health condition.
*)
IPhysicalTherapy=Interface (IMedicalTherapy)
 (*No atribs*)
end;
(*** end IPhysicalTherapy ***)


(* Courthouse
A courthouse.
*)
ICourthouse=Interface (IGovernmentBuilding)
 (*No atribs*)
end;
(*** end ICourthouse ***)


(* RVPark
A place offering space for "Recreational Vehicles", Caravans, mobile homes and 
the like.
*)
IRVPark=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IRVPark ***)


(* EmploymentAgency
An employment agency.
*)
IEmploymentAgency=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IEmploymentAgency ***)


(* PalliativeProcedure
A medical procedure intended primarily for palliative purposes, aimed at 
relieving the symptoms of an underlying health condition.
*)
IPalliativeProcedure=Interface (IMedicalProcedure)
 (*No atribs*)
end;
(*** end IPalliativeProcedure ***)


(* TouristInformationCenter
A tourist information center.
*)
ITouristInformationCenter=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end ITouristInformationCenter ***)


(* DeactivateAction
The act of stopping or deactivating a device or application (e.g. stopping a 
timer or turning off a flashlight).
*)
IDeactivateAction=Interface (IControlAction)
 (*No atribs*)
end;
(*** end IDeactivateAction ***)


(* RiverBodyOfWater
A river (for example, the broad majestic Shannon).
*)
IRiverBodyOfWater=Interface (IBodyOfWater)
 (*No atribs*)
end;
(*** end IRiverBodyOfWater ***)


(* Locksmith
A locksmith.
*)
ILocksmith=Interface (IHomeAndConstructionBusiness)
 (*No atribs*)
end;
(*** end ILocksmith ***)


(* EndorsementRating
*)
IEndorsementRating=Interface (IRating)
  function TangEndorsementRating:TangibleValue;
end;
(*** end IEndorsementRating ***)


(* FoodService
A food service, like breakfast, lunch, or dinner.
*)
IFoodService=Interface (IService)
  function TangFoodService:TangibleValue;
end;
(*** end IFoodService ***)


(* RadioClip
A short radio program or a segment/part of a radio program.
*)
IRadioClip=Interface (IClip)
 (*No atribs*)
end;
(*** end IRadioClip ***)


(* Plumber
A plumbing service.
*)
IPlumber=Interface (IHomeAndConstructionBusiness)
 (*No atribs*)
end;
(*** end IPlumber ***)


(* PlaceOfWorship
Place of worship, such as a church, synagogue, or mosque.
*)
IPlaceOfWorship=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IPlaceOfWorship ***)


(* Church
A church.
*)
IChurch=Interface (IPlaceOfWorship)
 (*No atribs*)
end;
(*** end IChurch ***)


(* ListenAction
The act of consuming audio content.
*)
IListenAction=Interface (IConsumeAction)
 (*No atribs*)
end;
(*** end IListenAction ***)

ILocationFeatureSpecification=interface; //forward


(* Accommodation
*)
IAccommodation=Interface (IPlace)
(*An amenity feature (e.g. a characteristic or service) of the Accommodation. 
This generic property does not make a statement about whether the feature is 
included in an offer for the main accommodation or available at extra costs.*)
  function Get_amenityFeature:ILocationFeatureSpecification;
  procedure Set_amenityFeature(v:ILocationFeatureSpecification);
(*The size of the accommodation, e.g. in square meter or squarefoot.
Typical 
unit code(s): MTK for square meter, FTK for square foot, or YDK for square 
yard*)
  function Get_floorSize:IQuantitativeValue;
  procedure Set_floorSize(v:IQuantitativeValue);
(*Indications regarding the permitted usage of the accommodation.*)
  function Get_permittedUsage:String;
  procedure Set_permittedUsage(v:String);
// properties
  property amenityFeature:ILocationFeatureSpecification read Get_amenityFeature write Set_amenityFeature;
  property floorSize:IQuantitativeValue read Get_floorSize write Set_floorSize;
  property permittedUsage:String read Get_permittedUsage write Set_permittedUsage;
end;
(*** end IAccommodation ***)


(* LocationFeatureSpecification
Specifies a location feature by providing a structured value representing a 
feature of an accommodation as a property-value pair of varying degrees of 
formality.
*)
ILocationFeatureSpecification=Interface (IPropertyValue)
  function TangLocationFeatureSpecification:TangibleValue;
end;
(*** end ILocationFeatureSpecification ***)


(* Room
*)
IRoom=Interface (IAccommodation)
 (*No atribs*)
end;
(*** end IRoom ***)


(* MeetingRoom
*)
IMeetingRoom=Interface (IRoom)
 (*No atribs*)
end;
(*** end IMeetingRoom ***)


(* PlanAction
The act of planning the execution of an event/task/action/reservation/plan to a 
future date.
*)
IPlanAction=Interface (IOrganizeAction)
(*The time the object is scheduled to.*)
  function Get_scheduledTime:TDateTime;
  procedure Set_scheduledTime(v:TDateTime);
// properties
  property scheduledTime:TDateTime read Get_scheduledTime write Set_scheduledTime;
end;
(*** end IPlanAction ***)


(* ReserveAction
*)
IReserveAction=Interface (IPlanAction)
 (*No atribs*)
end;
(*** end IReserveAction ***)


(* GroceryStore
A grocery store.
*)
IGroceryStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IGroceryStore ***)


(* Campground
*)
ICampground=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end ICampground ***)


(* UserPlusOnes
*)
IUserPlusOnes=Interface (IUserInteraction)
 (*No atribs*)
end;
(*** end IUserPlusOnes ***)


(* AutomatedTeller
ATM/cash machine.
*)
IAutomatedTeller=Interface (IFinancialService)
 (*No atribs*)
end;
(*** end IAutomatedTeller ***)


(* AgreeAction
The act of expressing a consistency of opinion with the object. An agent agrees 
to/about an object (a proposition, topic or theme) with participants.
*)
IAgreeAction=Interface (IReactAction)
 (*No atribs*)
end;
(*** end IAgreeAction ***)


(* ComedyClub
A comedy club.
*)
IComedyClub=Interface (IEntertainmentBusiness)
 (*No atribs*)
end;
(*** end IComedyClub ***)


(* Hostel
*)
IHostel=Interface (ILodgingBusiness)
 (*No atribs*)
end;
(*** end IHostel ***)


(* ShoppingCenter
A shopping center or mall.
*)
IShoppingCenter=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IShoppingCenter ***)


(* CafeOrCoffeeShop
A cafe or coffee shop.
*)
ICafeOrCoffeeShop=Interface (IFoodEstablishment)
 (*No atribs*)
end;
(*** end ICafeOrCoffeeShop ***)


(* ClothingStore
A clothing store.
*)
IClothingStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IClothingStore ***)


(* ChildCare
A Childcare center.
*)
IChildCare=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IChildCare ***)


(* ApprovedIndication
An indication for a medical therapy that has been formally specified or 
approved by a regulatory body that regulates use of the therapy; for example, 
the US FDA approves indications for most drugs in the US.
*)
IApprovedIndication=Interface (IMedicalIndication)
 (*No atribs*)
end;
(*** end IApprovedIndication ***)


(* SearchResultsPage
Web page type: Search results page.
*)
ISearchResultsPage=Interface (IWebPage)
 (*No atribs*)
end;
(*** end ISearchResultsPage ***)


(* GovernmentOffice
A government office&amp;#x2014;for example, an IRS or DMV office.
*)
IGovernmentOffice=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IGovernmentOffice ***)


(* PostOffice
A post office.
*)
IPostOffice=Interface (IGovernmentOffice)
 (*No atribs*)
end;
(*** end IPostOffice ***)


(* AutoBodyShop
Auto body shop.
*)
IAutoBodyShop=Interface (IAutomotiveBusiness)
 (*No atribs*)
end;
(*** end IAutoBodyShop ***)


(* LockerDelivery
A DeliveryMethod in which an item is made available via locker.
*)
ILockerDelivery=Interface (IDeliveryMethod)
  function TangLockerDelivery:TangibleValue;
end;
(*** end ILockerDelivery ***)


(* BookStore
A bookstore.
*)
IBookStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IBookStore ***)


(* CollegeOrUniversity
A college, university, or other third-level educational institution.
*)
ICollegeOrUniversity=Interface (IEducationalOrganization)
 (*No atribs*)
end;
(*** end ICollegeOrUniversity ***)


(* RecyclingCenter
A recycling center.
*)
IRecyclingCenter=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IRecyclingCenter ***)


(* MedicalRiskEstimator
Any rule set or interactive tool for estimating the risk of developing a 
complication or condition.
*)
IMedicalRiskEstimator=Interface (IMedicalEntity)
(*The condition, complication, or symptom whose risk is being estimated.*)
  function Get_estimatesRiskOf:IMedicalEntity;
  procedure Set_estimatesRiskOf(v:IMedicalEntity);
(*A modifiable or non-modifiable risk factor included in the calculation, e.g. 
age, coexisting condition.*)
  function Get_includedRiskFactor:IMedicalRiskFactor;
  procedure Set_includedRiskFactor(v:IMedicalRiskFactor);
// properties
  property estimatesRiskOf:IMedicalEntity read Get_estimatesRiskOf write Set_estimatesRiskOf;
  property includedRiskFactor:IMedicalRiskFactor read Get_includedRiskFactor write Set_includedRiskFactor;
end;
(*** end IMedicalRiskEstimator ***)


(* MedicalRiskCalculator
A complex mathematical calculation requiring an online calculator, used to 
assess prognosis. Note: use the url property of Thing to record any URLs for 
online calculators.
*)
IMedicalRiskCalculator=Interface (IMedicalRiskEstimator)
 (*No atribs*)
end;
(*** end IMedicalRiskCalculator ***)


(* ComputerStore
A computer store.
*)
IComputerStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IComputerStore ***)


(* DisagreeAction
The act of expressing a difference of opinion with the object. An agent 
disagrees to/about an object (a proposition, topic or theme) with participants.
*)
IDisagreeAction=Interface (IReactAction)
 (*No atribs*)
end;
(*** end IDisagreeAction ***)


(* MiddleSchool
A middle school (typically for children aged around 11-14, although this varies 
somewhat).
*)
IMiddleSchool=Interface (IEducationalOrganization)
 (*No atribs*)
end;
(*** end IMiddleSchool ***)


(* School
A school.
*)
ISchool=Interface (IEducationalOrganization)
 (*No atribs*)
end;
(*** end ISchool ***)


(* SelfStorage
A self-storage facility.
*)
ISelfStorage=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end ISelfStorage ***)


(* Playground
A playground.
*)
IPlayground=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IPlayground ***)


(* PaymentService
A Service to transfer funds from a person or organization to a beneficiary 
person or organization.
*)
IPaymentService=Interface (IFinancialProduct)
  function TangPaymentService:TangibleValue;
end;
(*** end IPaymentService ***)


(* ArtGallery
An art gallery.
*)
IArtGallery=Interface (IEntertainmentBusiness)
 (*No atribs*)
end;
(*** end IArtGallery ***)


(* AccountingService
*)
IAccountingService=Interface (IFinancialService)
 (*No atribs*)
end;
(*** end IAccountingService ***)


(* PreventionIndication
An indication for preventing an underlying condition, symptom, etc.
*)
IPreventionIndication=Interface (IMedicalIndication)
 (*No atribs*)
end;
(*** end IPreventionIndication ***)


(* CampingPitch
*)
ICampingPitch=Interface (IAccommodation)
 (*No atribs*)
end;
(*** end ICampingPitch ***)


(* DefenceEstablishment
A defence establishment, such as an army or navy base.
*)
IDefenceEstablishment=Interface (IGovernmentBuilding)
 (*No atribs*)
end;
(*** end IDefenceEstablishment ***)


(* ComicSeries
A sequential publication of comic stories under a
    unifying title, for 
example "The Amazing Spider-Man" or "Groo the
    Wanderer".
*)
IComicSeries=Interface (IPeriodical)
 (*No atribs*)
end;
(*** end IComicSeries ***)


(* ChildrensEvent
Event type: Children's event.
*)
IChildrensEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end IChildrensEvent ***)


(* CatholicChurch
A Catholic church.
*)
ICatholicChurch=Interface (IPlaceOfWorship)
 (*No atribs*)
end;
(*** end ICatholicChurch ***)


(* AboutPage
Web page type: About page.
*)
IAboutPage=Interface (IWebPage)
 (*No atribs*)
end;
(*** end IAboutPage ***)


(* IgnoreAction
The act of intentionally disregarding the object. An agent ignores an object.
*)
IIgnoreAction=Interface (IAssessAction)
 (*No atribs*)
end;
(*** end IIgnoreAction ***)


(* BusinessEvent
Event type: Business event.
*)
IBusinessEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end IBusinessEvent ***)


(* Residence
The place where a person lives.
*)
IResidence=Interface (IPlace)
 (*No atribs*)
end;
(*** end IResidence ***)


(* ApartmentComplex
Residence type: Apartment complex.
*)
IApartmentComplex=Interface (IResidence)
 (*No atribs*)
end;
(*** end IApartmentComplex ***)


(* JewelryStore
A jewelry store.
*)
IJewelryStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IJewelryStore ***)


(* SportingGoodsStore
A sporting goods store.
*)
ISportingGoodsStore=Interface (IStore)
 (*No atribs*)
end;
(*** end ISportingGoodsStore ***)


(* MotorcycleRepair
A motorcycle repair shop.
*)
IMotorcycleRepair=Interface (IAutomotiveBusiness)
 (*No atribs*)
end;
(*** end IMotorcycleRepair ***)


(* Synagogue
A synagogue.
*)
ISynagogue=Interface (IPlaceOfWorship)
 (*No atribs*)
end;
(*** end ISynagogue ***)


(* DiagnosticProcedure
A medical procedure intended primarily for diagnostic, as opposed to 
therapeutic, purposes.
*)
IDiagnosticProcedure=Interface (IMedicalProcedure)
 (*No atribs*)
end;
(*** end IDiagnosticProcedure ***)


(* Motel
*)
IMotel=Interface (ILodgingBusiness)
 (*No atribs*)
end;
(*** end IMotel ***)


(* CancelAction
*)
ICancelAction=Interface (IPlanAction)
 (*No atribs*)
end;
(*** end ICancelAction ***)


(* ElectronicsStore
An electronics store.
*)
IElectronicsStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IElectronicsStore ***)


(* GeneralContractor
A general contractor.
*)
IGeneralContractor=Interface (IHomeAndConstructionBusiness)
 (*No atribs*)
end;
(*** end IGeneralContractor ***)


(* BankOrCreditUnion
Bank or credit union.
*)
IBankOrCreditUnion=Interface (IFinancialService)
 (*No atribs*)
end;
(*** end IBankOrCreditUnion ***)


(* WorkersUnion
A Workers Union (also known as a Labor Union, Labour Union, or Trade Union) is 
an organization that promotes the interests of its worker members by 
collectively bargaining with management, organizing, and political lobbying.
*)
IWorkersUnion=Interface (IOrganization)
 (*No atribs*)
end;
(*** end IWorkersUnion ***)


(* AcceptAction
*)
IAcceptAction=Interface (IAllocateAction)
 (*No atribs*)
end;
(*** end IAcceptAction ***)


(* SportsClub
A sports club.
*)
ISportsClub=Interface (ISportsActivityLocation)
 (*No atribs*)
end;
(*** end ISportsClub ***)


(* AutoRental
A car rental business.
*)
IAutoRental=Interface (IAutomotiveBusiness)
 (*No atribs*)
end;
(*** end IAutoRental ***)


(* PresentationDigitalDocument
A file containing slides or used for a presentation.
*)
IPresentationDigitalDocument=Interface (IDigitalDocument)
 (*No atribs*)
end;
(*** end IPresentationDigitalDocument ***)


(* MotorizedBicycle
A motorized bicycle is a bicycle with an attached motor used to power the 
vehicle, or to assist with pedaling.
*)
IMotorizedBicycle=Interface (IVehicle)
 (*No atribs*)
end;
(*** end IMotorizedBicycle ***)


(* BeautySalon
Beauty salon.
*)
IBeautySalon=Interface (IHealthAndBeautyBusiness)
 (*No atribs*)
end;
(*** end IBeautySalon ***)


(* HinduTemple
A Hindu temple.
*)
IHinduTemple=Interface (IPlaceOfWorship)
 (*No atribs*)
end;
(*** end IHinduTemple ***)


(* PublicSwimmingPool
A public swimming pool.
*)
IPublicSwimmingPool=Interface (ISportsActivityLocation)
 (*No atribs*)
end;
(*** end IPublicSwimmingPool ***)


(* DaySpa
A day spa.
*)
IDaySpa=Interface (IHealthAndBeautyBusiness)
 (*No atribs*)
end;
(*** end IDaySpa ***)


(* CheckInAction
*)
ICheckInAction=Interface (ICommunicateAction)
 (*No atribs*)
end;
(*** end ICheckInAction ***)


(* ExhibitionEvent
Event type: Exhibition event, e.g. at a museum, library, archive, tradeshow, ...
*)
IExhibitionEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end IExhibitionEvent ***)


(* Distillery
A distillery.
*)
IDistillery=Interface (IFoodEstablishment)
 (*No atribs*)
end;
(*** end IDistillery ***)


(* GatedResidenceCommunity
Residence type: Gated community.
*)
IGatedResidenceCommunity=Interface (IResidence)
 (*No atribs*)
end;
(*** end IGatedResidenceCommunity ***)


(* ParkingFacility
A parking lot or other parking facility.
*)
IParkingFacility=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IParkingFacility ***)


(* EventReservation
*)
IEventReservation=Interface (IReservation)
  function TangEventReservation:TangibleValue;
end;
(*** end IEventReservation ***)


(* HardwareStore
A hardware store.
*)
IHardwareStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IHardwareStore ***)


(* MotorcycleDealer
A motorcycle dealer.
*)
IMotorcycleDealer=Interface (IAutomotiveBusiness)
 (*No atribs*)
end;
(*** end IMotorcycleDealer ***)


(* UserCheckins
*)
IUserCheckins=Interface (IUserInteraction)
 (*No atribs*)
end;
(*** end IUserCheckins ***)


(* RegisterAction
*)
IRegisterAction=Interface (IInteractAction)
 (*No atribs*)
end;
(*** end IRegisterAction ***)


(* IceCreamShop
An ice cream shop.
*)
IIceCreamShop=Interface (IFoodEstablishment)
 (*No atribs*)
end;
(*** end IIceCreamShop ***)


(* MovieRentalStore
A movie rental store.
*)
IMovieRentalStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IMovieRentalStore ***)


(* FindAction
*)
IFindAction=Interface (IAction)
 (*No atribs*)
end;
(*** end IFindAction ***)


(* CheckAction
An agent inspects/determines/investigates/inquire or examine an object's 
accuracy/quality/condition or state.
*)
ICheckAction=Interface (IFindAction)
 (*No atribs*)
end;
(*** end ICheckAction ***)


(* WPFooter
The footer section of the page.
*)
IWPFooter=Interface (IWebPageElement)
 (*No atribs*)
end;
(*** end IWPFooter ***)


(* TreatmentIndication
An indication for treating an underlying condition, symptom, etc.
*)
ITreatmentIndication=Interface (IMedicalIndication)
 (*No atribs*)
end;
(*** end ITreatmentIndication ***)


(* MensClothingStore
A men's clothing store.
*)
IMensClothingStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IMensClothingStore ***)


(* City
A city or town.
*)
ICity=Interface (IAdministrativeArea)
 (*No atribs*)
end;
(*** end ICity ***)


(* DryCleaningOrLaundry
A dry-cleaning business.
*)
IDryCleaningOrLaundry=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IDryCleaningOrLaundry ***)

IDistance=interface; //forward


(* VisualArtwork
A work of art that is primarily visual in character.
*)
IVisualArtwork=Interface (ICreativeWork)
(*The primary artist for a work
    in a medium other than pencils or digital 
line art--for example, if the
    primary artwork is done in watercolors or 
digital paints.*)
  function Get_artist:IPerson;
  procedure Set_artist(v:IPerson);
(*The width of the item.*)
  function Get_width:IQuantitativeValue;
  procedure Set_width(v:IQuantitativeValue);
(*A material used as a surface in some artwork, e.g. Canvas, Paper, Wood, 
Board, etc.*)
  function Get_surface:String;
  procedure Set_surface(v:String);
(*The depth of the item.*)
  function Get_depth:IQuantitativeValue;
  procedure Set_depth(v:IQuantitativeValue);
(*The material used. (e.g. Oil, Watercolour, Acrylic, Linoprint, Marble, 
Cyanotype, Digital, Lithograph, DryPoint, Intaglio, Pastel, Woodcut, Pencil, 
Mixed Media, etc.)*)
  function Get_artMedium:String;
  procedure Set_artMedium(v:String);
(*The number of copies when multiple copies of a piece of artwork are produced 
- e.g. for a limited edition of 20 prints, 'artEdition' refers to the total 
number of copies (in this example "20").*)
  function Get_artEdition:Integer;
  procedure Set_artEdition(v:Integer);
(*e.g. Painting, Drawing, Sculpture, Print, Photograph, Assemblage, Collage, 
etc.*)
  function Get_artform:String;
  procedure Set_artform(v:String);
(*The height of the item.*)
  function Get_height:IDistance;
  procedure Set_height(v:IDistance);
// properties
  property artist:IPerson read Get_artist write Set_artist;
  property width:IQuantitativeValue read Get_width write Set_width;
  property surface:String read Get_surface write Set_surface;
  property depth:IQuantitativeValue read Get_depth write Set_depth;
  property artMedium:String read Get_artMedium write Set_artMedium;
  property artEdition:Integer read Get_artEdition write Set_artEdition;
  property artform:String read Get_artform write Set_artform;
  property height:IDistance read Get_height write Set_height;
end;
(*** end IVisualArtwork ***)


(* Distance
Properties that take Distances as values are of the form 
'&amp;lt;Number&amp;gt; &amp;lt;Length unit of measure&amp;gt;'. E.g., '7 ft'.
*)
IDistance=Interface (IQuantity)
  function TangDistance:TangibleValue;
end;
(*** end IDistance ***)


(* CoverArt
The artwork on the outer surface of a CreativeWork.
*)
ICoverArt=Interface (IVisualArtwork)
 (*No atribs*)
end;
(*** end ICoverArt ***)


(* ComicCoverArt
The artwork on the cover of a comic.
*)
IComicCoverArt=Interface (ICoverArt)
 (*No atribs*)
end;
(*** end IComicCoverArt ***)


(* SeaBodyOfWater
A sea (for example, the Caspian sea).
*)
ISeaBodyOfWater=Interface (IBodyOfWater)
 (*No atribs*)
end;
(*** end ISeaBodyOfWater ***)


(* HousePainter
A house painting service.
*)
IHousePainter=Interface (IHomeAndConstructionBusiness)
 (*No atribs*)
end;
(*** end IHousePainter ***)


(* DislikeAction
The act of expressing a negative sentiment about the object. An agent dislikes 
an object (a proposition, topic or theme) with participants.
*)
IDislikeAction=Interface (IReactAction)
 (*No atribs*)
end;
(*** end IDislikeAction ***)


(* AnimalShelter
Animal shelter.
*)
IAnimalShelter=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IAnimalShelter ***)


(* ShoeStore
A shoe store.
*)
IShoeStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IShoeStore ***)


(* VisualArtsEvent
Event type: Visual arts event.
*)
IVisualArtsEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end IVisualArtsEvent ***)


(* Resort
*)
IResort=Interface (ILodgingBusiness)
 (*No atribs*)
end;
(*** end IResort ***)


(* BikeStore
A bike store.
*)
IBikeStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IBikeStore ***)


(* Barcode
An image of a visual machine-readable code such as a barcode or QR code.
*)
IBarcode=Interface (IImageObject)
 (*No atribs*)
end;
(*** end IBarcode ***)


(* Attorney
*)
IAttorney=Interface (ILegalService)
 (*No atribs*)
end;
(*** end IAttorney ***)


(* SpreadsheetDigitalDocument
A spreadsheet file.
*)
ISpreadsheetDigitalDocument=Interface (IDigitalDocument)
 (*No atribs*)
end;
(*** end ISpreadsheetDigitalDocument ***)


(* ProfessionalService
*)
IProfessionalService=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IProfessionalService ***)


(* BuddhistTemple
A Buddhist temple.
*)
IBuddhistTemple=Interface (IPlaceOfWorship)
 (*No atribs*)
end;
(*** end IBuddhistTemple ***)


(* PhotographAction
The act of capturing still images of objects using a camera.
*)
IPhotographAction=Interface (ICreateAction)
 (*No atribs*)
end;
(*** end IPhotographAction ***)


(* Bakery
A bakery.
*)
IBakery=Interface (IFoodEstablishment)
 (*No atribs*)
end;
(*** end IBakery ***)


(* State
A state or province of a country.
*)
IState=Interface (IAdministrativeArea)
 (*No atribs*)
end;
(*** end IState ***)


(* Mountain
A mountain, like Mount Whitney or Mount Everest.
*)
IMountain=Interface (ILandform)
 (*No atribs*)
end;
(*** end IMountain ***)


(* SocialEvent
Event type: Social event.
*)
ISocialEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end ISocialEvent ***)


(* MusicVenue
A music venue.
*)
IMusicVenue=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IMusicVenue ***)


(* Park
A park.
*)
IPark=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IPark ***)


(* BankAccount
A product or service offered by a bank whereby one may deposit, withdraw or 
transfer money and in some cases be paid interest.
*)
IBankAccount=Interface (IFinancialProduct)
  function TangBankAccount:TangibleValue;
end;
(*** end IBankAccount ***)


(* DepositAccount
A type of Bank Account with a main purpose of depositing funds to gain interest 
or other benefits.
*)
IDepositAccount=Interface (IBankAccount)
  function TangDepositAccount:TangibleValue;
end;
(*** end IDepositAccount ***)


(* ScheduleAction
*)
IScheduleAction=Interface (IPlanAction)
 (*No atribs*)
end;
(*** end IScheduleAction ***)


(* NailSalon
A nail salon.
*)
INailSalon=Interface (IHealthAndBeautyBusiness)
 (*No atribs*)
end;
(*** end INailSalon ***)


(* EatAction
The act of swallowing solid objects.
*)
IEatAction=Interface (IConsumeAction)
 (*No atribs*)
end;
(*** end IEatAction ***)


(* InternetCafe
An internet cafe.
*)
IInternetCafe=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IInternetCafe ***)


(* Restaurant
A restaurant.
*)
IRestaurant=Interface (IFoodEstablishment)
 (*No atribs*)
end;
(*** end IRestaurant ***)


(* NightClub
A nightclub or discotheque.
*)
INightClub=Interface (IEntertainmentBusiness)
 (*No atribs*)
end;
(*** end INightClub ***)


(* SubscribeAction
*)
ISubscribeAction=Interface (IInteractAction)
 (*No atribs*)
end;
(*** end ISubscribeAction ***)


(* DrawAction
The act of producing a visual/graphical representation of an object, typically 
with a pen/pencil and paper as instruments.
*)
IDrawAction=Interface (ICreateAction)
 (*No atribs*)
end;
(*** end IDrawAction ***)


(* BookSeries
A series of books. Included books can be indicated with the hasPart property.
*)
IBookSeries=Interface (ICreativeWorkSeries)
 (*No atribs*)
end;
(*** end IBookSeries ***)


(* TrainReservation
*)
ITrainReservation=Interface (IReservation)
  function TangTrainReservation:TangibleValue;
end;
(*** end ITrainReservation ***)


(* EducationEvent
Event type: Education event.
*)
IEducationEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end IEducationEvent ***)


(* PaintAction
The act of producing a painting, typically with paint and canvas as instruments.
*)
IPaintAction=Interface (ICreateAction)
 (*No atribs*)
end;
(*** end IPaintAction ***)


(* Cemetery
A graveyard.
*)
ICemetery=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end ICemetery ***)


(* WholesaleStore
A wholesale store.
*)
IWholesaleStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IWholesaleStore ***)


(* BarOrPub
A bar or pub.
*)
IBarOrPub=Interface (IFoodEstablishment)
 (*No atribs*)
end;
(*** end IBarOrPub ***)


(* Waterfall
A waterfall, like Niagara.
*)
IWaterfall=Interface (IBodyOfWater)
 (*No atribs*)
end;
(*** end IWaterfall ***)


(* Mosque
A mosque.
*)
IMosque=Interface (IPlaceOfWorship)
 (*No atribs*)
end;
(*** end IMosque ***)


(* NGO
Organization: Non-governmental Organization.
*)
INGO=Interface (IOrganization)
 (*No atribs*)
end;
(*** end INGO ***)


(* Pond
A pond.
*)
IPond=Interface (IBodyOfWater)
 (*No atribs*)
end;
(*** end IPond ***)


(* InformAction
The act of notifying someone of information pertinent to them, with no 
expectation of a response.
*)
IInformAction=Interface (ICommunicateAction)
 (*No atribs*)
end;
(*** end IInformAction ***)


(* ConfirmAction
*)
IConfirmAction=Interface (IInformAction)
 (*No atribs*)
end;
(*** end IConfirmAction ***)


(* DeleteAction
The act of editing a recipient by removing one of its objects.
*)
IDeleteAction=Interface (IUpdateAction)
 (*No atribs*)
end;
(*** end IDeleteAction ***)


(* ActivateAction
The act of starting or activating a device or application (e.g. starting a 
timer or turning on a flashlight).
*)
IActivateAction=Interface (IControlAction)
 (*No atribs*)
end;
(*** end IActivateAction ***)


(* Crematorium
A crematorium.
*)
ICrematorium=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end ICrematorium ***)


(* UserPageVisits
*)
IUserPageVisits=Interface (IUserInteraction)
 (*No atribs*)
end;
(*** end IUserPageVisits ***)


(* GolfCourse
A golf course.
*)
IGolfCourse=Interface (ISportsActivityLocation)
 (*No atribs*)
end;
(*** end IGolfCourse ***)


(* MusicVideoObject
A music video file.
*)
IMusicVideoObject=Interface (IMediaObject)
 (*No atribs*)
end;
(*** end IMusicVideoObject ***)


(* AutoDealer
An car dealership.
*)
IAutoDealer=Interface (IAutomotiveBusiness)
 (*No atribs*)
end;
(*** end IAutoDealer ***)


(* UserDownloads
*)
IUserDownloads=Interface (IUserInteraction)
 (*No atribs*)
end;
(*** end IUserDownloads ***)


(* LegislativeBuilding
A legislative building&amp;#x2014;for example, the state capitol.
*)
ILegislativeBuilding=Interface (IGovernmentBuilding)
 (*No atribs*)
end;
(*** end ILegislativeBuilding ***)


(* ProfilePage
Web page type: Profile page.
*)
IProfilePage=Interface (IWebPage)
 (*No atribs*)
end;
(*** end IProfilePage ***)


(* FMRadioChannel
A radio channel that uses FM.
*)
IFMRadioChannel=Interface (IRadioChannel)
  function TangFMRadioChannel:TangibleValue;
end;
(*** end IFMRadioChannel ***)


(* PerformingArtsTheater
A theater or other performing art center.
*)
IPerformingArtsTheater=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IPerformingArtsTheater ***)


(* Bridge
A bridge.
*)
IBridge=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IBridge ***)


(* HomeGoodsStore
A home goods store.
*)
IHomeGoodsStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IHomeGoodsStore ***)


(* Bone
Rigid connective tissue that comprises up the skeletal structure of the human 
body.
*)
IBone=Interface (IAnatomicalStructure)
 (*No atribs*)
end;
(*** end IBone ***)


(* VeterinaryCare
A vet's office.
*)
IVeterinaryCare=Interface (IMedicalOrganization)
 (*No atribs*)
end;
(*** end IVeterinaryCare ***)


(* LiteraryEvent
Event type: Literary event.
*)
ILiteraryEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end ILiteraryEvent ***)


(* TravelAgency
A travel agency.
*)
ITravelAgency=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end ITravelAgency ***)


(* LikeAction
The act of expressing a positive sentiment about the object. An agent likes an 
object (a proposition, topic or theme) with participants.
*)
ILikeAction=Interface (IReactAction)
 (*No atribs*)
end;
(*** end ILikeAction ***)


(* OnDemandEvent
A publication event e.g. catch-up TV or radio podcast, during which a program 
is available on-demand.
*)
IOnDemandEvent=Interface (IPublicationEvent)
 (*No atribs*)
end;
(*** end IOnDemandEvent ***)


(* Conversation
One or more messages between organizations or people on a particular topic. 
Individual messages can be linked to the conversation with isPartOf or hasPart 
properties.
*)
IConversation=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end IConversation ***)


(* CheckoutPage
Web page type: Checkout page.
*)
ICheckoutPage=Interface (IWebPage)
 (*No atribs*)
end;
(*** end ICheckoutPage ***)


(* Museum
A museum.
*)
IMuseum=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IMuseum ***)


(* HVACBusiness
A business that provide Heating, Ventilation and Air Conditioning services.
*)
IHVACBusiness=Interface (IHomeAndConstructionBusiness)
 (*No atribs*)
end;
(*** end IHVACBusiness ***)


(* MedicalSymptom
Any complaint sensed and expressed by the patient (therefore defined as 
subjective)  like stomachache, lower-back pain, or fatigue.
*)
IMedicalSymptom=Interface (IMedicalSignOrSymptom)
 (*No atribs*)
end;
(*** end IMedicalSymptom ***)


(* TennisComplex
A tennis complex.
*)
ITennisComplex=Interface (ISportsActivityLocation)
 (*No atribs*)
end;
(*** end ITennisComplex ***)


(* UseAction
The act of applying an object to its intended purpose.
*)
IUseAction=Interface (IConsumeAction)
 (*No atribs*)
end;
(*** end IUseAction ***)


(* WearAction
The act of dressing oneself in clothing.
*)
IWearAction=Interface (IUseAction)
 (*No atribs*)
end;
(*** end IWearAction ***)


(* QuoteAction
An agent quotes/estimates/appraises an object/product/service with a price at a 
location/store.
*)
IQuoteAction=Interface (ITradeAction)
 (*No atribs*)
end;
(*** end IQuoteAction ***)


(* ConvenienceStore
A convenience store.
*)
IConvenienceStore=Interface (IStore)
 (*No atribs*)
end;
(*** end IConvenienceStore ***)


(* GasStation
A gas station.
*)
IGasStation=Interface (IAutomotiveBusiness)
 (*No atribs*)
end;
(*** end IGasStation ***)


(* RejectAction
*)
IRejectAction=Interface (IAllocateAction)
 (*No atribs*)
end;
(*** end IRejectAction ***)


(* BefriendAction
*)
IBefriendAction=Interface (IInteractAction)
 (*No atribs*)
end;
(*** end IBefriendAction ***)


(* Beach
Beach.
*)
IBeach=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IBeach ***)


(* PoliceStation
A police station.
*)
IPoliceStation=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IPoliceStation ***)


(* ComedyEvent
Event type: Comedy event.
*)
IComedyEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end IComedyEvent ***)


(* SkiResort
A ski resort.
*)
ISkiResort=Interface (ISportsActivityLocation)
 (*No atribs*)
end;
(*** end ISkiResort ***)


(* SiteNavigationElement
A navigation element of the page.
*)
ISiteNavigationElement=Interface (IWebPageElement)
 (*No atribs*)
end;
(*** end ISiteNavigationElement ***)


(* MedicalBusiness
A particular physical or virtual business of an organization for medical 
purposes. Examples of MedicalBusiness include differents business run by health 
professionals.
*)
IMedicalBusiness=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IMedicalBusiness ***)


(* Optician
A store that sells reading glasses and similar devices for improving vision.
*)
IOptician=Interface (IMedicalBusiness)
 (*No atribs*)
end;
(*** end IOptician ***)


(* RadioSeason
Season dedicated to radio broadcast and associated online delivery.
*)
IRadioSeason=Interface (ICreativeWorkSeason)
 (*No atribs*)
end;
(*** end IRadioSeason ***)


(* FastFoodRestaurant
A fast-food restaurant.
*)
IFastFoodRestaurant=Interface (IFoodEstablishment)
 (*No atribs*)
end;
(*** end IFastFoodRestaurant ***)


(* MedicalGuidelineContraindication
A guideline contraindication that designates a process as harmful and where 
quality of the data supporting the contraindication is sound.
*)
IMedicalGuidelineContraindication=Interface (IMedicalGuideline)
 (*No atribs*)
end;
(*** end IMedicalGuidelineContraindication ***)


(* StadiumOrArena
A stadium.
*)
IStadiumOrArena=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IStadiumOrArena ***)


(* QAPage
A QAPage is a WebPage focussed on a specific Question and its Answer(s), e.g. 
in a question answering site or documenting Frequently Asked Questions (FAQs).
*)
IQAPage=Interface (IWebPage)
 (*No atribs*)
end;
(*** end IQAPage ***)


(* TelevisionStation
A television station.
*)
ITelevisionStation=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end ITelevisionStation ***)


(* Message
A single message from a sender to one or more organizations or people.
*)
IMessage=Interface (ICreativeWork)
(*The date/time at which the message was sent.*)
  function Get_dateSent:TDateTime;
  procedure Set_dateSent(v:TDateTime);
(*The date/time at which the message has been read by the recipient if a single 
recipient exists.*)
  function Get_dateRead:TDateTime;
  procedure Set_dateRead(v:TDateTime);
(*A CreativeWork attached to the message.*)
  function Get_messageAttachment:ICreativeWork;
  procedure Set_messageAttachment(v:ICreativeWork);
(*The date/time the message was received if a single recipient exists.*)
  function Get_dateReceived:TDateTime;
  procedure Set_dateReceived(v:TDateTime);
// properties
  property dateSent:TDateTime read Get_dateSent write Set_dateSent;
  property dateRead:TDateTime read Get_dateRead write Set_dateRead;
  property messageAttachment:ICreativeWork read Get_messageAttachment write Set_messageAttachment;
  property dateReceived:TDateTime read Get_dateReceived write Set_dateReceived;
end;
(*** end IMessage ***)


(* EmailMessage
An email message.
*)
IEmailMessage=Interface (IMessage)
 (*No atribs*)
end;
(*** end IEmailMessage ***)


(* DiscoverAction
The act of discovering/finding an object.
*)
IDiscoverAction=Interface (IFindAction)
 (*No atribs*)
end;
(*** end IDiscoverAction ***)


(* BlogPosting
A blog post.
*)
IBlogPosting=Interface (ISocialMediaPosting)
 (*No atribs*)
end;
(*** end IBlogPosting ***)


(* PhysicalActivityCategory
Categories of physical activity, organized by physiologic classification.
*)
IPhysicalActivityCategory=Interface (IEnumeration)
  function TangPhysicalActivityCategory:TangibleValue;
end;
(*** end IPhysicalActivityCategory ***)


(* DonateAction
The act of providing goods, services, or money without compensation, often for 
philanthropic reasons.
*)
IDonateAction=Interface (ITradeAction)
 (*No atribs*)
end;
(*** end IDonateAction ***)


(* ItemListOrderType
Enumerated for values for itemListOrder for indicating how an ordered ItemList 
is organized.
*)
IItemListOrderType=Interface (IEnumeration)
  function TangItemListOrderType:TangibleValue;
end;
(*** end IItemListOrderType ***)

IMovie=interface; //forward


(* ScreeningEvent
A screening of a movie or other video.
*)
IScreeningEvent=Interface (IEvent)
(*The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).*)
  function Get_videoFormat:String;
  procedure Set_videoFormat(v:String);
(*The movie presented during this event.*)
  function Get_workPresented:IMovie;
  procedure Set_workPresented(v:IMovie);
// properties
  property videoFormat:String read Get_videoFormat write Set_videoFormat;
  property workPresented:IMovie read Get_workPresented write Set_workPresented;
end;
(*** end IScreeningEvent ***)

IMusicGroup=interface; //forward


(* Movie
A movie.
*)
IMovie=Interface (ICreativeWork)
(*The composer of the soundtrack.*)
  function Get_musicBy:IMusicGroup;
  procedure Set_musicBy(v:IMusicGroup);
(**)
  function Get_subtitleLanguage:String;
  procedure Set_subtitleLanguage(v:String);
// properties
  property musicBy:IMusicGroup read Get_musicBy write Set_musicBy;
  property subtitleLanguage:String read Get_subtitleLanguage write Set_subtitleLanguage;
end;
(*** end IMovie ***)

IMusicAlbum=interface; //forward


(* MusicGroup
A musical group, such as a band, an orchestra, or a choir. Can also be a solo 
musician.
*)
IMusicGroup=Interface (IPerformingGroup)
(*A member of a music group&amp;#x2014;for example, John, Paul, George, or 
Ringo.*)
  function Get_musicGroupMember:IPerson;
  procedure Set_musicGroupMember(v:IPerson);
(*A collection of music albums.*)
  function Get_albums:IMusicAlbum;
  procedure Set_albums(v:IMusicAlbum);
(*Genre of the creative work or group.*)
  function Get_genre:String;
  procedure Set_genre(v:String);
// properties
  property musicGroupMember:IPerson read Get_musicGroupMember write Set_musicGroupMember;
  property albums:IMusicAlbum read Get_albums write Set_albums;
  property genre:String read Get_genre write Set_genre;
end;
(*** end IMusicGroup ***)

IMusicRecording=interface; //forward


(* MusicPlaylist
A collection of music tracks in playlist form.
*)
IMusicPlaylist=Interface (ICreativeWork)
(*A music recording (track)&amp;#x2014;usually a single song.*)
  function Get_tracks:IMusicRecording;
  procedure Set_tracks(v:IMusicRecording);
(*The number of tracks in this album or playlist.*)
  function Get_numTracks:Integer;
  procedure Set_numTracks(v:Integer);
// properties
  property tracks:IMusicRecording read Get_tracks write Set_tracks;
  property numTracks:Integer read Get_numTracks write Set_numTracks;
end;
(*** end IMusicPlaylist ***)

IMusicComposition=interface; //forward


(* MusicRecording
A music recording (track), usually a single song.
*)
IMusicRecording=Interface (ICreativeWork)
(*The album to which this recording belongs.*)
  function Get_inAlbum:IMusicAlbum;
  procedure Set_inAlbum(v:IMusicAlbum);
(*The playlist to which this recording belongs.*)
  function Get_inPlaylist:IMusicPlaylist;
  procedure Set_inPlaylist(v:IMusicPlaylist);
(*The artist that performed this album or recording.*)
  function Get_byArtist:IMusicGroup;
  procedure Set_byArtist(v:IMusicGroup);
(*The International Standard Recording Code for the recording.*)
  function Get_isrcCode:String;
  procedure Set_isrcCode(v:String);
(*The composition this track is a recording of.*)
  function Get_recordingOf:IMusicComposition;
  procedure Set_recordingOf(v:IMusicComposition);
// properties
  property inAlbum:IMusicAlbum read Get_inAlbum write Set_inAlbum;
  property inPlaylist:IMusicPlaylist read Get_inPlaylist write Set_inPlaylist;
  property byArtist:IMusicGroup read Get_byArtist write Set_byArtist;
  property isrcCode:String read Get_isrcCode write Set_isrcCode;
  property recordingOf:IMusicComposition read Get_recordingOf write Set_recordingOf;
end;
(*** end IMusicRecording ***)

IMusicAlbumReleaseType=interface; //forward

IMusicAlbumProductionType=interface; //forward


(* MusicAlbum
A collection of music tracks.
*)
IMusicAlbum=Interface (IMusicPlaylist)
(*The kind of release which this album is: single, EP or album.*)
  function Get_albumReleaseType:IMusicAlbumReleaseType;
  procedure Set_albumReleaseType(v:IMusicAlbumReleaseType);
(*Classification of the album by it's type of content: soundtrack, live album, 
studio album, etc.*)
  function Get_albumProductionType:IMusicAlbumProductionType;
  procedure Set_albumProductionType(v:IMusicAlbumProductionType);
// properties
  property albumReleaseType:IMusicAlbumReleaseType read Get_albumReleaseType write Set_albumReleaseType;
  property albumProductionType:IMusicAlbumProductionType read Get_albumProductionType write Set_albumProductionType;
end;
(*** end IMusicAlbum ***)


(* MusicAlbumReleaseType
The kind of release which this album is: single, EP or album.
*)
IMusicAlbumReleaseType=Interface (IEnumeration)
  function TangMusicAlbumReleaseType:TangibleValue;
end;
(*** end IMusicAlbumReleaseType ***)


(* MusicAlbumProductionType
Classification of the album by it's type of content: soundtrack, live album, 
studio album, etc.
*)
IMusicAlbumProductionType=Interface (IEnumeration)
  function TangMusicAlbumProductionType:TangibleValue;
end;
(*** end IMusicAlbumProductionType ***)


(* MusicComposition
A musical composition.
*)
IMusicComposition=Interface (ICreativeWork)
(*The key, mode, or scale this composition uses.*)
  function Get_musicalKey:String;
  procedure Set_musicalKey(v:String);
(*The International Standard Musical Work Code for the composition.*)
  function Get_iswcCode:String;
  procedure Set_iswcCode(v:String);
(*Smaller compositions included in this work (e.g. a movement in a symphony).*)
  function Get_includedComposition:IMusicComposition;
  procedure Set_includedComposition(v:IMusicComposition);
(*The type of composition (e.g. overture, sonata, symphony, etc.).*)
  function Get_musicCompositionForm:String;
  procedure Set_musicCompositionForm(v:String);
(*An arrangement derived from the composition.*)
  function Get_musicArrangement:IMusicComposition;
  procedure Set_musicArrangement(v:IMusicComposition);
(*The person who wrote the words.*)
  function Get_lyricist:IPerson;
  procedure Set_lyricist(v:IPerson);
(*The date and place the work was first performed.*)
  function Get_firstPerformance:IEvent;
  procedure Set_firstPerformance(v:IEvent);
(*The words in the song.*)
  function Get_lyrics:ICreativeWork;
  procedure Set_lyrics(v:ICreativeWork);
// properties
  property musicalKey:String read Get_musicalKey write Set_musicalKey;
  property iswcCode:String read Get_iswcCode write Set_iswcCode;
  property includedComposition:IMusicComposition read Get_includedComposition write Set_includedComposition;
  property musicCompositionForm:String read Get_musicCompositionForm write Set_musicCompositionForm;
  property musicArrangement:IMusicComposition read Get_musicArrangement write Set_musicArrangement;
  property lyricist:IPerson read Get_lyricist write Set_lyricist;
  property firstPerformance:IEvent read Get_firstPerformance write Set_firstPerformance;
  property lyrics:ICreativeWork read Get_lyrics write Set_lyrics;
end;
(*** end IMusicComposition ***)


(* Hospital
A hospital.
*)
IHospital=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IHospital ***)

IAirport=interface; //forward

IBoardingPolicyType=interface; //forward


(* Flight
An airline flight.
*)
IFlight=Interface (IIntangible)
(*'carrier' is an out-dated term indicating the 'provider' for parcel delivery 
and flights.*)
  function Get_carrier:IOrganization;
  procedure Set_carrier(v:IOrganization);
(*Description of the meals that will be provided or available for purchase.*)
  function Get_mealService:String;
  procedure Set_mealService(v:String);
(*The unique identifier for a flight including the airline IATA code. For 
example, if describing United flight 110, where the IATA code for United is 
'UA', the flightNumber is 'UA110'.*)
  function Get_flightNumber:String;
  procedure Set_flightNumber(v:String);
(*The kind of aircraft (e.g., "Boeing 747").*)
  function Get_aircraft:String;
  procedure Set_aircraft(v:String);
(*The airport where the flight originates.*)
  function Get_departureAirport:IAirport;
  procedure Set_departureAirport(v:IAirport);
(*Identifier of the flight's departure gate.*)
  function Get_departureGate:String;
  procedure Set_departureGate(v:String);
(*Identifier of the flight's departure terminal.*)
  function Get_departureTerminal:String;
  procedure Set_departureTerminal(v:String);
(*The distance of the flight.*)
  function Get_flightDistance:IDistance;
  procedure Set_flightDistance(v:IDistance);
(*The expected departure time.*)
  function Get_departureTime:TDateTime;
  procedure Set_departureTime(v:TDateTime);
(*The estimated time the flight will take.*)
  function Get_estimatedFlightDuration:IDuration;
  procedure Set_estimatedFlightDuration(v:IDuration);
(*The type of boarding policy used by the airline (e.g. zone-based or 
group-based).*)
  function Get_boardingPolicy:IBoardingPolicyType;
  procedure Set_boardingPolicy(v:IBoardingPolicyType);
(*The airport where the flight terminates.*)
  function Get_arrivalAirport:IAirport;
  procedure Set_arrivalAirport(v:IAirport);
(*The time when a passenger can check into the flight online.*)
  function Get_webCheckinTime:TDateTime;
  procedure Set_webCheckinTime(v:TDateTime);
(*Identifier of the flight's arrival gate.*)
  function Get_arrivalGate:String;
  procedure Set_arrivalGate(v:String);
(*Identifier of the flight's arrival terminal.*)
  function Get_arrivalTerminal:String;
  procedure Set_arrivalTerminal(v:String);
// properties
  property carrier:IOrganization read Get_carrier write Set_carrier;
  property mealService:String read Get_mealService write Set_mealService;
  property flightNumber:String read Get_flightNumber write Set_flightNumber;
  property aircraft:String read Get_aircraft write Set_aircraft;
  property departureAirport:IAirport read Get_departureAirport write Set_departureAirport;
  property departureGate:String read Get_departureGate write Set_departureGate;
  property departureTerminal:String read Get_departureTerminal write Set_departureTerminal;
  property flightDistance:IDistance read Get_flightDistance write Set_flightDistance;
  property departureTime:TDateTime read Get_departureTime write Set_departureTime;
  property estimatedFlightDuration:IDuration read Get_estimatedFlightDuration write Set_estimatedFlightDuration;
  property boardingPolicy:IBoardingPolicyType read Get_boardingPolicy write Set_boardingPolicy;
  property arrivalAirport:IAirport read Get_arrivalAirport write Set_arrivalAirport;
  property webCheckinTime:TDateTime read Get_webCheckinTime write Set_webCheckinTime;
  property arrivalGate:String read Get_arrivalGate write Set_arrivalGate;
  property arrivalTerminal:String read Get_arrivalTerminal write Set_arrivalTerminal;
end;
(*** end IFlight ***)


(* Airport
An airport.
*)
IAirport=Interface (ICivicStructure)
(*ICAO identifier for an airport.*)
  function Get_icaoCode:String;
  procedure Set_icaoCode(v:String);
// properties
  property icaoCode:String read Get_icaoCode write Set_icaoCode;
end;
(*** end IAirport ***)


(* BoardingPolicyType
A type of boarding policy used by an airline.
*)
IBoardingPolicyType=Interface (IEnumeration)
  function TangBoardingPolicyType:TangibleValue;
end;
(*** end IBoardingPolicyType ***)


(* MovieSeries
A series of movies. Included movies can be indicated with the hasPart property.
*)
IMovieSeries=Interface (ICreativeWorkSeries)
 (*No atribs*)
end;
(*** end IMovieSeries ***)

IUnitPriceSpecification=interface; //forward


(* CompoundPriceSpecification
A compound price specification is one that bundles multiple prices that all 
apply in combination for different dimensions of consumption. Use the name 
property of the attached unit price specification for indicating the dimension 
of a price component (e.g. "electricity" or "final cleaning").
*)
ICompoundPriceSpecification=Interface (IPriceSpecification)
(**)
  function Get_priceComponent:IUnitPriceSpecification;
  procedure Set_priceComponent(v:IUnitPriceSpecification);
// properties
  property priceComponent:IUnitPriceSpecification read Get_priceComponent write Set_priceComponent;
end;
(*** end ICompoundPriceSpecification ***)


(* UnitPriceSpecification
The price asked for a given offer by the respective organization or person.
*)
IUnitPriceSpecification=Interface (IPriceSpecification)
(*A short text or acronym indicating multiple price specifications for the same 
offer, e.g. SRP for the suggested retail price or INVOICE for the invoice 
price, mostly used in the car industry.*)
  function Get_priceType:String;
  procedure Set_priceType(v:String);
(*The reference quantity for which a certain price applies, e.g. 1 EUR per 4 
kWh of electricity. This property is a replacement for unitOfMeasurement for 
the advanced cases where the price does not relate to a standard unit.*)
  function Get_referenceQuantity:IQuantitativeValue;
  procedure Set_referenceQuantity(v:IQuantitativeValue);
(*This property specifies the minimal quantity and rounding increment that will 
be the basis for the billing. The unit of measurement is specified by the 
unitCode property.*)
  function Get_billingIncrement:INumber;
  procedure Set_billingIncrement(v:INumber);
// properties
  property priceType:String read Get_priceType write Set_priceType;
  property referenceQuantity:IQuantitativeValue read Get_referenceQuantity write Set_referenceQuantity;
  property billingIncrement:INumber read Get_billingIncrement write Set_billingIncrement;
end;
(*** end IUnitPriceSpecification ***)


(* EmergencyService
An emergency service, such as a fire station or ER.
*)
IEmergencyService=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IEmergencyService ***)


(* IndividualProduct
A single, identifiable product instance (e.g. a laptop with a particular serial 
number).
*)
IIndividualProduct=Interface (IProduct)
 (*No atribs*)
end;
(*** end IIndividualProduct ***)

IComputerLanguage=interface; //forward


(* SoftwareSourceCode
Computer programming source code. Example: Full (compile ready) solutions, code 
snippet samples, scripts, templates.
*)
ISoftwareSourceCode=Interface (ICreativeWork)
(*What type of code sample: full (compile ready) solution, code snippet, inline 
code, scripts, template.*)
  function Get_sampleType:String;
  procedure Set_sampleType(v:String);
(*Runtime platform or script interpreter dependencies (Example - Java v1, 
Python2.3, .Net Framework 3.0).*)
  function Get_runtime:String;
  procedure Set_runtime(v:String);
(*Link to the repository where the un-compiled, human readable code and related 
code is located (SVN, github, CodePlex).*)
  function Get_codeRepository:String;
  procedure Set_codeRepository(v:String);
(*Target Operating System / Product to which the code applies.  If applies to 
several versions, just the product name can be used.*)
  function Get_targetProduct:ISoftwareApplication;
  procedure Set_targetProduct(v:ISoftwareApplication);
(*The computer programming language.*)
  function Get_programmingLanguage:IComputerLanguage;
  procedure Set_programmingLanguage(v:IComputerLanguage);
// properties
  property sampleType:String read Get_sampleType write Set_sampleType;
  property runtime:String read Get_runtime write Set_runtime;
  property codeRepository:String read Get_codeRepository write Set_codeRepository;
  property targetProduct:ISoftwareApplication read Get_targetProduct write Set_targetProduct;
  property programmingLanguage:IComputerLanguage read Get_programmingLanguage write Set_programmingLanguage;
end;
(*** end ISoftwareSourceCode ***)


(* ComputerLanguage
*)
IComputerLanguage=Interface (IIntangible)
  function TangComputerLanguage:TangibleValue;
end;
(*** end IComputerLanguage ***)


(* FlightReservation
*)
IFlightReservation=Interface (IReservation)
(*The priority status assigned to a passenger for security or boarding (e.g. 
FastTrack or Priority).*)
  function Get_passengerPriorityStatus:String;
  procedure Set_passengerPriorityStatus(v:String);
(*The type of security screening the passenger is subject to.*)
  function Get_securityScreening:String;
  procedure Set_securityScreening(v:String);
(*The airline-specific indicator of boarding order / preference.*)
  function Get_boardingGroup:String;
  procedure Set_boardingGroup(v:String);
(*The passenger's sequence number as assigned by the airline.*)
  function Get_passengerSequenceNumber:String;
  procedure Set_passengerSequenceNumber(v:String);
// properties
  property passengerPriorityStatus:String read Get_passengerPriorityStatus write Set_passengerPriorityStatus;
  property securityScreening:String read Get_securityScreening write Set_securityScreening;
  property boardingGroup:String read Get_boardingGroup write Set_boardingGroup;
  property passengerSequenceNumber:String read Get_passengerSequenceNumber write Set_passengerSequenceNumber;
end;
(*** end IFlightReservation ***)


(* Suite
*)
ISuite=Interface (IAccommodation)
(*The number of rooms (excluding bathrooms and closets) of the acccommodation 
or lodging business.
Typical unit code(s): ROM for room or C62 for no unit. The 
type of room can be put in the unitText property of the QuantitativeValue.*)
  function Get_numberOfRooms:IQuantitativeValue;
  procedure Set_numberOfRooms(v:IQuantitativeValue);
// properties
  property numberOfRooms:IQuantitativeValue read Get_numberOfRooms write Set_numberOfRooms;
end;
(*** end ISuite ***)


(* EnumerationValueSet
A set of enumerated values.
*)
IEnumerationValueSet=Interface (ICreativeWork)
(*Value contained in value set.*)
  function Get_hasEnumerationValue:String;
  procedure Set_hasEnumerationValue(v:String);
// properties
  property hasEnumerationValue:String read Get_hasEnumerationValue write Set_hasEnumerationValue;
end;
(*** end IEnumerationValueSet ***)


(* ComicStory
The term "story" is any indivisible, re-printable
    unit of a comic, 
including the interior stories, covers, and backmatter. Most
    comics have at 
least two stories: a cover (ComicCoverArt) and an interior story.
*)
IComicStory=Interface (ICreativeWork)
(*The individual who adds color to inked drawings.*)
  function Get_colorist:IPerson;
  procedure Set_colorist(v:IPerson);
(*The individual who adds lettering, including speech balloons and sound 
effects, to artwork.*)
  function Get_letterer:IPerson;
  procedure Set_letterer(v:IPerson);
// properties
  property colorist:IPerson read Get_colorist write Set_colorist;
  property letterer:IPerson read Get_letterer write Set_letterer;
end;
(*** end IComicStory ***)


(* JobPosting
A listing that describes a job opening in a certain organization.
*)
IJobPosting=Interface (IIntangible)
(*Skills required to fulfill this role.*)
  function Get_skills:String;
  procedure Set_skills(v:String);
(*Any special commitments associated with this job posting. Valid entries 
include VeteranCommit, MilitarySpouseCommit, etc.*)
  function Get_specialCommitments:String;
  procedure Set_specialCommitments(v:String);
(*Description of benefits associated with the job.*)
  function Get_benefits:String;
  procedure Set_benefits(v:String);
(*Organization offering the job position.*)
  function Get_hiringOrganization:IOrganization;
  procedure Set_hiringOrganization(v:IOrganization);
(*Publication date for the job posting.*)
  function Get_datePosted:TDateTime;
  procedure Set_datePosted(v:TDateTime);
(*Type of employment (e.g. full-time, part-time, contract, temporary, seasonal, 
internship).*)
  function Get_employmentType:String;
  procedure Set_employmentType(v:String);
(*The title of the job.*)
  function Get_title:String;
  procedure Set_title(v:String);
(*Educational background needed for the position.*)
  function Get_educationRequirements:String;
  procedure Set_educationRequirements(v:String);
(*Category or categories describing the job. Use BLS O*NET-SOC taxonomy: 
http://www.onetcenter.org/taxonomy.html. Ideally includes textual label and 
formal code, with the property repeated for each applicable value.*)
  function Get_occupationalCategory:String;
  procedure Set_occupationalCategory(v:String);
(*A (typically single) geographic location associated with the job position.*)
  function Get_jobLocation:IPlace;
  procedure Set_jobLocation(v:IPlace);
(*The industry associated with the job position.*)
  function Get_industry:String;
  procedure Set_industry(v:String);
(*Responsibilities associated with this role.*)
  function Get_responsibilities:String;
  procedure Set_responsibilities(v:String);
(**)
  function Get_salaryCurrency:String;
  procedure Set_salaryCurrency(v:String);
(*Description of skills and experience needed for the position.*)
  function Get_experienceRequirements:String;
  procedure Set_experienceRequirements(v:String);
(*The typical working hours for this job (e.g. 1st shift, night shift, 
8am-5pm).*)
  function Get_workHours:String;
  procedure Set_workHours(v:String);
(*Specific qualifications required for this role.*)
  function Get_qualifications:String;
  procedure Set_qualifications(v:String);
(*Description of bonus and commission compensation aspects of the job.*)
  function Get_incentives:String;
  procedure Set_incentives(v:String);
// properties
  property skills:String read Get_skills write Set_skills;
  property specialCommitments:String read Get_specialCommitments write Set_specialCommitments;
  property benefits:String read Get_benefits write Set_benefits;
  property hiringOrganization:IOrganization read Get_hiringOrganization write Set_hiringOrganization;
  property datePosted:TDateTime read Get_datePosted write Set_datePosted;
  property employmentType:String read Get_employmentType write Set_employmentType;
  property title:String read Get_title write Set_title;
  property educationRequirements:String read Get_educationRequirements write Set_educationRequirements;
  property occupationalCategory:String read Get_occupationalCategory write Set_occupationalCategory;
  property jobLocation:IPlace read Get_jobLocation write Set_jobLocation;
  property industry:String read Get_industry write Set_industry;
  property responsibilities:String read Get_responsibilities write Set_responsibilities;
  property salaryCurrency:String read Get_salaryCurrency write Set_salaryCurrency;
  property experienceRequirements:String read Get_experienceRequirements write Set_experienceRequirements;
  property workHours:String read Get_workHours write Set_workHours;
  property qualifications:String read Get_qualifications write Set_qualifications;
  property incentives:String read Get_incentives write Set_incentives;
end;
(*** end IJobPosting ***)


(* PublicationIssue
*)
IPublicationIssue=Interface (ICreativeWork)
(*Any description of pages that is not separated into pageStart and pageEnd; 
for example, "1-6, 9, 55" or "10-12, 46-49".*)
  function Get_pagination:String;
  procedure Set_pagination(v:String);
(*Identifies the issue of publication; for example, "iii" or "2".*)
  function Get_issueNumber:Integer;
  procedure Set_issueNumber(v:Integer);
(*The page on which the work starts; for example "135" or "xiii".*)
  function Get_pageStart:String;
  procedure Set_pageStart(v:String);
// properties
  property pagination:String read Get_pagination write Set_pagination;
  property issueNumber:Integer read Get_issueNumber write Set_issueNumber;
  property pageStart:String read Get_pageStart write Set_pageStart;
end;
(*** end IPublicationIssue ***)


(* TVSeason
Season dedicated to TV broadcast and associated online delivery.
*)
ITVSeason=Interface (ICreativeWork)
(*The country of the principal offices of the production company or individual 
responsible for the movie or program.*)
  function Get_countryOfOrigin:ICountry;
  procedure Set_countryOfOrigin(v:ICountry);
// properties
  property countryOfOrigin:ICountry read Get_countryOfOrigin write Set_countryOfOrigin;
end;
(*** end ITVSeason ***)


(* InvestmentOrDeposit
A type of financial product that typically requires the client to transfer 
funds to a financial service in return for potential beneficial financial 
return.
*)
IInvestmentOrDeposit=Interface (IFinancialProduct)
  function TangInvestmentOrDeposit:TangibleValue;
end;
(*** end IInvestmentOrDeposit ***)


(* Vessel
A component of the human body circulatory system comprised of an intricate 
network of hollow tubes that transport blood throughout the entire body.
*)
IVessel=Interface (IAnatomicalStructure)
 (*No atribs*)
end;
(*** end IVessel ***)


(* Vein
A type of blood vessel that specifically carries blood to the heart.
*)
IVein=Interface (IVessel)
(*The anatomical or organ system drained by this vessel; generally refers to a 
specific part of an organ.*)
  function Get_regionDrained:IAnatomicalStructure;
  procedure Set_regionDrained(v:IAnatomicalStructure);
(*The anatomical or organ system that the vein flows into; a larger structure 
that the vein connects to.*)
  function Get_tributary:IAnatomicalStructure;
  procedure Set_tributary(v:IAnatomicalStructure);
(*The vasculature that the vein drains into.*)
  function Get_drainsTo:IVessel;
  procedure Set_drainsTo(v:IVessel);
// properties
  property regionDrained:IAnatomicalStructure read Get_regionDrained write Set_regionDrained;
  property tributary:IAnatomicalStructure read Get_tributary write Set_tributary;
  property drainsTo:IVessel read Get_drainsTo write Set_drainsTo;
end;
(*** end IVein ***)

ILanguage=interface; //forward


(* WriteAction
The act of authoring written creative content.
*)
IWriteAction=Interface (ICreateAction)
(*A sub property of instrument. The language used on this action.*)
  function Get_language:ILanguage;
  procedure Set_language(v:ILanguage);
// properties
  property language:ILanguage read Get_language write Set_language;
end;
(*** end IWriteAction ***)


(* Language
*)
ILanguage=Interface (IIntangible)
  function TangLanguage:TangibleValue;
end;
(*** end ILanguage ***)


(* SellAction
The act of taking money from a buyer in exchange for goods or services 
rendered. An agent sells an object, product, or service to a buyer for a price. 
Reciprocal of BuyAction.
*)
ISellAction=Interface (ITradeAction)
(*A sub property of participant. The participant/person/organization that 
bought the object.*)
  function Get_buyer:IPerson;
  procedure Set_buyer(v:IPerson);
// properties
  property buyer:IPerson read Get_buyer write Set_buyer;
end;
(*** end ISellAction ***)

IAnswer=interface; //forward


(* Question
A specific question - e.g. from a user seeking answers online, or collected in 
a Frequently Asked Questions (FAQ) document.
*)
IQuestion=Interface (ICreativeWork)
(*The number of answers this question has received.*)
  function Get_answerCount:Integer;
  procedure Set_answerCount(v:Integer);
(*The answer that has been accepted as best, typically on a Question/Answer 
site. Sites vary in their selection mechanisms, e.g. drawing on community 
opinion and/or the view of the Question author.*)
  function Get_acceptedAnswer:IAnswer;
  procedure Set_acceptedAnswer(v:IAnswer);
(*The number of downvotes this question, answer or comment has received from 
the community.*)
  function Get_downvoteCount:Integer;
  procedure Set_downvoteCount(v:Integer);
// properties
  property answerCount:Integer read Get_answerCount write Set_answerCount;
  property acceptedAnswer:IAnswer read Get_acceptedAnswer write Set_acceptedAnswer;
  property downvoteCount:Integer read Get_downvoteCount write Set_downvoteCount;
end;
(*** end IQuestion ***)


(* Comment
*)
IComment=Interface (ICreativeWork)
(*The number of upvotes this question, answer or comment has received from the 
community.*)
  function Get_upvoteCount:Integer;
  procedure Set_upvoteCount(v:Integer);
(*The parent of a question, answer or item in general.*)
  function Get_parentItem:IQuestion;
  procedure Set_parentItem(v:IQuestion);
// properties
  property upvoteCount:Integer read Get_upvoteCount write Set_upvoteCount;
  property parentItem:IQuestion read Get_parentItem write Set_parentItem;
end;
(*** end IComment ***)


(* Answer
An answer offered to a question; perhaps correct, perhaps opinionated or wrong.
*)
IAnswer=Interface (IComment)
 (*No atribs*)
end;
(*** end IAnswer ***)


(* GiveAction
*)
IGiveAction=Interface (ITransferAction)
 (*No atribs*)
end;
(*** end IGiveAction ***)


(* URL
Data type: URL.
*)
IURL=Interface
 (*No atribs*)
end;
(*** end IURL ***)


(* House
*)
IHouse=Interface (IAccommodation)
 (*No atribs*)
end;
(*** end IHouse ***)


(* BedType
A type of bed. This is used for indicating the bed or beds available in an 
accommodation.
*)
IBedType=Interface (IQualitativeValue)
  function TangBedType:TangibleValue;
end;
(*** end IBedType ***)

ITrainStation=interface; //forward


(* TrainTrip
A trip on a commercial train line.
*)
ITrainTrip=Interface (IIntangible)
(*The unique identifier for the train.*)
  function Get_trainNumber:String;
  procedure Set_trainNumber(v:String);
(*The platform from which the train departs.*)
  function Get_departurePlatform:String;
  procedure Set_departurePlatform(v:String);
(*The station where the train trip ends.*)
  function Get_arrivalStation:ITrainStation;
  procedure Set_arrivalStation(v:ITrainStation);
(*The expected arrival time.*)
  function Get_arrivalTime:TDateTime;
  procedure Set_arrivalTime(v:TDateTime);
(*The platform where the train arrives.*)
  function Get_arrivalPlatform:String;
  procedure Set_arrivalPlatform(v:String);
(*The station from which the train departs.*)
  function Get_departureStation:ITrainStation;
  procedure Set_departureStation(v:ITrainStation);
(*The name of the train (e.g. The Orient Express).*)
  function Get_trainName:String;
  procedure Set_trainName(v:String);
// properties
  property trainNumber:String read Get_trainNumber write Set_trainNumber;
  property departurePlatform:String read Get_departurePlatform write Set_departurePlatform;
  property arrivalStation:ITrainStation read Get_arrivalStation write Set_arrivalStation;
  property arrivalTime:TDateTime read Get_arrivalTime write Set_arrivalTime;
  property arrivalPlatform:String read Get_arrivalPlatform write Set_arrivalPlatform;
  property departureStation:ITrainStation read Get_departureStation write Set_departureStation;
  property trainName:String read Get_trainName write Set_trainName;
end;
(*** end ITrainTrip ***)


(* TrainStation
A train station.
*)
ITrainStation=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end ITrainStation ***)


(* SportsOrganization
Represents the collection of all sports organizations, including sports teams, 
governing bodies, and sports associations.
*)
ISportsOrganization=Interface (IOrganization)
(*A type of sport (e.g. Baseball).*)
  function Get_sport:String;
  procedure Set_sport(v:String);
// properties
  property sport:String read Get_sport write Set_sport;
end;
(*** end ISportsOrganization ***)


(* SportsTeam
Organization: Sports team.
*)
ISportsTeam=Interface (ISportsOrganization)
(*A person that acts as performing member of a sports team; a player as opposed 
to a coach.*)
  function Get_athlete:IPerson;
  procedure Set_athlete(v:IPerson);
(*A person that acts in a coaching role for a sports team.*)
  function Get_coach:IPerson;
  procedure Set_coach(v:IPerson);
// properties
  property athlete:IPerson read Get_athlete write Set_athlete;
  property coach:IPerson read Get_coach write Set_coach;
end;
(*** end ISportsTeam ***)


(* Joint
The anatomical location at which two or more bones make contact.
*)
IJoint=Interface (IAnatomicalStructure)
(*The degree of mobility the joint allows.*)
  function Get_functionalClass:String;
  procedure Set_functionalClass(v:String);
(*The name given to how bone physically connects to each other.*)
  function Get_structuralClass:String;
  procedure Set_structuralClass(v:String);
(*The biomechanical properties of the bone.*)
  function Get_biomechnicalClass:String;
  procedure Set_biomechnicalClass(v:String);
// properties
  property functionalClass:String read Get_functionalClass write Set_functionalClass;
  property structuralClass:String read Get_structuralClass write Set_structuralClass;
  property biomechnicalClass:String read Get_biomechnicalClass write Set_biomechnicalClass;
end;
(*** end IJoint ***)


(* SingleFamilyResidence
Residence type: Single-family home.
*)
ISingleFamilyResidence=Interface (IHouse)
 (*No atribs*)
end;
(*** end ISingleFamilyResidence ***)


(* TravelAction
The act of traveling from an fromLocation to a destination by a specified mode 
of transport, optionally with participants.
*)
ITravelAction=Interface (IMoveAction)
 (*No atribs*)
end;
(*** end ITravelAction ***)


(* ReplyAction
*)
IReplyAction=Interface (ICommunicateAction)
 (*No atribs*)
end;
(*** end IReplyAction ***)


(* SomeProducts
A placeholder for multiple similar products of the same kind.
*)
ISomeProducts=Interface (IProduct)
 (*No atribs*)
end;
(*** end ISomeProducts ***)


(* DiagnosticLab
A medical laboratory that offers on-site or off-site diagnostic services.
*)
IDiagnosticLab=Interface (IMedicalOrganization)
(*A diagnostic test or procedure offered by this lab.*)
  function Get_availableTest:IMedicalTest;
  procedure Set_availableTest(v:IMedicalTest);
// properties
  property availableTest:IMedicalTest read Get_availableTest write Set_availableTest;
end;
(*** end IDiagnosticLab ***)

ICourseInstance=interface; //forward

ICourse=interface; //forward


(* Course
A description of an educational course which may be offered as distinct 
instances at which take place at different times or take place at different 
locations, or be offered through different media or modes of study. An 
educational course is a sequence of one or more educational events and/or 
creative works which aims to build knowledge, competence or ability of learners.
*)
ICourse=Interface (ICreativeWork)
(*An offering of the course at a specific time and place or through specific 
media or mode of study or to a specific section of students.*)
  function Get_hasCourseInstance:ICourseInstance;
  procedure Set_hasCourseInstance(v:ICourseInstance);
(**)
  function Get_courseCode:String;
  procedure Set_courseCode(v:String);
(*A description of the qualification, award, certificate, diploma or other 
educational credential awarded as a consequence of successful completion of 
this course.*)
  function Get_educationalCredentialAwarded:String;
  procedure Set_educationalCredentialAwarded(v:String);
(**)
  function Get_coursePrerequisites:ICourse;
  procedure Set_coursePrerequisites(v:ICourse);
// properties
  property hasCourseInstance:ICourseInstance read Get_hasCourseInstance write Set_hasCourseInstance;
  property courseCode:String read Get_courseCode write Set_courseCode;
  property educationalCredentialAwarded:String read Get_educationalCredentialAwarded write Set_educationalCredentialAwarded;
  property coursePrerequisites:ICourse read Get_coursePrerequisites write Set_coursePrerequisites;
end;
(*** end ICourse ***)


(* CourseInstance
*)
ICourseInstance=Interface (IEvent)
(**)
  function Get_instructor:IPerson;
  procedure Set_instructor(v:IPerson);
(*The medium or means of delivery of the course instance or the mode of study, 
either as a text label (e.g. "online", "onsite" or "blended"; "synchronous" or 
"asynchronous"; "full-time" or "part-time") or as a URL reference to a term 
from a controlled vocabulary (e.g. 
https://ceds.ed.gov/element/001311#Asynchronous ).*)
  function Get_courseMode:String;
  procedure Set_courseMode(v:String);
// properties
  property instructor:IPerson read Get_instructor write Set_instructor;
  property courseMode:String read Get_courseMode write Set_courseMode;
end;
(*** end ICourseInstance ***)


(* Photograph
A photograph.
*)
IPhotograph=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end IPhotograph ***)


(* ReplaceAction
The act of editing a recipient by replacing an old object with a new object.
*)
IReplaceAction=Interface (IUpdateAction)
(*A sub property of object. The object that is being replaced.*)
  function Get_replacee:IThing;
  procedure Set_replacee(v:IThing);
(*A sub property of object. The object that replaces.*)
  function Get_replacer:IThing;
  procedure Set_replacer(v:IThing);
// properties
  property replacee:IThing read Get_replacee write Set_replacee;
  property replacer:IThing read Get_replacer write Set_replacer;
end;
(*** end IReplaceAction ***)


(* PublicationVolume
*)
IPublicationVolume=Interface (ICreativeWork)
(*Identifies the volume of publication or multi-part work; for example, "iii" 
or "2".*)
  function Get_volumeNumber:String;
  procedure Set_volumeNumber(v:String);
// properties
  property volumeNumber:String read Get_volumeNumber write Set_volumeNumber;
end;
(*** end IPublicationVolume ***)


(* RestrictedDiet
A diet restricted to certain foods or preparations for cultural, religious, 
health or lifestyle reasons.
*)
IRestrictedDiet=Interface (IEnumeration)
  function TangRestrictedDiet:TangibleValue;
end;
(*** end IRestrictedDiet ***)


(* InviteAction
The act of asking someone to attend an event. Reciprocal of RsvpAction.
*)
IInviteAction=Interface (ICommunicateAction)
 (*No atribs*)
end;
(*** end IInviteAction ***)


(* LoseAction
The act of being defeated in a competitive activity.
*)
ILoseAction=Interface (IAchieveAction)
(*A sub property of participant. The winner of the action.*)
  function Get_winner:IPerson;
  procedure Set_winner(v:IPerson);
// properties
  property winner:IPerson read Get_winner write Set_winner;
end;
(*** end ILoseAction ***)


(* Physician
A doctor's office.
*)
IPhysician=Interface (IMedicalBusiness)
(*A hospital with which the physician or office is affiliated.*)
  function Get_hospitalAffiliation:IHospital;
  procedure Set_hospitalAffiliation(v:IHospital);
(*A medical service available from this provider.*)
  function Get_availableService:IMedicalTest;
  procedure Set_availableService(v:IMedicalTest);
// properties
  property hospitalAffiliation:IHospital read Get_hospitalAffiliation write Set_hospitalAffiliation;
  property availableService:IMedicalTest read Get_availableService write Set_availableService;
end;
(*** end IPhysician ***)


(* ExercisePlan
Fitness-related activity designed for a specific health-related purpose, 
including defined exercise routines as well as activity prescribed by a 
clinician.
*)
IExercisePlan=Interface (ICreativeWork)
(*Quantitative measure of the physiologic output of the exercise; also referred 
to as energy expenditure.*)
  function Get_workload:IQualitativeValue;
  procedure Set_workload(v:IQualitativeValue);
(*Length of time to engage in the activity.*)
  function Get_activityDuration:IQualitativeValue;
  procedure Set_activityDuration(v:IQualitativeValue);
(*How often one should break from the activity.*)
  function Get_restPeriods:String;
  procedure Set_restPeriods(v:String);
(*Number of times one should repeat the activity.*)
  function Get_repetitions:IQualitativeValue;
  procedure Set_repetitions(v:IQualitativeValue);
(*Quantitative measure gauging the degree of force involved in the exercise, 
for example, heartbeats per minute. May include the velocity of the movement.*)
  function Get_intensity:String;
  procedure Set_intensity(v:String);
(*Any additional component of the exercise prescription that may need to be 
articulated to the patient. This may include the order of exercises, the number 
of repetitions of movement, quantitative distance, progressions over time, 
etc.*)
  function Get_additionalVariable:String;
  procedure Set_additionalVariable(v:String);
(*How often one should engage in the activity.*)
  function Get_activityFrequency:IQualitativeValue;
  procedure Set_activityFrequency(v:IQualitativeValue);
// properties
  property workload:IQualitativeValue read Get_workload write Set_workload;
  property activityDuration:IQualitativeValue read Get_activityDuration write Set_activityDuration;
  property restPeriods:String read Get_restPeriods write Set_restPeriods;
  property repetitions:IQualitativeValue read Get_repetitions write Set_repetitions;
  property intensity:String read Get_intensity write Set_intensity;
  property additionalVariable:String read Get_additionalVariable write Set_additionalVariable;
  property activityFrequency:IQualitativeValue read Get_activityFrequency write Set_activityFrequency;
end;
(*** end IExercisePlan ***)


(* MusicReleaseFormatType
Format of this release (the type of recording media used, ie. compact disc, 
digital media, LP, etc.).
*)
IMusicReleaseFormatType=Interface (IEnumeration)
  function TangMusicReleaseFormatType:TangibleValue;
end;
(*** end IMusicReleaseFormatType ***)


(* Airline
An organization that provides flights for passengers.
*)
IAirline=Interface (IOrganization)
(*IATA identifier for an airline or airport.*)
  function Get_iataCode:String;
  procedure Set_iataCode(v:String);
// properties
  property iataCode:String read Get_iataCode write Set_iataCode;
end;
(*** end IAirline ***)

IInvoice=interface; //forward

IOrderStatus=interface; //forward

IOrderItem=interface; //forward

IParcelDelivery=interface; //forward


(* Order
An order is a confirmation of a transaction (a receipt), which can contain 
multiple line items, each represented by an Offer that has been accepted by the 
customer.
*)
IOrder=Interface (IIntangible)
(*The order is being paid as part of the referenced Invoice.*)
  function Get_partOfInvoice:IInvoice;
  procedure Set_partOfInvoice(v:IInvoice);
(*Any discount applied (to an Order).*)
  function Get_discount:INumber;
  procedure Set_discount(v:INumber);
(*The currency (in 3-letter ISO 4217 format) of the discount.*)
  function Get_discountCurrency:String;
  procedure Set_discountCurrency(v:String);
(*The current status of the order.*)
  function Get_orderStatus:IOrderStatus;
  procedure Set_orderStatus(v:IOrderStatus);
(*'merchant' is an out-dated term for 'seller'.*)
  function Get_merchant:IPerson;
  procedure Set_merchant(v:IPerson);
(*The offer(s) -- e.g., product, quantity and price combinations -- included in 
the order.*)
  function Get_acceptedOffer:IOffer;
  procedure Set_acceptedOffer(v:IOffer);
(*Code used to redeem a discount.*)
  function Get_discountCode:String;
  procedure Set_discountCode(v:String);
(*The URL for sending a payment.*)
  function Get_paymentUrl:String;
  procedure Set_paymentUrl(v:String);
(*Date order was placed.*)
  function Get_orderDate:TDateTime;
  procedure Set_orderDate(v:TDateTime);
(*The billing address for the order.*)
  function Get_billingAddress:IPostalAddress;
  procedure Set_billingAddress(v:IPostalAddress);
(*The item ordered.*)
  function Get_orderedItem:IOrderItem;
  procedure Set_orderedItem(v:IOrderItem);
(*The delivery of the parcel related to this order or order item.*)
  function Get_orderDelivery:IParcelDelivery;
  procedure Set_orderDelivery(v:IParcelDelivery);
(*A number that confirms the given order or payment has been received.*)
  function Get_confirmationNumber:String;
  procedure Set_confirmationNumber(v:String);
(*Was the offer accepted as a gift for someone other than the buyer.*)
  function Get_isGift:Boolean;
  procedure Set_isGift(v:Boolean);
(*The identifier of the transaction.*)
  function Get_orderNumber:String;
  procedure Set_orderNumber(v:String);
// properties
  property partOfInvoice:IInvoice read Get_partOfInvoice write Set_partOfInvoice;
  property discount:INumber read Get_discount write Set_discount;
  property discountCurrency:String read Get_discountCurrency write Set_discountCurrency;
  property orderStatus:IOrderStatus read Get_orderStatus write Set_orderStatus;
  property merchant:IPerson read Get_merchant write Set_merchant;
  property acceptedOffer:IOffer read Get_acceptedOffer write Set_acceptedOffer;
  property discountCode:String read Get_discountCode write Set_discountCode;
  property paymentUrl:String read Get_paymentUrl write Set_paymentUrl;
  property orderDate:TDateTime read Get_orderDate write Set_orderDate;
  property billingAddress:IPostalAddress read Get_billingAddress write Set_billingAddress;
  property orderedItem:IOrderItem read Get_orderedItem write Set_orderedItem;
  property orderDelivery:IParcelDelivery read Get_orderDelivery write Set_orderDelivery;
  property confirmationNumber:String read Get_confirmationNumber write Set_confirmationNumber;
  property isGift:Boolean read Get_isGift write Set_isGift;
  property orderNumber:String read Get_orderNumber write Set_orderNumber;
end;
(*** end IOrder ***)

IPaymentStatusType=interface; //forward

IMonetaryAmount=interface; //forward


(* Invoice
A statement of the money due for goods or services; a bill.
*)
IInvoice=Interface (IIntangible)
(*The date that payment is due.*)
  function Get_paymentDue:TDateTime;
  procedure Set_paymentDue(v:TDateTime);
(*The name of the credit card or other method of payment for the order.*)
  function Get_paymentMethod:IPaymentMethod;
  procedure Set_paymentMethod(v:IPaymentMethod);
(*The minimum payment required at this time.*)
  function Get_minimumPaymentDue:IPriceSpecification;
  procedure Set_minimumPaymentDue(v:IPriceSpecification);
(*An identifier for the method of payment used (e.g. the last 4 digits of the 
credit card).*)
  function Get_paymentMethodId:String;
  procedure Set_paymentMethodId(v:String);
(*The date the invoice is scheduled to be paid.*)
  function Get_scheduledPaymentDate:TDateTime;
  procedure Set_scheduledPaymentDate(v:TDateTime);
(*The identifier for the account the payment will be applied to.*)
  function Get_accountId:String;
  procedure Set_accountId(v:String);
(*The Order(s) related to this Invoice. One or more Orders may be combined into 
a single Invoice.*)
  function Get_referencesOrder:IOrder;
  procedure Set_referencesOrder(v:IOrder);
(*The status of payment; whether the invoice has been paid or not.*)
  function Get_paymentStatus:IPaymentStatusType;
  procedure Set_paymentStatus(v:IPaymentStatusType);
(*Party placing the order or paying the invoice.*)
  function Get_customer:IOrganization;
  procedure Set_customer(v:IOrganization);
(*The total amount due.*)
  function Get_totalPaymentDue:IMonetaryAmount;
  procedure Set_totalPaymentDue(v:IMonetaryAmount);
(*The time interval used to compute the invoice.*)
  function Get_billingPeriod:IDuration;
  procedure Set_billingPeriod(v:IDuration);
// properties
  property paymentDue:TDateTime read Get_paymentDue write Set_paymentDue;
  property paymentMethod:IPaymentMethod read Get_paymentMethod write Set_paymentMethod;
  property minimumPaymentDue:IPriceSpecification read Get_minimumPaymentDue write Set_minimumPaymentDue;
  property paymentMethodId:String read Get_paymentMethodId write Set_paymentMethodId;
  property scheduledPaymentDate:TDateTime read Get_scheduledPaymentDate write Set_scheduledPaymentDate;
  property accountId:String read Get_accountId write Set_accountId;
  property referencesOrder:IOrder read Get_referencesOrder write Set_referencesOrder;
  property paymentStatus:IPaymentStatusType read Get_paymentStatus write Set_paymentStatus;
  property customer:IOrganization read Get_customer write Set_customer;
  property totalPaymentDue:IMonetaryAmount read Get_totalPaymentDue write Set_totalPaymentDue;
  property billingPeriod:IDuration read Get_billingPeriod write Set_billingPeriod;
end;
(*** end IInvoice ***)


(* PaymentStatusType
A specific payment status. For example, PaymentDue, PaymentComplete, etc.
*)
IPaymentStatusType=Interface (IEnumeration)
  function TangPaymentStatusType:TangibleValue;
end;
(*** end IPaymentStatusType ***)


(* MonetaryAmount
*)
IMonetaryAmount=Interface (IStructuredValue)
(**)
  function Get_value:IStructuredValue;
  procedure Set_value(v:IStructuredValue);
// properties
  property value:IStructuredValue read Get_value write Set_value;
end;
(*** end IMonetaryAmount ***)


(* OrderStatus
Enumerated status values for Order.
*)
IOrderStatus=Interface (IEnumeration)
  function TangOrderStatus:TangibleValue;
end;
(*** end IOrderStatus ***)


(* OrderItem
An order item is a line of an order. It includes the quantity and shipping 
details of a bought offer.
*)
IOrderItem=Interface (IIntangible)
(*The number of the item ordered. If the property is not set, assume the 
quantity is one.*)
  function Get_orderQuantity:INumber;
  procedure Set_orderQuantity(v:INumber);
(*The current status of the order item.*)
  function Get_orderItemStatus:IOrderStatus;
  procedure Set_orderItemStatus(v:IOrderStatus);
(*The identifier of the order item.*)
  function Get_orderItemNumber:String;
  procedure Set_orderItemNumber(v:String);
// properties
  property orderQuantity:INumber read Get_orderQuantity write Set_orderQuantity;
  property orderItemStatus:IOrderStatus read Get_orderItemStatus write Set_orderItemStatus;
  property orderItemNumber:String read Get_orderItemNumber write Set_orderItemNumber;
end;
(*** end IOrderItem ***)

IDeliveryEvent=interface; //forward


(* ParcelDelivery
The delivery of a parcel either via the postal service or a commercial service.
*)
IParcelDelivery=Interface (IIntangible)
(*Shipper tracking number.*)
  function Get_trackingNumber:String;
  procedure Set_trackingNumber(v:String);
(*The overall order the items in this delivery were included in.*)
  function Get_partOfOrder:IOrder;
  procedure Set_partOfOrder(v:IOrder);
(*The earliest date the package may arrive.*)
  function Get_expectedArrivalFrom:TDateTime;
  procedure Set_expectedArrivalFrom(v:TDateTime);
(*Method used for delivery or shipping.*)
  function Get_hasDeliveryMethod:IDeliveryMethod;
  procedure Set_hasDeliveryMethod(v:IDeliveryMethod);
(*Item(s) being shipped.*)
  function Get_itemShipped:IProduct;
  procedure Set_itemShipped(v:IProduct);
(*Destination address.*)
  function Get_deliveryAddress:IPostalAddress;
  procedure Set_deliveryAddress(v:IPostalAddress);
(*New entry added as the package passes through each leg of its journey (from 
shipment to final delivery).*)
  function Get_deliveryStatus:IDeliveryEvent;
  procedure Set_deliveryStatus(v:IDeliveryEvent);
(*Shipper's address.*)
  function Get_originAddress:IPostalAddress;
  procedure Set_originAddress(v:IPostalAddress);
(*Tracking url for the parcel delivery.*)
  function Get_trackingUrl:String;
  procedure Set_trackingUrl(v:String);
(*The latest date the package may arrive.*)
  function Get_expectedArrivalUntil:TDateTime;
  procedure Set_expectedArrivalUntil(v:TDateTime);
// properties
  property trackingNumber:String read Get_trackingNumber write Set_trackingNumber;
  property partOfOrder:IOrder read Get_partOfOrder write Set_partOfOrder;
  property expectedArrivalFrom:TDateTime read Get_expectedArrivalFrom write Set_expectedArrivalFrom;
  property hasDeliveryMethod:IDeliveryMethod read Get_hasDeliveryMethod write Set_hasDeliveryMethod;
  property itemShipped:IProduct read Get_itemShipped write Set_itemShipped;
  property deliveryAddress:IPostalAddress read Get_deliveryAddress write Set_deliveryAddress;
  property deliveryStatus:IDeliveryEvent read Get_deliveryStatus write Set_deliveryStatus;
  property originAddress:IPostalAddress read Get_originAddress write Set_originAddress;
  property trackingUrl:String read Get_trackingUrl write Set_trackingUrl;
  property expectedArrivalUntil:TDateTime read Get_expectedArrivalUntil write Set_expectedArrivalUntil;
end;
(*** end IParcelDelivery ***)


(* DeliveryEvent
An event involving the delivery of an item.
*)
IDeliveryEvent=Interface (IEvent)
(*Password, PIN, or access code needed for delivery (e.g. from a locker).*)
  function Get_accessCode:String;
  procedure Set_accessCode(v:String);
(*When the item is available for pickup from the store, locker, etc.*)
  function Get_availableFrom:TDateTime;
  procedure Set_availableFrom(v:TDateTime);
(*After this date, the item will no longer be available for pickup.*)
  function Get_availableThrough:TDateTime;
  procedure Set_availableThrough(v:TDateTime);
// properties
  property accessCode:String read Get_accessCode write Set_accessCode;
  property availableFrom:TDateTime read Get_availableFrom write Set_availableFrom;
  property availableThrough:TDateTime read Get_availableThrough write Set_availableThrough;
end;
(*** end IDeliveryEvent ***)


(* PlayAction
*)
IPlayAction=Interface (IAction)
 (*No atribs*)
end;
(*** end IPlayAction ***)


(* EndorseAction
An agent approves/certifies/likes/supports/sanction an object.
*)
IEndorseAction=Interface (IReactAction)
(*A sub property of participant. The person/organization being supported.*)
  function Get_endorsee:IOrganization;
  procedure Set_endorsee(v:IOrganization);
// properties
  property endorsee:IOrganization read Get_endorsee write Set_endorsee;
end;
(*** end IEndorseAction ***)


(* DatedMoneySpecification
*)
IDatedMoneySpecification=Interface (IStructuredValue)
(**)
  function Get_currency:String;
  procedure Set_currency(v:String);
// properties
  property currency:String read Get_currency write Set_currency;
end;
(*** end IDatedMoneySpecification ***)


(* Quotation
*)
IQuotation=Interface (ICreativeWork)
(*The (e.g. fictional) character, Person or Organization to whom the quotation 
is attributed within the containing CreativeWork.*)
  function Get_spokenByCharacter:IOrganization;
  procedure Set_spokenByCharacter(v:IOrganization);
// properties
  property spokenByCharacter:IOrganization read Get_spokenByCharacter write Set_spokenByCharacter;
end;
(*** end IQuotation ***)


(* MedicalWebPage
A web page that provides medical information.
*)
IMedicalWebPage=Interface (IWebPage)
(*An aspect of medical practice that is considered on the page, such as 
'diagnosis', 'treatment', 'causes', 'prognosis', 'etiology', 'epidemiology', 
etc.*)
  function Get_aspect:String;
  procedure Set_aspect(v:String);
// properties
  property aspect:String read Get_aspect write Set_aspect;
end;
(*** end IMedicalWebPage ***)


(* OrderAction
An agent orders an object/product/service to be delivered/sent.
*)
IOrderAction=Interface (ITradeAction)
 (*No atribs*)
end;
(*** end IOrderAction ***)


(* MedicalTestPanel
Any collection of tests commonly ordered together.
*)
IMedicalTestPanel=Interface (IMedicalTest)
(*A component test of the panel.*)
  function Get_subTest:IMedicalTest;
  procedure Set_subTest(v:IMedicalTest);
// properties
  property subTest:IMedicalTest read Get_subTest write Set_subTest;
end;
(*** end IMedicalTestPanel ***)

INerve=interface; //forward

IMuscle=interface; //forward


(* Muscle
A muscle is an anatomical structure consisting of a contractile form of tissue 
that animals use to effect movement.
*)
IMuscle=Interface (IAnatomicalStructure)
(*The underlying innervation associated with the muscle.*)
  function Get_nerve:INerve;
  procedure Set_nerve(v:INerve);
(*The place or point where a muscle arises.*)
  function Get_origin:IAnatomicalStructure;
  procedure Set_origin(v:IAnatomicalStructure);
(**)
  function Get_action:String;
  procedure Set_action(v:String);
(*The blood vessel that carries blood from the heart to the muscle.*)
  function Get_bloodSupply:IVessel;
  procedure Set_bloodSupply(v:IVessel);
(*The place of attachment of a muscle, or what the muscle moves.*)
  function Get_insertion:IAnatomicalStructure;
  procedure Set_insertion(v:IAnatomicalStructure);
(*The muscle whose action counteracts the specified muscle.*)
  function Get_antagonist:IMuscle;
  procedure Set_antagonist(v:IMuscle);
(*The movement the muscle generates.*)
  function Get_muscleAction:String;
  procedure Set_muscleAction(v:String);
// properties
  property nerve:INerve read Get_nerve write Set_nerve;
  property origin:IAnatomicalStructure read Get_origin write Set_origin;
  property action:String read Get_action write Set_action;
  property bloodSupply:IVessel read Get_bloodSupply write Set_bloodSupply;
  property insertion:IAnatomicalStructure read Get_insertion write Set_insertion;
  property antagonist:IMuscle read Get_antagonist write Set_antagonist;
  property muscleAction:String read Get_muscleAction write Set_muscleAction;
end;
(*** end IMuscle ***)

IBrainStructure=interface; //forward


(* Nerve
A common pathway for the electrochemical nerve impulses that are transmitted 
along each of the axons.
*)
INerve=Interface (IAnatomicalStructure)
(*The neurological pathway that originates the neurons.*)
  function Get_sourcedFrom:IBrainStructure;
  procedure Set_sourcedFrom(v:IBrainStructure);
(**)
  function Get_branch:IAnatomicalStructure;
  procedure Set_branch(v:IAnatomicalStructure);
(*The neurological pathway extension that involves muscle control.*)
  function Get_nerveMotor:IMuscle;
  procedure Set_nerveMotor(v:IMuscle);
(*The neurological pathway extension that inputs and sends information to the 
brain or spinal cord.*)
  function Get_sensoryUnit:IAnatomicalStructure;
  procedure Set_sensoryUnit(v:IAnatomicalStructure);
// properties
  property sourcedFrom:IBrainStructure read Get_sourcedFrom write Set_sourcedFrom;
  property branch:IAnatomicalStructure read Get_branch write Set_branch;
  property nerveMotor:IMuscle read Get_nerveMotor write Set_nerveMotor;
  property sensoryUnit:IAnatomicalStructure read Get_sensoryUnit write Set_sensoryUnit;
end;
(*** end INerve ***)


(* BrainStructure
Any anatomical structure which pertains to the soft nervous tissue functioning 
as the coordinating center of sensation and intellectual and nervous activity.
*)
IBrainStructure=Interface (IAnatomicalStructure)
 (*No atribs*)
end;
(*** end IBrainStructure ***)


(* SendAction
*)
ISendAction=Interface (ITransferAction)
(*A sub property of instrument. The method of delivery.*)
  function Get_deliveryMethod:IDeliveryMethod;
  procedure Set_deliveryMethod(v:IDeliveryMethod);
// properties
  property deliveryMethod:IDeliveryMethod read Get_deliveryMethod write Set_deliveryMethod;
end;
(*** end ISendAction ***)


(* PaymentChargeSpecification
The costs of settling the payment using a particular payment method.
*)
IPaymentChargeSpecification=Interface (IPriceSpecification)
(*The delivery method(s) to which the delivery charge or payment charge 
specification applies.*)
  function Get_appliesToDeliveryMethod:IDeliveryMethod;
  procedure Set_appliesToDeliveryMethod(v:IDeliveryMethod);
(*The payment method(s) to which the payment charge specification applies.*)
  function Get_appliesToPaymentMethod:IPaymentMethod;
  procedure Set_appliesToPaymentMethod(v:IPaymentMethod);
// properties
  property appliesToDeliveryMethod:IDeliveryMethod read Get_appliesToDeliveryMethod write Set_appliesToDeliveryMethod;
  property appliesToPaymentMethod:IPaymentMethod read Get_appliesToPaymentMethod write Set_appliesToPaymentMethod;
end;
(*** end IPaymentChargeSpecification ***)


(* InfectiousAgentClass
Classes of agents or pathogens that transmit infectious diseases. Enumerated 
type.
*)
IInfectiousAgentClass=Interface (IMedicalEnumeration)
  function TangInfectiousAgentClass:TangibleValue;
end;
(*** end IInfectiousAgentClass ***)


(* Artery
A type of blood vessel that specifically carries blood away from the heart.
*)
IArtery=Interface (IVessel)
(*The area to which the artery supplies blood.*)
  function Get_supplyTo:IAnatomicalStructure;
  procedure Set_supplyTo(v:IAnatomicalStructure);
(*The anatomical or organ system that the artery originates from.*)
  function Get_source:IAnatomicalStructure;
  procedure Set_source(v:IAnatomicalStructure);
// properties
  property supplyTo:IAnatomicalStructure read Get_supplyTo write Set_supplyTo;
  property source:IAnatomicalStructure read Get_source write Set_source;
end;
(*** end IArtery ***)


(* LiveBlogPosting
A blog post intended to provide a rolling textual coverage of an ongoing event 
through continuous updates.
*)
ILiveBlogPosting=Interface (IBlogPosting)
(*The time when the live blog will stop covering the Event. Note that coverage 
may continue after the Event concludes.*)
  function Get_coverageEndTime:TDateTime;
  procedure Set_coverageEndTime(v:TDateTime);
(*An update to the LiveBlog.*)
  function Get_liveBlogUpdate:IBlogPosting;
  procedure Set_liveBlogUpdate(v:IBlogPosting);
(*The time when the live blog will begin covering the Event. Note that coverage 
may begin before the Event's start time. The LiveBlogPosting may also be 
created before coverage begins.*)
  function Get_coverageStartTime:TDateTime;
  procedure Set_coverageStartTime(v:TDateTime);
// properties
  property coverageEndTime:TDateTime read Get_coverageEndTime write Set_coverageEndTime;
  property liveBlogUpdate:IBlogPosting read Get_liveBlogUpdate write Set_liveBlogUpdate;
  property coverageStartTime:TDateTime read Get_coverageStartTime write Set_coverageStartTime;
end;
(*** end ILiveBlogPosting ***)

IMedicalObservationalStudyDesign=interface; //forward


(* MedicalObservationalStudy
An observational study is a type of medical study that attempts to infer the 
possible effect of a treatment through observation of a cohort of subjects over 
a period of time. In an observational study, the assignment of subjects into 
treatment groups versus control groups is outside the control of the 
investigator. This is in contrast with controlled studies, such as the 
randomized controlled trials represented by MedicalTrial, where each subject is 
randomly assigned to a treatment group or a control group before the start of 
the treatment.
*)
IMedicalObservationalStudy=Interface (IMedicalStudy)
(*Specifics about the observational study design (enumerated).*)
  function Get_studyDesign:IMedicalObservationalStudyDesign;
  procedure Set_studyDesign(v:IMedicalObservationalStudyDesign);
// properties
  property studyDesign:IMedicalObservationalStudyDesign read Get_studyDesign write Set_studyDesign;
end;
(*** end IMedicalObservationalStudy ***)


(* MedicalObservationalStudyDesign
Design models for observational medical studies. Enumerated type.
*)
IMedicalObservationalStudyDesign=Interface (IMedicalEnumeration)
  function TangMedicalObservationalStudyDesign:TangibleValue;
end;
(*** end IMedicalObservationalStudyDesign ***)


(* Boolean
Boolean: True or False.
*)
IBoolean=Interface
 (*No atribs*)
end;
(*** end IBoolean ***)


(* SearchAction
*)
ISearchAction=Interface (IAction)
(*A sub property of instrument. The query used on this action.*)
  function Get_query:String;
  procedure Set_query(v:String);
// properties
  property query:String read Get_query write Set_query;
end;
(*** end ISearchAction ***)


(* Role
*)
IRole=Interface (IIntangible)
(*A position played, performed or filled by a person or organization, as part 
of an organization. For example, an athlete in a SportsTeam might play in the 
position named 'Quarterback'.*)
  function Get_namedPosition:String;
  procedure Set_namedPosition(v:String);
(**)
  function Get_endDate:TDateTime;
  procedure Set_endDate(v:TDateTime);
// properties
  property namedPosition:String read Get_namedPosition write Set_namedPosition;
  property endDate:TDateTime read Get_endDate write Set_endDate;
end;
(*** end IRole ***)


(* OrganizationRole
A subclass of Role used to describe roles within organizations.
*)
IOrganizationRole=Interface (IRole)
(*A number associated with a role in an organization, for example, the number 
on an athlete's jersey.*)
  function Get_numberedPosition:INumber;
  procedure Set_numberedPosition(v:INumber);
// properties
  property numberedPosition:INumber read Get_numberedPosition write Set_numberedPosition;
end;
(*** end IOrganizationRole ***)


(* EmployeeRole
A subclass of OrganizationRole used to describe employee relationships.
*)
IEmployeeRole=Interface (IOrganizationRole)
(*The base salary of the job or of an employee in an EmployeeRole.*)
  function Get_baseSalary:INumber;
  procedure Set_baseSalary(v:INumber);
// properties
  property baseSalary:INumber read Get_baseSalary write Set_baseSalary;
end;
(*** end IEmployeeRole ***)


(* LifestyleModification
A process of care involving exercise, changes to diet, fitness routines, and 
other lifestyle changes aimed at improving a health condition.
*)
ILifestyleModification=Interface (IMedicalEntity)
 (*No atribs*)
end;
(*** end ILifestyleModification ***)

IMapCategoryType=interface; //forward


(* Map
A map.
*)
IMap=Interface (ICreativeWork)
(*Indicates the kind of Map, from the MapCategoryType Enumeration.*)
  function Get_mapType:IMapCategoryType;
  procedure Set_mapType(v:IMapCategoryType);
// properties
  property mapType:IMapCategoryType read Get_mapType write Set_mapType;
end;
(*** end IMap ***)


(* MapCategoryType
An enumeration of several kinds of Map.
*)
IMapCategoryType=Interface (IEnumeration)
  function TangMapCategoryType:TangibleValue;
end;
(*** end IMapCategoryType ***)

IRsvpResponseType=interface; //forward


(* RsvpAction
The act of notifying an event organizer as to whether you expect to attend the 
event.
*)
IRsvpAction=Interface (IInformAction)
(*The response (yes, no, maybe) to the RSVP.*)
  function Get_rsvpResponse:IRsvpResponseType;
  procedure Set_rsvpResponse(v:IRsvpResponseType);
(*Comments, typically from users.*)
  function Get_comment:IComment;
  procedure Set_comment(v:IComment);
(*If responding yes, the number of guests who will attend in addition to the 
invitee.*)
  function Get_additionalNumberOfGuests:INumber;
  procedure Set_additionalNumberOfGuests(v:INumber);
// properties
  property rsvpResponse:IRsvpResponseType read Get_rsvpResponse write Set_rsvpResponse;
  property comment:IComment read Get_comment write Set_comment;
  property additionalNumberOfGuests:INumber read Get_additionalNumberOfGuests write Set_additionalNumberOfGuests;
end;
(*** end IRsvpAction ***)


(* RsvpResponseType
RsvpResponseType is an enumeration type whose instances represent responding to 
an RSVP request.
*)
IRsvpResponseType=Interface (IEnumeration)
  function TangRsvpResponseType:TangibleValue;
end;
(*** end IRsvpResponseType ***)


(* Energy
Properties that take Energy as values are of the form '&amp;lt;Number&amp;gt; 
&amp;lt;Energy unit of measure&amp;gt;'.
*)
IEnergy=Interface (IQuantity)
  function TangEnergy:TangibleValue;
end;
(*** end IEnergy ***)


(* WarrantyScope
*)
IWarrantyScope=Interface (IEnumeration)
  function TangWarrantyScope:TangibleValue;
end;
(*** end IWarrantyScope ***)


(* FoodEvent
Event type: Food event.
*)
IFoodEvent=Interface (IEvent)
 (*No atribs*)
end;
(*** end IFoodEvent ***)


(* LendAction
*)
ILendAction=Interface (ITransferAction)
(*A sub property of participant. The person that borrows the object being 
lent.*)
  function Get_borrower:IPerson;
  procedure Set_borrower(v:IPerson);
// properties
  property borrower:IPerson read Get_borrower write Set_borrower;
end;
(*** end ILendAction ***)


(* Game
The Game type represents things which are games. These are typically 
rule-governed recreational activities, e.g. role-playing games in which players 
assume the role of characters in a fictional setting.
*)
IGame=Interface (ICreativeWork)
(*A piece of data that represents a particular aspect of a fictional character 
(skill, power, character points, advantage, disadvantage).*)
  function Get_characterAttribute:IThing;
  procedure Set_characterAttribute(v:IThing);
// properties
  property characterAttribute:IThing read Get_characterAttribute write Set_characterAttribute;
end;
(*** end IGame ***)


(* Corporation
Organization: A business corporation.
*)
ICorporation=Interface (IOrganization)
(*The exchange traded instrument associated with a Corporation object. The 
tickerSymbol is expressed as an exchange and an instrument name separated by a 
space character. For the exchange component of the tickerSymbol attribute, we 
reccommend using the controlled vocaulary of Market Identifier Codes (MIC) 
specified in ISO15022.*)
  function Get_tickerSymbol:String;
  procedure Set_tickerSymbol(v:String);
// properties
  property tickerSymbol:String read Get_tickerSymbol write Set_tickerSymbol;
end;
(*** end ICorporation ***)

IProperty=interface; //forward

IClass=interface; //forward


(* Property
A property, used to indicate attributes and relationships of some Thing; 
equivalent to rdf:Property.
*)
IProperty=Interface (IIntangible)
(*Relates a term (i.e. a property, class or enumeration) to one that supersedes 
it.*)
  function Get_supersededBy:IEnumeration;
  procedure Set_supersededBy(v:IEnumeration);
(*Relates a property to a property that is its inverse. Inverse properties 
relate the same pairs of items to each other, but in reversed direction. For 
example, the 'alumni' and 'alumniOf' properties are inverseOf each other. Some 
properties don't have explicit inverses; in these situations RDFa and JSON-LD 
syntax for reverse properties can be used.*)
  function Get_inverseOf:IProperty;
  procedure Set_inverseOf(v:IProperty);
(*Relates a property to a class that is (one of) the type(s) the property is 
expected to be used on.*)
  function Get_domainIncludes:IClass;
  procedure Set_domainIncludes(v:IClass);
(*Relates a property to a class that constitutes (one of) the expected type(s) 
for values of the property.*)
  function Get_rangeIncludes:IClass;
  procedure Set_rangeIncludes(v:IClass);
// properties
  property supersededBy:IEnumeration read Get_supersededBy write Set_supersededBy;
  property inverseOf:IProperty read Get_inverseOf write Set_inverseOf;
  property domainIncludes:IClass read Get_domainIncludes write Set_domainIncludes;
  property rangeIncludes:IClass read Get_rangeIncludes write Set_rangeIncludes;
end;
(*** end IProperty ***)


(* Class
A class, also often called a 'Type'; equivalent to rdfs:Class.
*)
IClass=Interface (IIntangible)
  function TangClass:TangibleValue;
end;
(*** end IClass ***)

ISportsEvent=interface; //forward

IDiet=interface; //forward


(* ExerciseAction
The act of participating in exertive activity for the purposes of improving 
health and fitness.
*)
IExerciseAction=Interface (IPlayAction)
(*A sub property of location. The original location of the object or the agent 
before the action.*)
  function Get_fromLocation:IPlace;
  procedure Set_fromLocation(v:IPlace);
(*A sub property of location. The course where this action was taken.*)
  function Get_course:IPlace;
  procedure Set_course(v:IPlace);
(*A sub property of participant. The sports team that participated on this 
action.*)
  function Get_sportsTeam:ISportsTeam;
  procedure Set_sportsTeam(v:ISportsTeam);
(*The distance travelled, e.g. exercising or travelling.*)
  function Get_distance:IDistance;
  procedure Set_distance(v:IDistance);
(*A sub property of location. The sports activity location where this action 
occurred.*)
  function Get_sportsActivityLocation:ISportsActivityLocation;
  procedure Set_sportsActivityLocation(v:ISportsActivityLocation);
(*A sub property of participant. The opponent on this action.*)
  function Get_opponent:IPerson;
  procedure Set_opponent(v:IPerson);
(*A sub property of location. The sports event where this action occurred.*)
  function Get_sportsEvent:ISportsEvent;
  procedure Set_sportsEvent(v:ISportsEvent);
(*A sub property of instrument. The exercise plan used on this action.*)
  function Get_exercisePlan:IExercisePlan;
  procedure Set_exercisePlan(v:IExercisePlan);
(*A sub property of instrument. The diet used in this action.*)
  function Get_diet:IDiet;
  procedure Set_diet(v:IDiet);
(*A sub property of instrument. The diet used in this action.*)
  function Get_exerciseRelatedDiet:IDiet;
  procedure Set_exerciseRelatedDiet(v:IDiet);
(*Type(s) of exercise or activity, such as strength training, flexibility 
training, aerobics, cardiac rehabilitation, etc.*)
  function Get_exerciseType:String;
  procedure Set_exerciseType(v:String);
// properties
  property fromLocation:IPlace read Get_fromLocation write Set_fromLocation;
  property course:IPlace read Get_course write Set_course;
  property sportsTeam:ISportsTeam read Get_sportsTeam write Set_sportsTeam;
  property distance:IDistance read Get_distance write Set_distance;
  property sportsActivityLocation:ISportsActivityLocation read Get_sportsActivityLocation write Set_sportsActivityLocation;
  property opponent:IPerson read Get_opponent write Set_opponent;
  property sportsEvent:ISportsEvent read Get_sportsEvent write Set_sportsEvent;
  property exercisePlan:IExercisePlan read Get_exercisePlan write Set_exercisePlan;
  property diet:IDiet read Get_diet write Set_diet;
  property exerciseRelatedDiet:IDiet read Get_exerciseRelatedDiet write Set_exerciseRelatedDiet;
  property exerciseType:String read Get_exerciseType write Set_exerciseType;
end;
(*** end IExerciseAction ***)


(* SportsEvent
Event type: Sports event.
*)
ISportsEvent=Interface (IEvent)
(*The home team in a sports event.*)
  function Get_homeTeam:ISportsTeam;
  procedure Set_homeTeam(v:ISportsTeam);
(*The away team in a sports event.*)
  function Get_awayTeam:IPerson;
  procedure Set_awayTeam(v:IPerson);
// properties
  property homeTeam:ISportsTeam read Get_homeTeam write Set_homeTeam;
  property awayTeam:IPerson read Get_awayTeam write Set_awayTeam;
end;
(*** end ISportsEvent ***)


(* Diet
A strategy of regulating the intake of food to achieve or maintain a specific 
health-related goal.
*)
IDiet=Interface (ICreativeWork)
(*Nutritional information specific to the dietary plan. May include dietary 
recommendations on what foods to avoid, what foods to consume, and specific 
alterations/deviations from the USDA or other regulatory body's approved 
dietary guidelines.*)
  function Get_dietFeatures:String;
  procedure Set_dietFeatures(v:String);
(*Medical expert advice related to the plan.*)
  function Get_expertConsiderations:String;
  procedure Set_expertConsiderations(v:String);
(*Descriptive information establishing the overarching theory/philosophy of the 
plan. May include the rationale for the name, the population where the plan 
first came to prominence, etc.*)
  function Get_overview:String;
  procedure Set_overview(v:String);
(*People or organizations that endorse the plan.*)
  function Get_endorsers:IOrganization;
  procedure Set_endorsers(v:IOrganization);
(*Specific physiologic risks associated to the diet plan.*)
  function Get_risks:String;
  procedure Set_risks(v:String);
(*Specific physiologic benefits associated to the plan.*)
  function Get_physiologicalBenefits:String;
  procedure Set_physiologicalBenefits(v:String);
// properties
  property dietFeatures:String read Get_dietFeatures write Set_dietFeatures;
  property expertConsiderations:String read Get_expertConsiderations write Set_expertConsiderations;
  property overview:String read Get_overview write Set_overview;
  property endorsers:IOrganization read Get_endorsers write Set_endorsers;
  property risks:String read Get_risks write Set_risks;
  property physiologicalBenefits:String read Get_physiologicalBenefits write Set_physiologicalBenefits;
end;
(*** end IDiet ***)


(* Audiobook
An audiobook.
*)
IAudiobook=Interface (IAudioObject)
(*A person who reads (performs) the audiobook.*)
  function Get_readBy:IPerson;
  procedure Set_readBy(v:IPerson);
// properties
  property readBy:IPerson read Get_readBy write Set_readBy;
end;
(*** end IAudiobook ***)

IBookFormatType=interface; //forward


(* Book
A book.
*)
IBook=Interface (ICreativeWork)
(*Indicates whether the book is an abridged edition.*)
  function Get_abridged:Boolean;
  procedure Set_abridged(v:Boolean);
(*The ISBN of the book.*)
  function Get_isbn:String;
  procedure Set_isbn(v:String);
(*The format of the book.*)
  function Get_bookFormat:IBookFormatType;
  procedure Set_bookFormat(v:IBookFormatType);
(*The edition of the book.*)
  function Get_bookEdition:String;
  procedure Set_bookEdition(v:String);
(*The number of pages in the book.*)
  function Get_numberOfPages:Integer;
  procedure Set_numberOfPages(v:Integer);
(*The illustrator of the book.*)
  function Get_illustrator:IPerson;
  procedure Set_illustrator(v:IPerson);
// properties
  property abridged:Boolean read Get_abridged write Set_abridged;
  property isbn:String read Get_isbn write Set_isbn;
  property bookFormat:IBookFormatType read Get_bookFormat write Set_bookFormat;
  property bookEdition:String read Get_bookEdition write Set_bookEdition;
  property numberOfPages:Integer read Get_numberOfPages write Set_numberOfPages;
  property illustrator:IPerson read Get_illustrator write Set_illustrator;
end;
(*** end IBook ***)


(* BookFormatType
The publication format of the book.
*)
IBookFormatType=Interface (IEnumeration)
  function TangBookFormatType:TangibleValue;
end;
(*** end IBookFormatType ***)


(* BroadcastEvent
An over the air or online broadcast event.
*)
IBroadcastEvent=Interface (IPublicationEvent)
(*The event being broadcast such as a sporting event or awards ceremony.*)
  function Get_broadcastOfEvent:IEvent;
  procedure Set_broadcastOfEvent(v:IEvent);
(*True is the broadcast is of a live event.*)
  function Get_isLiveBroadcast:Boolean;
  procedure Set_isLiveBroadcast(v:Boolean);
// properties
  property broadcastOfEvent:IEvent read Get_broadcastOfEvent write Set_broadcastOfEvent;
  property isLiveBroadcast:Boolean read Get_isLiveBroadcast write Set_isLiveBroadcast;
end;
(*** end IBroadcastEvent ***)


(* WarrantyPromise
A structured value representing the duration and scope of services that will be 
provided to a customer free of charge in case of a defect or malfunction of a 
product.
*)
IWarrantyPromise=Interface (IStructuredValue)
(*The scope of the warranty promise.*)
  function Get_warrantyScope:IWarrantyScope;
  procedure Set_warrantyScope(v:IWarrantyScope);
(*The duration of the warranty promise. Common unitCode values are ANN for 
year, MON for months, or DAY for days.*)
  function Get_durationOfWarranty:IQuantitativeValue;
  procedure Set_durationOfWarranty(v:IQuantitativeValue);
// properties
  property warrantyScope:IWarrantyScope read Get_warrantyScope write Set_warrantyScope;
  property durationOfWarranty:IQuantitativeValue read Get_durationOfWarranty write Set_durationOfWarranty;
end;
(*** end IWarrantyPromise ***)


(* DataFeedItem
A single item within a larger data feed.
*)
IDataFeedItem=Interface (IIntangible)
(*The datetime the item was removed from the DataFeed.*)
  function Get_dateDeleted:TDateTime;
  procedure Set_dateDeleted(v:TDateTime);
(*The date on which the CreativeWork was created or the item was added to a 
DataFeed.*)
  function Get_dateCreated:TDateTime;
  procedure Set_dateCreated(v:TDateTime);
(*The date on which the CreativeWork was most recently modified or when the 
item's entry was modified within a DataFeed.*)
  function Get_dateModified:TDateTime;
  procedure Set_dateModified(v:TDateTime);
// properties
  property dateDeleted:TDateTime read Get_dateDeleted write Set_dateDeleted;
  property dateCreated:TDateTime read Get_dateCreated write Set_dateCreated;
  property dateModified:TDateTime read Get_dateModified write Set_dateModified;
end;
(*** end IDataFeedItem ***)


(* Chapter
One of the sections into which a book is divided. A chapter usually has a 
section number or a name.
*)
IChapter=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end IChapter ***)

IGameServerStatus=interface; //forward


(* GameServer
Server that provides game interaction in a multiplayer game.
*)
IGameServer=Interface (IIntangible)
(*Number of players on the server.*)
  function Get_playersOnline:Integer;
  procedure Set_playersOnline(v:Integer);
(*Status of a game server.*)
  function Get_serverStatus:IGameServerStatus;
  procedure Set_serverStatus(v:IGameServerStatus);
// properties
  property playersOnline:Integer read Get_playersOnline write Set_playersOnline;
  property serverStatus:IGameServerStatus read Get_serverStatus write Set_serverStatus;
end;
(*** end IGameServer ***)


(* GameServerStatus
Status of a game server.
*)
IGameServerStatus=Interface (IEnumeration)
  function TangGameServerStatus:TangibleValue;
end;
(*** end IGameServerStatus ***)


(* OwnershipInfo
A structured value providing information about when a certain organization or 
person owned a certain product.
*)
IOwnershipInfo=Interface (IStructuredValue)
(*The date and time of giving up ownership on the product.*)
  function Get_ownedThrough:TDateTime;
  procedure Set_ownedThrough(v:TDateTime);
(*The date and time of obtaining the product.*)
  function Get_ownedFrom:TDateTime;
  procedure Set_ownedFrom(v:TDateTime);
(*The organization or person from which the product was acquired.*)
  function Get_acquiredFrom:IPerson;
  procedure Set_acquiredFrom(v:IPerson);
// properties
  property ownedThrough:TDateTime read Get_ownedThrough write Set_ownedThrough;
  property ownedFrom:TDateTime read Get_ownedFrom write Set_ownedFrom;
  property acquiredFrom:IPerson read Get_acquiredFrom write Set_acquiredFrom;
end;
(*** end IOwnershipInfo ***)


(* TrackAction
*)
ITrackAction=Interface (IFindAction)
 (*No atribs*)
end;
(*** end ITrackAction ***)


(* TaxiReservation
*)
ITaxiReservation=Interface (IReservation)
(*Number of people the reservation should accommodate.*)
  function Get_partySize:Integer;
  procedure Set_partySize(v:Integer);
(*Where a taxi will pick up a passenger or a rental car can be picked up.*)
  function Get_pickupLocation:IPlace;
  procedure Set_pickupLocation(v:IPlace);
(*When a taxi will pickup a passenger or a rental car can be picked up.*)
  function Get_pickupTime:TDateTime;
  procedure Set_pickupTime(v:TDateTime);
// properties
  property partySize:Integer read Get_partySize write Set_partySize;
  property pickupLocation:IPlace read Get_pickupLocation write Set_pickupLocation;
  property pickupTime:TDateTime read Get_pickupTime write Set_pickupTime;
end;
(*** end ITaxiReservation ***)


(* JoinAction
*)
IJoinAction=Interface (IInteractAction)
 (*No atribs*)
end;
(*** end IJoinAction ***)


(* HealthPlanCostSharingSpecification
A description of costs to the patient under a given network or formulary.
*)
IHealthPlanCostSharingSpecification=Interface (IIntangible)
(*Whether The copay amount.*)
  function Get_healthPlanCopay:IPriceSpecification;
  procedure Set_healthPlanCopay(v:IPriceSpecification);
(*The category or type of pharmacy associated with this cost sharing.*)
  function Get_healthPlanPharmacyCategory:String;
  procedure Set_healthPlanPharmacyCategory(v:String);
(*Whether the coinsurance applies before or after deductible, etc. TODO: Is 
this a closed set?*)
  function Get_healthPlanCoinsuranceOption:String;
  procedure Set_healthPlanCoinsuranceOption(v:String);
(*Whether The rate of coinsurance expressed as a number between 0.0 and 1.0.*)
  function Get_healthPlanCoinsuranceRate:INumber;
  procedure Set_healthPlanCoinsuranceRate(v:INumber);
(*Whether the copay is before or after deductible, etc. TODO: Is this a closed 
set?*)
  function Get_healthPlanCopayOption:String;
  procedure Set_healthPlanCopayOption(v:String);
// properties
  property healthPlanCopay:IPriceSpecification read Get_healthPlanCopay write Set_healthPlanCopay;
  property healthPlanPharmacyCategory:String read Get_healthPlanPharmacyCategory write Set_healthPlanPharmacyCategory;
  property healthPlanCoinsuranceOption:String read Get_healthPlanCoinsuranceOption write Set_healthPlanCoinsuranceOption;
  property healthPlanCoinsuranceRate:INumber read Get_healthPlanCoinsuranceRate write Set_healthPlanCoinsuranceRate;
  property healthPlanCopayOption:String read Get_healthPlanCopayOption write Set_healthPlanCopayOption;
end;
(*** end IHealthPlanCostSharingSpecification ***)


(* PerformAction
The act of participating in performance arts.
*)
IPerformAction=Interface (IPlayAction)
(*A sub property of location. The entertainment business where the action 
occurred.*)
  function Get_entertainmentBusiness:IEntertainmentBusiness;
  procedure Set_entertainmentBusiness(v:IEntertainmentBusiness);
// properties
  property entertainmentBusiness:IEntertainmentBusiness read Get_entertainmentBusiness write Set_entertainmentBusiness;
end;
(*** end IPerformAction ***)


(* ClaimReview
A fact-checking review of claims made (or reported) in some creative work 
(referenced via itemReviewed).
*)
IClaimReview=Interface (IReview)
(*A short summary of the specific claims reviewed in a ClaimReview.*)
  function Get_claimReviewed:String;
  procedure Set_claimReviewed(v:String);
// properties
  property claimReviewed:String read Get_claimReviewed write Set_claimReviewed;
end;
(*** end IClaimReview ***)


(* CarUsageType
A value indicating a special usage of a car, e.g. commercial rental, driving 
school, or as a taxi.
*)
ICarUsageType=Interface (IQualitativeValue)
  function TangCarUsageType:TangibleValue;
end;
(*** end ICarUsageType ***)

ITVSeries=interface; //forward


(* TVEpisode
A TV episode which can be part of a series or season.
*)
ITVEpisode=Interface (IEpisode)
(*The TV series to which this episode or season belongs.*)
  function Get_partOfTVSeries:ITVSeries;
  procedure Set_partOfTVSeries(v:ITVSeries);
// properties
  property partOfTVSeries:ITVSeries read Get_partOfTVSeries write Set_partOfTVSeries;
end;
(*** end ITVEpisode ***)


(* TVSeries
CreativeWorkSeries dedicated to TV broadcast and associated online delivery.
*)
ITVSeries=Interface (ICreativeWorkSeries)
(*A season in a media series.*)
  function Get_seasons:ICreativeWorkSeason;
  procedure Set_seasons(v:ICreativeWorkSeason);
(*The trailer of a movie or tv/radio series, season, episode, etc.*)
  function Get_trailer:IVideoObject;
  procedure Set_trailer(v:IVideoObject);
(*The production company or studio responsible for the item e.g. series, video 
game, episode etc.*)
  function Get_productionCompany:IOrganization;
  procedure Set_productionCompany(v:IOrganization);
(*A season that is part of the media series.*)
  function Get_containsSeason:ICreativeWorkSeason;
  procedure Set_containsSeason(v:ICreativeWorkSeason);
// properties
  property seasons:ICreativeWorkSeason read Get_seasons write Set_seasons;
  property trailer:IVideoObject read Get_trailer write Set_trailer;
  property productionCompany:IOrganization read Get_productionCompany write Set_productionCompany;
  property containsSeason:ICreativeWorkSeason read Get_containsSeason write Set_containsSeason;
end;
(*** end ITVSeries ***)


(* Thesis
A thesis or dissertation document submitted in support of candidature for an 
academic degree or professional qualification.
*)
IThesis=Interface (ICreativeWork)
(*Qualification, candidature, degree, application that Thesis supports.*)
  function Get_inSupportOf:String;
  procedure Set_inSupportOf(v:String);
// properties
  property inSupportOf:String read Get_inSupportOf write Set_inSupportOf;
end;
(*** end IThesis ***)


(* GovernmentService
A service provided by a government organization, e.g. food stamps, veterans 
benefits, etc.
*)
IGovernmentService=Interface (IService)
(*The operating organization, if different from the provider.  This enables the 
representation of services that are provided by an organization, but operated 
by another organization like a subcontractor.*)
  function Get_serviceOperator:IOrganization;
  procedure Set_serviceOperator(v:IOrganization);
// properties
  property serviceOperator:IOrganization read Get_serviceOperator write Set_serviceOperator;
end;
(*** end IGovernmentService ***)


(* BedDetails
*)
IBedDetails=Interface (IIntangible)
(*The type of bed to which the BedDetail refers, i.e. the type of bed available 
in the quantity indicated by quantity.*)
  function Get_typeOfBed:String;
  procedure Set_typeOfBed(v:String);
(*The quantity of the given bed type available in the HotelRoom, Suite, House, 
or Apartment.*)
  function Get_numberOfBeds:INumber;
  procedure Set_numberOfBeds(v:INumber);
// properties
  property typeOfBed:String read Get_typeOfBed write Set_typeOfBed;
  property numberOfBeds:INumber read Get_numberOfBeds write Set_numberOfBeds;
end;
(*** end IBedDetails ***)


(* DeliveryChargeSpecification
The price for the delivery of an offer using a particular delivery method.
*)
IDeliveryChargeSpecification=Interface (IPriceSpecification)
(**)
  function Get_eligibleRegion:IGeoShape;
  procedure Set_eligibleRegion(v:IGeoShape);
// properties
  property eligibleRegion:IGeoShape read Get_eligibleRegion write Set_eligibleRegion;
end;
(*** end IDeliveryChargeSpecification ***)


(* MedicalAudience
Target audiences for medical web pages. Enumerated type.
*)
IMedicalAudience=Interface (IAudience)
  function TangMedicalAudience:TangibleValue;
end;
(*** end IMedicalAudience ***)


(* MedicalRiskScore
A simple system that adds up the number of risk factors to yield a score that 
is associated with prognosis, e.g. CHAD score, TIMI risk score.
*)
IMedicalRiskScore=Interface (IMedicalRiskEstimator)
(*The algorithm or rules to follow to compute the score.*)
  function Get_algorithm:String;
  procedure Set_algorithm(v:String);
// properties
  property algorithm:String read Get_algorithm write Set_algorithm;
end;
(*** end IMedicalRiskScore ***)


(* PeopleAudience
A set of characteristics belonging to people, e.g. who compose an item's target 
audience.
*)
IPeopleAudience=Interface (IAudience)
(*Audiences defined by a person's minimum age.*)
  function Get_requiredMinAge:Integer;
  procedure Set_requiredMinAge(v:Integer);
(*Audiences defined by a person's maximum age.*)
  function Get_requiredMaxAge:Integer;
  procedure Set_requiredMaxAge(v:Integer);
(*Audiences defined by a person's gender.*)
  function Get_requiredGender:String;
  procedure Set_requiredGender(v:String);
(*The gender of the person or audience.*)
  function Get_suggestedGender:String;
  procedure Set_suggestedGender(v:String);
(*Minimal age recommended for viewing content.*)
  function Get_suggestedMinAge:INumber;
  procedure Set_suggestedMinAge(v:INumber);
(*Maximal age recommended for viewing content.*)
  function Get_suggestedMaxAge:INumber;
  procedure Set_suggestedMaxAge(v:INumber);
// properties
  property requiredMinAge:Integer read Get_requiredMinAge write Set_requiredMinAge;
  property requiredMaxAge:Integer read Get_requiredMaxAge write Set_requiredMaxAge;
  property requiredGender:String read Get_requiredGender write Set_requiredGender;
  property suggestedGender:String read Get_suggestedGender write Set_suggestedGender;
  property suggestedMinAge:INumber read Get_suggestedMinAge write Set_suggestedMinAge;
  property suggestedMaxAge:INumber read Get_suggestedMaxAge write Set_suggestedMaxAge;
end;
(*** end IPeopleAudience ***)


(* ParentAudience
A set of characteristics describing parents, who can be interested in viewing 
some content.
*)
IParentAudience=Interface (IPeopleAudience)
(*Maximal age of the child.*)
  function Get_childMaxAge:INumber;
  procedure Set_childMaxAge(v:INumber);
(*Minimal age of the child.*)
  function Get_childMinAge:INumber;
  procedure Set_childMinAge(v:INumber);
// properties
  property childMaxAge:INumber read Get_childMaxAge write Set_childMaxAge;
  property childMinAge:INumber read Get_childMinAge write Set_childMinAge;
end;
(*** end IParentAudience ***)


(* BorrowAction
*)
IBorrowAction=Interface (ITransferAction)
(*A sub property of participant. The person that lends the object being 
borrowed.*)
  function Get_lender:IPerson;
  procedure Set_lender(v:IPerson);
// properties
  property lender:IPerson read Get_lender write Set_lender;
end;
(*** end IBorrowAction ***)

IRecommendedDoseSchedule=interface; //forward


(* DietarySupplement
A product taken by mouth that contains a dietary ingredient intended to 
supplement the diet. Dietary ingredients may include vitamins, minerals, herbs 
or other botanicals, amino acids, and substances such as enzymes, organ 
tissues, glandulars and metabolites.
*)
IDietarySupplement=Interface (ISubstance)
(*The generic name of this drug or supplement.*)
  function Get_nonProprietaryName:String;
  procedure Set_nonProprietaryName(v:String);
(*Descriptive information establishing a historical perspective on the 
supplement. May include the rationale for the name, the population where the 
supplement first came to prominence, etc.*)
  function Get_background:String;
  procedure Set_background(v:String);
(*True if this item's name is a proprietary/brand name (vs. generic name).*)
  function Get_isProprietary:Boolean;
  procedure Set_isProprietary(v:Boolean);
(*Recommended intake of this supplement for a given population as defined by a 
specific recommending authority.*)
  function Get_recommendedIntake:IRecommendedDoseSchedule;
  procedure Set_recommendedIntake(v:IRecommendedDoseSchedule);
(*The specific biochemical interaction through which this drug or supplement 
produces its pharmacological effect.*)
  function Get_mechanismOfAction:String;
  procedure Set_mechanismOfAction(v:String);
(*Characteristics of the population for which this is intended, or which 
typically uses it, e.g. 'adults'.*)
  function Get_targetPopulation:String;
  procedure Set_targetPopulation(v:String);
(*Any potential safety concern associated with the supplement. May include 
interactions with other drugs and foods, pregnancy, breastfeeding, known 
adverse reactions, and documented efficacy of the supplement.*)
  function Get_safetyConsideration:String;
  procedure Set_safetyConsideration(v:String);
(*The manufacturer of the product.*)
  function Get_manufacturer:IOrganization;
  procedure Set_manufacturer(v:IOrganization);
// properties
  property nonProprietaryName:String read Get_nonProprietaryName write Set_nonProprietaryName;
  property background:String read Get_background write Set_background;
  property isProprietary:Boolean read Get_isProprietary write Set_isProprietary;
  property recommendedIntake:IRecommendedDoseSchedule read Get_recommendedIntake write Set_recommendedIntake;
  property mechanismOfAction:String read Get_mechanismOfAction write Set_mechanismOfAction;
  property targetPopulation:String read Get_targetPopulation write Set_targetPopulation;
  property safetyConsideration:String read Get_safetyConsideration write Set_safetyConsideration;
  property manufacturer:IOrganization read Get_manufacturer write Set_manufacturer;
end;
(*** end IDietarySupplement ***)


(* RecommendedDoseSchedule
A recommended dosing schedule for a drug or supplement as prescribed or 
recommended by an authority or by the drug/supplement's manufacturer. Capture 
the recommending authority in the recognizingAuthority property of 
MedicalEntity.
*)
IRecommendedDoseSchedule=Interface (IDoseSchedule)
 (*No atribs*)
end;
(*** end IRecommendedDoseSchedule ***)


(* BuyAction
The act of giving money to a seller in exchange for goods or services rendered. 
An agent buys an object, product, or service from a seller for a price. 
Reciprocal of SellAction.
*)
IBuyAction=Interface (ITradeAction)
(*The warranty promise(s) included in the offer.*)
  function Get_warrantyPromise:IWarrantyPromise;
  procedure Set_warrantyPromise(v:IWarrantyPromise);
(*'vendor' is an earlier term for 'seller'.*)
  function Get_vendor:IOrganization;
  procedure Set_vendor(v:IOrganization);
// properties
  property warrantyPromise:IWarrantyPromise read Get_warrantyPromise write Set_warrantyPromise;
  property vendor:IOrganization read Get_vendor write Set_vendor;
end;
(*** end IBuyAction ***)

IRealEstateAgent=interface; //forward


(* RentAction
The act of giving money in return for temporary use, but not ownership, of an 
object such as a vehicle or property. For example, an agent rents a property 
from a landlord in exchange for a periodic payment.
*)
IRentAction=Interface (ITradeAction)
(*A sub property of participant. The real estate agent involved in the action.*)
  function Get_realEstateAgent:IRealEstateAgent;
  procedure Set_realEstateAgent(v:IRealEstateAgent);
(*A sub property of participant. The owner of the real estate property.*)
  function Get_landlord:IPerson;
  procedure Set_landlord(v:IPerson);
// properties
  property realEstateAgent:IRealEstateAgent read Get_realEstateAgent write Set_realEstateAgent;
  property landlord:IPerson read Get_landlord write Set_landlord;
end;
(*** end IRentAction ***)


(* RealEstateAgent
A real-estate agent.
*)
IRealEstateAgent=Interface (ILocalBusiness)
 (*No atribs*)
end;
(*** end IRealEstateAgent ***)


(* MedicalDevicePurpose
Categories of medical devices, organized by the purpose or intended use of the 
device.
*)
IMedicalDevicePurpose=Interface (IMedicalEnumeration)
  function TangMedicalDevicePurpose:TangibleValue;
end;
(*** end IMedicalDevicePurpose ***)


(* Report
A Report generated by governmental or non-governmental organization.
*)
IReport=Interface (IArticle)
(*The number or other unique designator assigned to a Report by the publishing 
organization.*)
  function Get_reportNumber:String;
  procedure Set_reportNumber(v:String);
// properties
  property reportNumber:String read Get_reportNumber write Set_reportNumber;
end;
(*** end IReport ***)


(* TechArticle
A technical article - Example: How-to (task) topics, step-by-step, procedural 
troubleshooting, specifications, etc.
*)
ITechArticle=Interface (IArticle)
(*Prerequisites needed to fulfill steps in article.*)
  function Get_dependencies:String;
  procedure Set_dependencies(v:String);
(*Proficiency needed for this content; expected values: 'Beginner', 'Expert'.*)
  function Get_proficiencyLevel:String;
  procedure Set_proficiencyLevel(v:String);
// properties
  property dependencies:String read Get_dependencies write Set_dependencies;
  property proficiencyLevel:String read Get_proficiencyLevel write Set_proficiencyLevel;
end;
(*** end ITechArticle ***)


(* Integer
Data type: Integer.
*)
IInteger=Interface (INumber)
 (*No atribs*)
end;
(*** end IInteger ***)


(* MedicalGuidelineRecommendation
A guideline recommendation that is regarded as efficacious and where quality of 
the data supporting the recommendation is sound.
*)
IMedicalGuidelineRecommendation=Interface (IMedicalGuideline)
(*Strength of the guideline's recommendation (e.g. 'class I').*)
  function Get_recommendationStrength:String;
  procedure Set_recommendationStrength(v:String);
// properties
  property recommendationStrength:String read Get_recommendationStrength write Set_recommendationStrength;
end;
(*** end IMedicalGuidelineRecommendation ***)


(* FollowAction
*)
IFollowAction=Interface (IInteractAction)
(*A sub property of object. The person or organization being followed.*)
  function Get_followee:IOrganization;
  procedure Set_followee(v:IOrganization);
// properties
  property followee:IOrganization read Get_followee write Set_followee;
end;
(*** end IFollowAction ***)


(* TipAction
The act of giving money voluntarily to a beneficiary in recognition of services 
rendered.
*)
ITipAction=Interface (ITradeAction)
 (*No atribs*)
end;
(*** end ITipAction ***)


(* BusinessAudience
A set of characteristics belonging to businesses, e.g. who compose an item's 
target audience.
*)
IBusinessAudience=Interface (IAudience)
(*The age of the business.*)
  function Get_yearsInOperation:IQuantitativeValue;
  procedure Set_yearsInOperation(v:IQuantitativeValue);
(*The size of the business in annual revenue.*)
  function Get_yearlyRevenue:IQuantitativeValue;
  procedure Set_yearlyRevenue(v:IQuantitativeValue);
(*The number of employees in an organization e.g. business.*)
  function Get_numberOfEmployees:IQuantitativeValue;
  procedure Set_numberOfEmployees(v:IQuantitativeValue);
// properties
  property yearsInOperation:IQuantitativeValue read Get_yearsInOperation write Set_yearsInOperation;
  property yearlyRevenue:IQuantitativeValue read Get_yearlyRevenue write Set_yearlyRevenue;
  property numberOfEmployees:IQuantitativeValue read Get_numberOfEmployees write Set_numberOfEmployees;
end;
(*** end IBusinessAudience ***)

IListItem=interface; //forward


(* ListItem
An list item, e.g. a step in a checklist or how-to description.
*)
IListItem=Interface (IIntangible)
(*An entity represented by an entry in a list or data feed (e.g. an 'artist' in 
a list of 'artists')’.*)
  function Get_item:IThing;
  procedure Set_item(v:IThing);
(*A link to the ListItem that preceeds the current one.*)
  function Get_previousItem:IListItem;
  procedure Set_previousItem(v:IListItem);
(*A link to the ListItem that follows the current one.*)
  function Get_nextItem:IListItem;
  procedure Set_nextItem(v:IListItem);
// properties
  property item:IThing read Get_item write Set_item;
  property previousItem:IListItem read Get_previousItem write Set_previousItem;
  property nextItem:IListItem read Get_nextItem write Set_nextItem;
end;
(*** end IListItem ***)


(* PhysicalActivity
Any bodily activity that enhances or maintains physical fitness and overall 
health and wellness. Includes activity that is part of daily living and 
routine, structured exercise, and exercise prescribed as part of a medical 
treatment or recovery plan.
*)
IPhysicalActivity=Interface (ILifestyleModification)
(*The characteristics of associated patients, such as age, gender, race etc.*)
  function Get_epidemiology:String;
  procedure Set_epidemiology(v:String);
// properties
  property epidemiology:String read Get_epidemiology write Set_epidemiology;
end;
(*** end IPhysicalActivity ***)


(* APIReference
Reference documentation for application programming interfaces (APIs).
*)
IAPIReference=Interface (ITechArticle)
(*Associated product/technology version. e.g., .NET Framework 4.5.*)
  function Get_assemblyVersion:String;
  procedure Set_assemblyVersion(v:String);
(*Indicates whether API is managed or unmanaged.*)
  function Get_programmingModel:String;
  procedure Set_programmingModel(v:String);
(*Type of app development: phone, Metro style, desktop, XBox, etc.*)
  function Get_targetPlatform:String;
  procedure Set_targetPlatform(v:String);
(*Library file name e.g., mscorlib.dll, system.web.dll.*)
  function Get_assembly:String;
  procedure Set_assembly(v:String);
// properties
  property assemblyVersion:String read Get_assemblyVersion write Set_assemblyVersion;
  property programmingModel:String read Get_programmingModel write Set_programmingModel;
  property targetPlatform:String read Get_targetPlatform write Set_targetPlatform;
  property assembly:String read Get_assembly write Set_assembly;
end;
(*** end IAPIReference ***)


(* Car
A car is a wheeled, self-powered motor vehicle used for transportation.
*)
ICar=Interface (IVehicle)
(**)
  function Get_roofLoad:IQuantitativeValue;
  procedure Set_roofLoad(v:IQuantitativeValue);
// properties
  property roofLoad:IQuantitativeValue read Get_roofLoad write Set_roofLoad;
end;
(*** end ICar ***)


(* RentalCarReservation
*)
IRentalCarReservation=Interface (IReservation)
(*Where a rental car can be dropped off.*)
  function Get_dropoffLocation:IPlace;
  procedure Set_dropoffLocation(v:IPlace);
(*When a rental car can be dropped off.*)
  function Get_dropoffTime:TDateTime;
  procedure Set_dropoffTime(v:TDateTime);
// properties
  property dropoffLocation:IPlace read Get_dropoffLocation write Set_dropoffLocation;
  property dropoffTime:TDateTime read Get_dropoffTime write Set_dropoffTime;
end;
(*** end IRentalCarReservation ***)


(* WebApplication
Web applications.
*)
IWebApplication=Interface (ISoftwareApplication)
(*Specifies browser requirements in human-readable text. For example, 'requires 
HTML5 support'.*)
  function Get_browserRequirements:String;
  procedure Set_browserRequirements(v:String);
// properties
  property browserRequirements:String read Get_browserRequirements write Set_browserRequirements;
end;
(*** end IWebApplication ***)


(* GamePlayMode
Indicates whether this game is multi-player, co-op or single-player.
*)
IGamePlayMode=Interface (IEnumeration)
  function TangGamePlayMode:TangibleValue;
end;
(*** end IGamePlayMode ***)


(* AggregateOffer
When a single product is associated with multiple offers (for example, the same 
pair of shoes is offered by different merchants), then AggregateOffer can be 
used.
*)
IAggregateOffer=Interface (IOffer)
(*The highest price of all offers available.*)
  function Get_highPrice:INumber;
  procedure Set_highPrice(v:INumber);
(*The number of offers for the product.*)
  function Get_offerCount:Integer;
  procedure Set_offerCount(v:Integer);
(*The lowest price of all offers available.*)
  function Get_lowPrice:INumber;
  procedure Set_lowPrice(v:INumber);
// properties
  property highPrice:INumber read Get_highPrice write Set_highPrice;
  property offerCount:Integer read Get_offerCount write Set_offerCount;
  property lowPrice:INumber read Get_lowPrice write Set_lowPrice;
end;
(*** end IAggregateOffer ***)


(* Brand
A brand is a name used by an organization or business person for labeling a 
product, product group, or similar.
*)
IBrand=Interface (IIntangible)
  function TangBrand:TangibleValue;
end;
(*** end IBrand ***)


(* PropertyValueSpecification
A Property value specification.
*)
IPropertyValueSpecification=Interface (IIntangible)
(*Whether multiple values are allowed for the property.  Default is false.*)
  function Get_multipleValues:Boolean;
  procedure Set_multipleValues(v:Boolean);
(*Whether or not a property is mutable.  Default is false. Specifying this for 
a property that also has a value makes it act similar to a "hidden" input in an 
HTML form.*)
  function Get_readonlyValue:Boolean;
  procedure Set_readonlyValue(v:Boolean);
(*Specifies the allowed range for number of characters in a literal value.*)
  function Get_valueMaxLength:INumber;
  procedure Set_valueMaxLength(v:INumber);
(*Specifies the minimum allowed range for number of characters in a literal 
value.*)
  function Get_valueMinLength:INumber;
  procedure Set_valueMinLength(v:INumber);
(*The default value of the input.  For properties that expect a literal, the 
default is a literal value, for properties that expect an object, it's an ID 
reference to one of the current values.*)
  function Get_defaultValue:String;
  procedure Set_defaultValue(v:String);
(*Specifies a regular expression for testing literal values according to the 
HTML spec.*)
  function Get_valuePattern:String;
  procedure Set_valuePattern(v:String);
(*Whether the property must be filled in to complete the action.  Default is 
false.*)
  function Get_valueRequired:Boolean;
  procedure Set_valueRequired(v:Boolean);
(*Indicates the name of the PropertyValueSpecification to be used in URL 
templates and form encoding in a manner analogous to HTML's input@name.*)
  function Get_valueName:String;
  procedure Set_valueName(v:String);
(*The stepValue attribute indicates the granularity that is expected (and 
required) of the value in a PropertyValueSpecification.*)
  function Get_stepValue:INumber;
  procedure Set_stepValue(v:INumber);
// properties
  property multipleValues:Boolean read Get_multipleValues write Set_multipleValues;
  property readonlyValue:Boolean read Get_readonlyValue write Set_readonlyValue;
  property valueMaxLength:INumber read Get_valueMaxLength write Set_valueMaxLength;
  property valueMinLength:INumber read Get_valueMinLength write Set_valueMinLength;
  property defaultValue:String read Get_defaultValue write Set_defaultValue;
  property valuePattern:String read Get_valuePattern write Set_valuePattern;
  property valueRequired:Boolean read Get_valueRequired write Set_valueRequired;
  property valueName:String read Get_valueName write Set_valueName;
  property stepValue:INumber read Get_stepValue write Set_stepValue;
end;
(*** end IPropertyValueSpecification ***)


(* MobileApplication
A software application designed specifically to work well on a mobile device 
such as a telephone.
*)
IMobileApplication=Interface (ISoftwareApplication)
(*Specifies specific carrier(s) requirements for the application (e.g. an 
application may only work on a specific carrier network).*)
  function Get_carrierRequirements:String;
  procedure Set_carrierRequirements(v:String);
// properties
  property carrierRequirements:String read Get_carrierRequirements write Set_carrierRequirements;
end;
(*** end IMobileApplication ***)


(* ReceiveAction
*)
IReceiveAction=Interface (ITransferAction)
(*A sub property of participant. The participant who is at the sending end of 
the action.*)
  function Get_sender:IOrganization;
  procedure Set_sender(v:IOrganization);
// properties
  property sender:IOrganization read Get_sender write Set_sender;
end;
(*** end IReceiveAction ***)

IMedicalTrialDesign=interface; //forward


(* MedicalTrial
A medical trial is a type of medical study that uses scientific process used to 
compare the safety and efficacy of medical therapies or medical procedures. In 
general, medical trials are controlled and subjects are allocated at random to 
the different treatment and/or control groups.
*)
IMedicalTrial=Interface (IMedicalStudy)
(*Specifics about the trial design (enumerated).*)
  function Get_trialDesign:IMedicalTrialDesign;
  procedure Set_trialDesign(v:IMedicalTrialDesign);
(*The phase of the clinical trial.*)
  function Get_phase:String;
  procedure Set_phase(v:String);
// properties
  property trialDesign:IMedicalTrialDesign read Get_trialDesign write Set_trialDesign;
  property phase:String read Get_phase write Set_phase;
end;
(*** end IMedicalTrial ***)


(* MedicalTrialDesign
Design models for medical trials. Enumerated type.
*)
IMedicalTrialDesign=Interface (IEnumeration)
  function TangMedicalTrialDesign:TangibleValue;
end;
(*** end IMedicalTrialDesign ***)

IMass=interface; //forward


(* NutritionInformation
Nutritional information about the recipe.
*)
INutritionInformation=Interface (IStructuredValue)
(*The number of grams of protein.*)
  function Get_proteinContent:IMass;
  procedure Set_proteinContent(v:IMass);
(*The number of grams of fat.*)
  function Get_fatContent:IMass;
  procedure Set_fatContent(v:IMass);
(*The number of grams of trans fat.*)
  function Get_transFatContent:IMass;
  procedure Set_transFatContent(v:IMass);
(*The number of calories.*)
  function Get_calories:IEnergy;
  procedure Set_calories(v:IEnergy);
(*The number of grams of carbohydrates.*)
  function Get_carbohydrateContent:IMass;
  procedure Set_carbohydrateContent(v:IMass);
(*The number of milligrams of sodium.*)
  function Get_sodiumContent:IMass;
  procedure Set_sodiumContent(v:IMass);
(*The number of milligrams of cholesterol.*)
  function Get_cholesterolContent:IMass;
  procedure Set_cholesterolContent(v:IMass);
(*The serving size, in terms of the number of volume or mass.*)
  function Get_servingSize:String;
  procedure Set_servingSize(v:String);
(*The number of grams of fiber.*)
  function Get_fiberContent:IMass;
  procedure Set_fiberContent(v:IMass);
(*The number of grams of saturated fat.*)
  function Get_saturatedFatContent:IMass;
  procedure Set_saturatedFatContent(v:IMass);
(*The number of grams of sugar.*)
  function Get_sugarContent:IMass;
  procedure Set_sugarContent(v:IMass);
(*The number of grams of unsaturated fat.*)
  function Get_unsaturatedFatContent:IMass;
  procedure Set_unsaturatedFatContent(v:IMass);
// properties
  property proteinContent:IMass read Get_proteinContent write Set_proteinContent;
  property fatContent:IMass read Get_fatContent write Set_fatContent;
  property transFatContent:IMass read Get_transFatContent write Set_transFatContent;
  property calories:IEnergy read Get_calories write Set_calories;
  property carbohydrateContent:IMass read Get_carbohydrateContent write Set_carbohydrateContent;
  property sodiumContent:IMass read Get_sodiumContent write Set_sodiumContent;
  property cholesterolContent:IMass read Get_cholesterolContent write Set_cholesterolContent;
  property servingSize:String read Get_servingSize write Set_servingSize;
  property fiberContent:IMass read Get_fiberContent write Set_fiberContent;
  property saturatedFatContent:IMass read Get_saturatedFatContent write Set_saturatedFatContent;
  property sugarContent:IMass read Get_sugarContent write Set_sugarContent;
  property unsaturatedFatContent:IMass read Get_unsaturatedFatContent write Set_unsaturatedFatContent;
end;
(*** end INutritionInformation ***)


(* Mass
Properties that take Mass as values are of the form '&amp;lt;Number&amp;gt; 
&amp;lt;Mass unit of measure&amp;gt;'. E.g., '7 kg'.
*)
IMass=Interface (IQuantity)
  function TangMass:TangibleValue;
end;
(*** end IMass ***)


(* PerformanceRole
A PerformanceRole is a Role that some entity places with regard to a theatrical 
performance, e.g. in a Movie, TVSeries etc.
*)
IPerformanceRole=Interface (IRole)
(*The name of a character played in some acting or performing role, i.e. in a 
PerformanceRole.*)
  function Get_characterName:String;
  procedure Set_characterName(v:String);
// properties
  property characterName:String read Get_characterName write Set_characterName;
end;
(*** end IPerformanceRole ***)


(* LymphaticVessel
A type of blood vessel that specifically carries lymph fluid unidirectionally 
toward the heart.
*)
ILymphaticVessel=Interface (IVessel)
(*The vasculature the lymphatic structure originates, or afferents, from.*)
  function Get_originatesFrom:IVessel;
  procedure Set_originatesFrom(v:IVessel);
(*The vasculature the lymphatic structure runs, or efferents, to.*)
  function Get_runsTo:IVessel;
  procedure Set_runsTo(v:IVessel);
// properties
  property originatesFrom:IVessel read Get_originatesFrom write Set_originatesFrom;
  property runsTo:IVessel read Get_runsTo write Set_runsTo;
end;
(*** end ILymphaticVessel ***)


(* Apartment
*)
IApartment=Interface (IAccommodation)
 (*No atribs*)
end;
(*** end IApartment ***)


(* Patient
A patient is any person recipient of health care services.
*)
IPatient=Interface (IMedicalAudience)
  function TangPatient:TangibleValue;
end;
(*** end IPatient ***)


(* EnumerationValue
An enumeration value.
*)
IEnumerationValue=Interface (IEnumeration)
(*The set (enumeration) of values of which contains this value.*)
  function Get_partOfEnumerationValueSet:String;
  procedure Set_partOfEnumerationValueSet(v:String);
(*A short textual code that uniquely identifies the value. The code is 
typically used in structured URLs.*)
  function Get_enumerationValueCode:String;
  procedure Set_enumerationValueCode(v:String);
// properties
  property partOfEnumerationValueSet:String read Get_partOfEnumerationValueSet write Set_partOfEnumerationValueSet;
  property enumerationValueCode:String read Get_enumerationValueCode write Set_enumerationValueCode;
end;
(*** end IEnumerationValue ***)

IGeoCoordinates=interface; //forward


(* GeoCircle
A GeoCircle is a GeoShape representing a circular geographic area. As it is a 
GeoShape
          it provides the simple textual property 'circle', but also 
allows the combination of postalCode alongside geoRadius.
          The center 
of the circle can be indicated via the 'geoMidpoint' property, or more 
approximately using 'address', 'postalCode'.
*)
IGeoCircle=Interface (IGeoShape)
(*Indicates the approximate radius of a GeoCircle (metres unless indicated 
otherwise via Distance notation).*)
  function Get_geoRadius:IDistance;
  procedure Set_geoRadius(v:IDistance);
(*Indicates the GeoCoordinates at the centre of a GeoShape e.g. GeoCircle.*)
  function Get_geoMidpoint:IGeoCoordinates;
  procedure Set_geoMidpoint(v:IGeoCoordinates);
// properties
  property geoRadius:IDistance read Get_geoRadius write Set_geoRadius;
  property geoMidpoint:IGeoCoordinates read Get_geoMidpoint write Set_geoMidpoint;
end;
(*** end IGeoCircle ***)


(* GeoCoordinates
The geographic coordinates of a place or event.
*)
IGeoCoordinates=Interface (IStructuredValue)
(**)
  function Get_latitude:INumber;
  procedure Set_latitude(v:INumber);
(**)
  function Get_longitude:INumber;
  procedure Set_longitude(v:INumber);
(*The postal code. For example, 94043.*)
  function Get_postalCode:String;
  procedure Set_postalCode(v:String);
// properties
  property latitude:INumber read Get_latitude write Set_latitude;
  property longitude:INumber read Get_longitude write Set_longitude;
  property postalCode:String read Get_postalCode write Set_postalCode;
end;
(*** end IGeoCoordinates ***)


(* EducationalAudience
An EducationalAudience.
*)
IEducationalAudience=Interface (IAudience)
(*An educationalRole of an EducationalAudience.*)
  function Get_educationalRole:String;
  procedure Set_educationalRole(v:String);
// properties
  property educationalRole:String read Get_educationalRole write Set_educationalRole;
end;
(*** end IEducationalAudience ***)


(* RadioSeries
CreativeWorkSeries dedicated to radio broadcast and associated online delivery.
*)
IRadioSeries=Interface (ICreativeWorkSeries)
 (*No atribs*)
end;
(*** end IRadioSeries ***)


(* ChooseAction
The act of expressing a preference from a set of options or a large or 
unbounded set of choices/options.
*)
IChooseAction=Interface (IAssessAction)
(*A sub property of object. The options subject to this action.*)
  function Get_option:IThing;
  procedure Set_option(v:IThing);
// properties
  property option:IThing read Get_option write Set_option;
end;
(*** end IChooseAction ***)


(* VoteAction
The act of expressing a preference from a fixed/finite/structured set of 
choices/options.
*)
IVoteAction=Interface (IChooseAction)
(*A sub property of object. The candidate subject of this action.*)
  function Get_candidate:IPerson;
  procedure Set_candidate(v:IPerson);
// properties
  property candidate:IPerson read Get_candidate write Set_candidate;
end;
(*** end IVoteAction ***)


(* LinkRole
A Role that represents a Web link e.g. as expressed via the 'url' property. Its 
linkRelationship property can indicate URL-based and plain textual link types 
e.g. those in IANA link registry or others such as 'amphtml'. This structure 
provides a placeholder where details from HTML's link element can be 
represented outside of HTML, e.g. in JSON-LD feeds.
*)
ILinkRole=Interface (IRole)
(*Indicates the relationship type of a Web link.*)
  function Get_linkRelationship:String;
  procedure Set_linkRelationship(v:String);
// properties
  property linkRelationship:String read Get_linkRelationship write Set_linkRelationship;
end;
(*** end ILinkRole ***)


(* LoanOrCredit
A financial product for the loaning of an amount of money under agreed terms 
and charges.
*)
ILoanOrCredit=Interface (IFinancialProduct)
(*The duration of the loan or credit agreement.*)
  function Get_loanTerm:IQuantitativeValue;
  procedure Set_loanTerm(v:IQuantitativeValue);
(*Assets required to secure loan or credit repayments. It may take form of 
third party pledge, goods, financial instruments (cash, securities, etc.)*)
  function Get_requiredCollateral:String;
  procedure Set_requiredCollateral(v:String);
(*The amount of money.*)
  function Get_amount:IMonetaryAmount;
  procedure Set_amount(v:IMonetaryAmount);
// properties
  property loanTerm:IQuantitativeValue read Get_loanTerm write Set_loanTerm;
  property requiredCollateral:String read Get_requiredCollateral write Set_requiredCollateral;
  property amount:IMonetaryAmount read Get_amount write Set_amount;
end;
(*** end ILoanOrCredit ***)


(* MedicalImagingTechnique
Any medical imaging modality typically used for diagnostic purposes. Enumerated 
type.
*)
IMedicalImagingTechnique=Interface (IMedicalEnumeration)
  function TangMedicalImagingTechnique:TangibleValue;
end;
(*** end IMedicalImagingTechnique ***)


(* WebSite
A WebSite is a set of related web pages and other items typically served from a 
single web domain and accessible via URLs.
*)
IWebSite=Interface (ICreativeWork)
 (*No atribs*)
end;
(*** end IWebSite ***)


(* BusOrCoach
A bus (also omnibus or autobus) is a road vehicle designed to carry passengers. 
Coaches are luxury busses, usually in service for long distance travel.
*)
IBusOrCoach=Interface (IVehicle)
(*The ACRISS Car Classification Code is a code used by many car rental 
companies, for classifying vehicles. ACRISS stands for Association of Car 
Rental Industry Systems and Standards.*)
  function Get_acrissCode:String;
  procedure Set_acrissCode(v:String);
// properties
  property acrissCode:String read Get_acrissCode write Set_acrissCode;
end;
(*** end IBusOrCoach ***)


(* BroadcastFrequencySpecification
The frequency in MHz and the modulation used for a particular BroadcastService.
*)
IBroadcastFrequencySpecification=Interface (IIntangible)
(*The frequency in MHz for a particular broadcast.*)
  function Get_broadcastFrequencyValue:IQuantitativeValue;
  procedure Set_broadcastFrequencyValue(v:IQuantitativeValue);
// properties
  property broadcastFrequencyValue:IQuantitativeValue read Get_broadcastFrequencyValue write Set_broadcastFrequencyValue;
end;
(*** end IBroadcastFrequencySpecification ***)


(* ReturnAction
The act of returning to the origin that which was previously received (concrete 
objects) or taken (ownership).
*)
IReturnAction=Interface (ITransferAction)
 (*No atribs*)
end;
(*** end IReturnAction ***)


(* ImagingTest
Any medical imaging modality typically used for diagnostic purposes.
*)
IImagingTest=Interface (IMedicalTest)
(*Imaging technique used.*)
  function Get_imagingTechnique:IMedicalImagingTechnique;
  procedure Set_imagingTechnique(v:IMedicalImagingTechnique);
// properties
  property imagingTechnique:IMedicalImagingTechnique read Get_imagingTechnique write Set_imagingTechnique;
end;
(*** end IImagingTest ***)


(* LeaveAction
*)
ILeaveAction=Interface (IInteractAction)
 (*No atribs*)
end;
(*** end ILeaveAction ***)


(* InfectiousDisease
An infectious disease is a clinically evident human disease resulting from the 
presence of pathogenic microbial agents, like pathogenic viruses, pathogenic 
bacteria, fungi, protozoa, multicellular parasites, and prions. To be 
considered an infectious disease, such pathogens are known to be able to cause 
this disease.
*)
IInfectiousDisease=Interface (IMedicalCondition)
(*The class of infectious agent (bacteria, prion, etc.) that causes the 
disease.*)
  function Get_infectiousAgentClass:IInfectiousAgentClass;
  procedure Set_infectiousAgentClass(v:IInfectiousAgentClass);
(*How the disease spreads, either as a route or vector, for example 'direct 
contact', 'Aedes aegypti', etc.*)
  function Get_transmissionMethod:String;
  procedure Set_transmissionMethod(v:String);
(*The actual infectious agent, such as a specific bacterium.*)
  function Get_infectiousAgent:String;
  procedure Set_infectiousAgent(v:String);
// properties
  property infectiousAgentClass:IInfectiousAgentClass read Get_infectiousAgentClass write Set_infectiousAgentClass;
  property transmissionMethod:String read Get_transmissionMethod write Set_transmissionMethod;
  property infectiousAgent:String read Get_infectiousAgent write Set_infectiousAgent;
end;
(*** end IInfectiousDisease ***)


(* BusStop
A bus stop.
*)
IBusStop=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IBusStop ***)


(* MusicRelease
A MusicRelease is a specific release of a music album.
*)
IMusicRelease=Interface (IMusicPlaylist)
(*The group the release is credited to if different than the byArtist. For 
example, Red and Blue is credited to "Stefani Germanotta Band", but by Lady 
Gaga.*)
  function Get_creditedTo:IOrganization;
  procedure Set_creditedTo(v:IOrganization);
(*Format of this release (the type of recording media used, ie. compact disc, 
digital media, LP, etc.).*)
  function Get_musicReleaseFormat:IMusicReleaseFormatType;
  procedure Set_musicReleaseFormat(v:IMusicReleaseFormatType);
(*The label that issued the release.*)
  function Get_recordLabel:IOrganization;
  procedure Set_recordLabel(v:IOrganization);
(*The catalog number for the release.*)
  function Get_catalogNumber:String;
  procedure Set_catalogNumber(v:String);
(*The album this is a release of.*)
  function Get_releaseOf:IMusicAlbum;
  procedure Set_releaseOf(v:IMusicAlbum);
// properties
  property creditedTo:IOrganization read Get_creditedTo write Set_creditedTo;
  property musicReleaseFormat:IMusicReleaseFormatType read Get_musicReleaseFormat write Set_musicReleaseFormat;
  property recordLabel:IOrganization read Get_recordLabel write Set_recordLabel;
  property catalogNumber:String read Get_catalogNumber write Set_catalogNumber;
  property releaseOf:IMusicAlbum read Get_releaseOf write Set_releaseOf;
end;
(*** end IMusicRelease ***)


(* FoodEstablishmentReservation
A reservation to dine at a food-related business.Note: This type is for 
information about actual reservations, e.g. in confirmation emails or HTML 
pages with individual confirmations of reservations.
*)
IFoodEstablishmentReservation=Interface (IReservation)
(**)
  function Get_startTime:TDateTime;
  procedure Set_startTime(v:TDateTime);
(**)
  function Get_endTime:TDateTime;
  procedure Set_endTime(v:TDateTime);
// properties
  property startTime:TDateTime read Get_startTime write Set_startTime;
  property endTime:TDateTime read Get_endTime write Set_endTime;
end;
(*** end IFoodEstablishmentReservation ***)


(* HotelRoom
*)
IHotelRoom=Interface (IRoom)
(*The type of bed or beds included in the accommodation. For the single case of 
just one bed of a certain type, you use bed directly with a text.
      If you 
want to indicate the quantity of a certain kind of bed, use an instance of 
BedDetails. For more detailed information, use the amenityFeature property.*)
  function Get_bed:IBedType;
  procedure Set_bed(v:IBedType);
(*The allowed total occupancy for the accommodation in persons (including 
infants etc). For individual accommodations, this is not necessarily the legal 
maximum but defines the permitted usage as per the contractual agreement (e.g. 
a double room used by a single person).
Typical unit code(s): C62 for person*)
  function Get_occupancy:IQuantitativeValue;
  procedure Set_occupancy(v:IQuantitativeValue);
// properties
  property bed:IBedType read Get_bed write Set_bed;
  property occupancy:IQuantitativeValue read Get_occupancy write Set_occupancy;
end;
(*** end IHotelRoom ***)


(* MedicalClinic
A facility, often associated with a hospital or medical school, that is devoted 
to the specific diagnosis and/or healthcare. Previously limited to outpatients 
but with evolution it may be open to inpatients as well.
*)
IMedicalClinic=Interface (IMedicalBusiness)
 (*No atribs*)
end;
(*** end IMedicalClinic ***)


(* InteractionCounter
A summary of how users have interacted with this CreativeWork. In most cases, 
authors will use a subtype to specify the specific type of interaction.
*)
IInteractionCounter=Interface (IStructuredValue)
(*The WebSite or SoftwareApplication where the interactions took place.*)
  function Get_interactionService:ISoftwareApplication;
  procedure Set_interactionService(v:ISoftwareApplication);
(**)
  function Get_interactionType:IAction;
  procedure Set_interactionType(v:IAction);
(*The number of interactions for the CreativeWork using the WebSite or 
SoftwareApplication.*)
  function Get_userInteractionCount:Integer;
  procedure Set_userInteractionCount(v:Integer);
// properties
  property interactionService:ISoftwareApplication read Get_interactionService write Set_interactionService;
  property interactionType:IAction read Get_interactionType write Set_interactionType;
  property userInteractionCount:Integer read Get_userInteractionCount write Set_userInteractionCount;
end;
(*** end IInteractionCounter ***)


(* Recipe
*)
IRecipe=Interface (ICreativeWork)
(*A step or instruction involved in making the recipe.*)
  function Get_recipeInstructions:IItemList;
  procedure Set_recipeInstructions(v:IItemList);
(*The quantity produced by the recipe (for example, number of people served, 
number of servings, etc).*)
  function Get_recipeYield:String;
  procedure Set_recipeYield(v:String);
(*The cuisine of the recipe (for example, French or Ethiopian).*)
  function Get_recipeCuisine:String;
  procedure Set_recipeCuisine(v:String);
(*Nutrition information about the recipe.*)
  function Get_nutrition:INutritionInformation;
  procedure Set_nutrition(v:INutritionInformation);
(*Indicates a dietary restriction or guideline for which this recipe is 
suitable, e.g. diabetic, halal etc.*)
  function Get_suitableForDiet:IRestrictedDiet;
  procedure Set_suitableForDiet(v:IRestrictedDiet);
(*A single ingredient used in the recipe, e.g. sugar, flour or garlic.*)
  function Get_ingredients:String;
  procedure Set_ingredients(v:String);
(*The method of cooking, such as Frying, Steaming, ...*)
  function Get_cookingMethod:String;
  procedure Set_cookingMethod(v:String);
(*The category of the recipe—for example, appetizer, entree, etc.*)
  function Get_recipeCategory:String;
  procedure Set_recipeCategory(v:String);
(**)
  function Get_totalTime:IDuration;
  procedure Set_totalTime(v:IDuration);
(**)
  function Get_cookTime:IDuration;
  procedure Set_cookTime(v:IDuration);
(**)
  function Get_prepTime:IDuration;
  procedure Set_prepTime(v:IDuration);
// properties
  property recipeInstructions:IItemList read Get_recipeInstructions write Set_recipeInstructions;
  property recipeYield:String read Get_recipeYield write Set_recipeYield;
  property recipeCuisine:String read Get_recipeCuisine write Set_recipeCuisine;
  property nutrition:INutritionInformation read Get_nutrition write Set_nutrition;
  property suitableForDiet:IRestrictedDiet read Get_suitableForDiet write Set_suitableForDiet;
  property ingredients:String read Get_ingredients write Set_ingredients;
  property cookingMethod:String read Get_cookingMethod write Set_cookingMethod;
  property recipeCategory:String read Get_recipeCategory write Set_recipeCategory;
  property totalTime:IDuration read Get_totalTime write Set_totalTime;
  property cookTime:IDuration read Get_cookTime write Set_cookTime;
  property prepTime:IDuration read Get_prepTime write Set_prepTime;
end;
(*** end IRecipe ***)


(* ReviewAction
The act of producing a balanced opinion about the object for an audience. An 
agent reviews an object with participants resulting in a review.
*)
IReviewAction=Interface (IAssessAction)
(*A sub property of result. The review that resulted in the performing of the 
action.*)
  function Get_resultReview:IReview;
  procedure Set_resultReview(v:IReview);
// properties
  property resultReview:IReview read Get_resultReview write Set_resultReview;
end;
(*** end IReviewAction ***)


(* WinAction
The act of achieving victory in a competitive activity.
*)
IWinAction=Interface (IAchieveAction)
(*A sub property of participant. The loser of the action.*)
  function Get_loser:IPerson;
  procedure Set_loser(v:IPerson);
// properties
  property loser:IPerson read Get_loser write Set_loser;
end;
(*** end IWinAction ***)


(* ScholarlyArticle
A scholarly article.
*)
IScholarlyArticle=Interface (IArticle)
 (*No atribs*)
end;
(*** end IScholarlyArticle ***)


(* MedicalScholarlyArticle
A scholarly article in the medical domain.
*)
IMedicalScholarlyArticle=Interface (IScholarlyArticle)
(**)
  function Get_publicationType:String;
  procedure Set_publicationType(v:String);
// properties
  property publicationType:String read Get_publicationType write Set_publicationType;
end;
(*** end IMedicalScholarlyArticle ***)


(* Blog
A blog.
*)
IBlog=Interface (ICreativeWork)
(*The postings that are part of this blog.*)
  function Get_blogPosts:IBlogPosting;
  procedure Set_blogPosts(v:IBlogPosting);
// properties
  property blogPosts:IBlogPosting read Get_blogPosts write Set_blogPosts;
end;
(*** end IBlog ***)


(* CookAction
The act of producing/preparing food.
*)
ICookAction=Interface (ICreateAction)
(*A sub property of instrument. The recipe/instructions used to perform the 
action.*)
  function Get_recipe:IRecipe;
  procedure Set_recipe(v:IRecipe);
(*A sub property of location. The specific food establishment where the action 
occurred.*)
  function Get_foodEstablishment:IFoodEstablishment;
  procedure Set_foodEstablishment(v:IFoodEstablishment);
(*A sub property of location. The specific food event where the action 
occurred.*)
  function Get_foodEvent:IFoodEvent;
  procedure Set_foodEvent(v:IFoodEvent);
// properties
  property recipe:IRecipe read Get_recipe write Set_recipe;
  property foodEstablishment:IFoodEstablishment read Get_foodEstablishment write Set_foodEstablishment;
  property foodEvent:IFoodEvent read Get_foodEvent write Set_foodEvent;
end;
(*** end ICookAction ***)


(* PathologyTest
A medical test performed by a laboratory that typically involves examination of 
a tissue sample by a pathologist.
*)
IPathologyTest=Interface (IMedicalTest)
(*The type of tissue sample required for the test.*)
  function Get_tissueSample:String;
  procedure Set_tissueSample(v:String);
// properties
  property tissueSample:String read Get_tissueSample write Set_tissueSample;
end;
(*** end IPathologyTest ***)


(* ReservationPackage
A group of multiple reservations with common values for all sub-reservations.
*)
IReservationPackage=Interface (IReservation)
(*The individual reservations included in the package. Typically a repeated 
property.*)
  function Get_subReservation:IReservation;
  procedure Set_subReservation(v:IReservation);
// properties
  property subReservation:IReservation read Get_subReservation write Set_subReservation;
end;
(*** end IReservationPackage ***)


(* UserComments
*)
IUserComments=Interface (IUserInteraction)
(*The creator/author of this CreativeWork. This is the same as the Author 
property for CreativeWork.*)
  function Get_creator:IPerson;
  procedure Set_creator(v:IPerson);
(*Specifies the CreativeWork associated with the UserComment.*)
  function Get_discusses:ICreativeWork;
  procedure Set_discusses(v:ICreativeWork);
(*The text of the UserComment.*)
  function Get_commentText:String;
  procedure Set_commentText(v:String);
(*The URL at which a reply may be posted to the specified UserComment.*)
  function Get_replyToUrl:String;
  procedure Set_replyToUrl(v:String);
(*The time at which the UserComment was made.*)
  function Get_commentTime:TDateTime;
  procedure Set_commentTime(v:TDateTime);
// properties
  property creator:IPerson read Get_creator write Set_creator;
  property discusses:ICreativeWork read Get_discusses write Set_discusses;
  property commentText:String read Get_commentText write Set_commentText;
  property replyToUrl:String read Get_replyToUrl write Set_replyToUrl;
  property commentTime:TDateTime read Get_commentTime write Set_commentTime;
end;
(*** end IUserComments ***)

IBusStation=interface; //forward


(* BusTrip
A trip on a commercial bus line.
*)
IBusTrip=Interface (IIntangible)
(*The stop or station from which the bus arrives.*)
  function Get_arrivalBusStop:IBusStation;
  procedure Set_arrivalBusStop(v:IBusStation);
(*The name of the bus (e.g. Bolt Express).*)
  function Get_busName:String;
  procedure Set_busName(v:String);
(*The unique identifier for the bus.*)
  function Get_busNumber:String;
  procedure Set_busNumber(v:String);
(*The stop or station from which the bus departs.*)
  function Get_departureBusStop:IBusStop;
  procedure Set_departureBusStop(v:IBusStop);
// properties
  property arrivalBusStop:IBusStation read Get_arrivalBusStop write Set_arrivalBusStop;
  property busName:String read Get_busName write Set_busName;
  property busNumber:String read Get_busNumber write Set_busNumber;
  property departureBusStop:IBusStop read Get_departureBusStop write Set_departureBusStop;
end;
(*** end IBusTrip ***)


(* BusStation
A bus station.
*)
IBusStation=Interface (ICivicStructure)
 (*No atribs*)
end;
(*** end IBusStation ***)


(* GenderType
An enumeration of genders.
*)
IGenderType=Interface (IEnumeration)
  function TangGenderType:TangibleValue;
end;
(*** end IGenderType ***)


(* DataType
The basic data types such as Integers, Strings, etc.
*)
IDataType=Interface
 (*No atribs*)
end;
(*** end IDataType ***)


(* AuthorizeAction
The act of granting permission to an object.
*)
IAuthorizeAction=Interface (IAllocateAction)
 (*No atribs*)
end;
(*** end IAuthorizeAction ***)


(* TVClip
A short TV program or a segment/part of a TV program.
*)
ITVClip=Interface (IClip)
 (*No atribs*)
end;
(*** end ITVClip ***)


(* AskAction
*)
IAskAction=Interface (ICommunicateAction)
(*A sub property of object. A question.*)
  function Get_question:IQuestion;
  procedure Set_question(v:IQuestion);
// properties
  property question:IQuestion read Get_question write Set_question;
end;
(*** end IAskAction ***)


(* PayAction
An agent pays a price to a participant.
*)
IPayAction=Interface (ITradeAction)
(*A sub property of participant. The participant who is at the receiving end of 
the action.*)
  function Get_recipient:IPerson;
  procedure Set_recipient(v:IPerson);
// properties
  property recipient:IPerson read Get_recipient write Set_recipient;
end;
(*** end IPayAction ***)


(* VideoGameSeries
A video game series.
*)
IVideoGameSeries=Interface (ICreativeWorkSeries)
(*Indicate how many people can play this game (minimum, maximum, or range).*)
  function Get_numberOfPlayers:IQuantitativeValue;
  procedure Set_numberOfPlayers(v:IQuantitativeValue);
(*Real or fictional location of the game (or part of game).*)
  function Get_gameLocation:String;
  procedure Set_gameLocation(v:String);
(*An actor, e.g. in tv, radio, movie, video games etc. Actors can be associated 
with individual items or with a series, episode, clip.*)
  function Get_actors:IPerson;
  procedure Set_actors(v:IPerson);
(*The task that a player-controlled character, or group of characters may 
complete in order to gain a reward.*)
  function Get_quest:IThing;
  procedure Set_quest(v:IThing);
(*The number of seasons in this series.*)
  function Get_numberOfSeasons:Integer;
  procedure Set_numberOfSeasons(v:Integer);
(**)
  function Get_gamePlatform:String;
  procedure Set_gamePlatform(v:String);
(*An item is an object within the game world that can be collected by a player 
or, occasionally, a non-player character.*)
  function Get_gameItem:IThing;
  procedure Set_gameItem(v:IThing);
(*The number of episodes in this season or series.*)
  function Get_numberOfEpisodes:Integer;
  procedure Set_numberOfEpisodes(v:Integer);
(*Indicates whether this game is multi-player, co-op or single-player.  The 
game can be marked as multi-player, co-op and single-player at the same time.*)
  function Get_playMode:IGamePlayMode;
  procedure Set_playMode(v:IGamePlayMode);
// properties
  property numberOfPlayers:IQuantitativeValue read Get_numberOfPlayers write Set_numberOfPlayers;
  property gameLocation:String read Get_gameLocation write Set_gameLocation;
  property actors:IPerson read Get_actors write Set_actors;
  property quest:IThing read Get_quest write Set_quest;
  property numberOfSeasons:Integer read Get_numberOfSeasons write Set_numberOfSeasons;
  property gamePlatform:String read Get_gamePlatform write Set_gamePlatform;
  property gameItem:IThing read Get_gameItem write Set_gameItem;
  property numberOfEpisodes:Integer read Get_numberOfEpisodes write Set_numberOfEpisodes;
  property playMode:IGamePlayMode read Get_playMode write Set_playMode;
end;
(*** end IVideoGameSeries ***)


(* VideoGame
A video game is an electronic game that involves human interaction with a user 
interface to generate visual feedback on a video device.
*)
IVideoGame=Interface (IGame)
(*Cheat codes to the game.*)
  function Get_cheatCode:ICreativeWork;
  procedure Set_cheatCode(v:ICreativeWork);
(*Links to tips, tactics, etc.*)
  function Get_gameTip:ICreativeWork;
  procedure Set_gameTip(v:ICreativeWork);
(*The server on which  it is possible to play the game.*)
  function Get_gameServer:IGameServer;
  procedure Set_gameServer(v:IGameServer);
// properties
  property cheatCode:ICreativeWork read Get_cheatCode write Set_cheatCode;
  property gameTip:ICreativeWork read Get_gameTip write Set_gameTip;
  property gameServer:IGameServer read Get_gameServer write Set_gameServer;
end;
(*** end IVideoGame ***)


(* MovieTheater
A movie theater.
*)
IMovieTheater=Interface (IEntertainmentBusiness)
(*The number of screens in the movie theater.*)
  function Get_screenCount:INumber;
  procedure Set_screenCount(v:INumber);
// properties
  property screenCount:INumber read Get_screenCount write Set_screenCount;
end;
(*** end IMovieTheater ***)


(* TaxiService
A service for a vehicle for hire with a driver for local travel. Fares are 
usually calculated based on distance traveled.
*)
ITaxiService=Interface (IService)
  function TangTaxiService:TangibleValue;
end;
(*** end ITaxiService ***)


(* LodgingReservation
*)
ILodgingReservation=Interface (IReservation)
(*The number of children staying in the unit.*)
  function Get_numChildren:IQuantitativeValue;
  procedure Set_numChildren(v:IQuantitativeValue);
(*The number of adults staying in the unit.*)
  function Get_numAdults:Integer;
  procedure Set_numAdults(v:Integer);
(*A full description of the lodging unit.*)
  function Get_lodgingUnitDescription:String;
  procedure Set_lodgingUnitDescription(v:String);
(*Textual description of the unit type (including suite vs. room, size of bed, 
etc.).*)
  function Get_lodgingUnitType:String;
  procedure Set_lodgingUnitType(v:String);
// properties
  property numChildren:IQuantitativeValue read Get_numChildren write Set_numChildren;
  property numAdults:Integer read Get_numAdults write Set_numAdults;
  property lodgingUnitDescription:String read Get_lodgingUnitDescription write Set_lodgingUnitDescription;
  property lodgingUnitType:String read Get_lodgingUnitType write Set_lodgingUnitType;
end;
(*** end ILodgingReservation ***)


(* CommentAction
The act of generating a comment about a subject.
*)
ICommentAction=Interface (ICommunicateAction)
(*A sub property of result. The Comment created or sent as a result of this 
action.*)
  function Get_resultComment:IComment;
  procedure Set_resultComment(v:IComment);
// properties
  property resultComment:IComment read Get_resultComment write Set_resultComment;
end;
(*** end ICommentAction ***)


(* DrugLegalStatus
The legal availability status of a medical drug.
*)
IDrugLegalStatus=Interface (IMedicalIntangible)
 (*No atribs*)
end;
(*** end IDrugLegalStatus ***)


(* SuperficialAnatomy
Anatomical features that can be observed by sight (without dissection), 
including the form and proportions of the human body as well as surface 
landmarks that correspond to deeper subcutaneous structures. Superficial 
anatomy plays an important role in sports medicine, phlebotomy, and other 
medical specialties as underlying anatomical structures can be identified 
through surface palpation. For example, during back surgery, superficial 
anatomy can be used to palpate and count vertebrae to find the site of 
incision. Or in phlebotomy, superficial anatomy can be used to locate an 
underlying vein; for example, the median cubital vein can be located by 
palpating the borders of the cubital fossa (such as the epicondyles of the 
humerus) and then looking for the superficial signs of the vein, such as size, 
prominence, ability to refill after depression, and feel of surrounding tissue 
support. As another example, in a subluxation (dislocation) of the glenohumeral 
joint, the bony structure becomes pronounced with the deltoid muscle failing to 
cover the glenohumeral joint allowing the edges of the scapula to be 
superficially visible. Here, the superficial anatomy is the visible edges of 
the scapula, implying the underlying dislocation of the joint (the related 
anatomical structure).
*)
ISuperficialAnatomy=Interface (IMedicalEntity)
(*The significance associated with the superficial anatomy; as an example, how 
characteristics of the superficial anatomy can suggest underlying medical 
conditions or courses of treatment.*)
  function Get_significance:String;
  procedure Set_significance(v:String);
(*Anatomical systems or structures that relate to the superficial anatomy.*)
  function Get_relatedAnatomy:IAnatomicalSystem;
  procedure Set_relatedAnatomy(v:IAnatomicalSystem);
// properties
  property significance:String read Get_significance write Set_significance;
  property relatedAnatomy:IAnatomicalSystem read Get_relatedAnatomy write Set_relatedAnatomy;
end;
(*** end ISuperficialAnatomy ***)


(* ComicIssue
Individual comic issues are serially published as
    part of a larger series. 
For the sake of consistency, even one-shot issues
    belong to a series 
comprised of a single issue. All comic issues can be
    uniquely identified 
by: the combination of the name and volume number of the
    series to which 
the issue belongs; the issue number; and the variant
    description of the 
issue (if any).
*)
IComicIssue=Interface (IPublicationIssue)
(*The individual who draws the primary narrative artwork.*)
  function Get_penciler:IPerson;
  procedure Set_penciler(v:IPerson);
(*The individual who traces over the pencil drawings in ink after pencils are 
complete.*)
  function Get_inker:IPerson;
  procedure Set_inker(v:IPerson);
(*A description of the variant cover
    for the issue, if the issue is a 
variant printing. For example, "Bryan Hitch
    Variant Cover" or "2nd Printing 
Variant".*)
  function Get_variantCover:String;
  procedure Set_variantCover(v:String);
// properties
  property penciler:IPerson read Get_penciler write Set_penciler;
  property inker:IPerson read Get_inker write Set_inker;
  property variantCover:String read Get_variantCover write Set_variantCover;
end;
(*** end IComicIssue ***)



// AbstractList



// Components


TAction=Class; //forward

TCreativeWork=Class; //forward


(*Thing*)
TThing=Class  (TBaseSchema,IThing)
private
  FsameAs:String;
  FadditionalType:String;
  FdisambiguatingDescription:String;
  FpotentialAction:IAction;
  Furl:String;
  FalternateName:String;
  Fname:String;
  FmainEntityOfPage:ICreativeWork;
protected
  function Get_sameAs:String;virtual;
  procedure Set_sameAs(v:String);virtual;
  function Get_additionalType:String;virtual;
  procedure Set_additionalType(v:String);virtual;
  function Get_disambiguatingDescription:String;virtual;
  procedure Set_disambiguatingDescription(v:String);virtual;
  function Get_potentialAction:IAction;virtual;
  procedure Set_potentialAction(v:IAction);virtual;
  function Get_url:String;virtual;
  procedure Set_url(v:String);virtual;
  function Get_alternateName:String;virtual;
  procedure Set_alternateName(v:String);virtual;
  function Get_name:String;virtual;
  procedure Set_name(v:String);virtual;
  function Get_mainEntityOfPage:ICreativeWork;virtual;
  procedure Set_mainEntityOfPage(v:ICreativeWork);virtual;
public
  property potentialAction:IAction read Get_potentialAction write Set_potentialAction;
  property mainEntityOfPage:ICreativeWork read Get_mainEntityOfPage write Set_mainEntityOfPage;
published
  property sameAs:String read Get_sameAs write Set_sameAs;
  property additionalType:String read Get_additionalType write Set_additionalType;
  property disambiguatingDescription:String read Get_disambiguatingDescription write Set_disambiguatingDescription;
  property url:String read Get_url write Set_url;
  property alternateName:String read Get_alternateName write Set_alternateName;
  property name:String read Get_name write Set_name;
end;

TEntryPoint=Class; //forward

TActionStatusType=Class; //forward

TOrganization=Class; //forward


(*Action*)
TAction=Class  (TThing,IAction)
private
  Ftarget:IEntryPoint;
  FactionStatus:IActionStatusType;
  Fagent:IOrganization;
  Ferror:IThing;
protected
  function Get_target:IEntryPoint;virtual;
  procedure Set_target(v:IEntryPoint);virtual;
  function Get_actionStatus:IActionStatusType;virtual;
  procedure Set_actionStatus(v:IActionStatusType);virtual;
  function Get_agent:IOrganization;virtual;
  procedure Set_agent(v:IOrganization);virtual;
  function Get_error:IThing;virtual;
  procedure Set_error(v:IThing);virtual;
public
  property target:IEntryPoint read Get_target write Set_target;
  property actionStatus:IActionStatusType read Get_actionStatus write Set_actionStatus;
  property agent:IOrganization read Get_agent write Set_agent;
  property error:IThing read Get_error write Set_error;
published
end;


(*Intangible*)
TIntangible=Class  (TThing,IIntangible)
  function TangIntangible:TangibleValue;virtual;
end;

TSoftwareApplication=Class; //forward


(*EntryPoint*)
TEntryPoint=Class  (TIntangible,IEntryPoint)
private
  Fapplication:ISoftwareApplication;
  FactionPlatform:String;
  FhttpMethod:String;
  FencodingType:String;
  FurlTemplate:String;
  FcontentType:String;
protected
  function Get_application:ISoftwareApplication;virtual;
  procedure Set_application(v:ISoftwareApplication);virtual;
  function Get_actionPlatform:String;virtual;
  procedure Set_actionPlatform(v:String);virtual;
  function Get_httpMethod:String;virtual;
  procedure Set_httpMethod(v:String);virtual;
  function Get_encodingType:String;virtual;
  procedure Set_encodingType(v:String);virtual;
  function Get_urlTemplate:String;virtual;
  procedure Set_urlTemplate(v:String);virtual;
  function Get_contentType:String;virtual;
  procedure Set_contentType(v:String);virtual;
public
  property application:ISoftwareApplication read Get_application write Set_application;
published
  property actionPlatform:String read Get_actionPlatform write Set_actionPlatform;
  property httpMethod:String read Get_httpMethod write Set_httpMethod;
  property encodingType:String read Get_encodingType write Set_encodingType;
  property urlTemplate:String read Get_urlTemplate write Set_urlTemplate;
  property contentType:String read Get_contentType write Set_contentType;
end;

TReview=Class; //forward

TPerson=Class; //forward

TMediaObject=Class; //forward

TPlace=Class; //forward

TVideoObject=Class; //forward

TPublicationEvent=Class; //forward

TProduct=Class; //forward

TNumber=Class; //forward

TDuration=Class; //forward

TAudioObject=Class; //forward

TAlignmentObject=Class; //forward


(*CreativeWork*)
TCreativeWork=Class  (TThing,ICreativeWork)
private
  FcommentCount:Integer;
  Freviews:IReview;
  Fheadline:String;
  Feditor:IPerson;
  FassociatedMedia:IMediaObject;
  FthumbnailUrl:String;
  Fmentions:IThing;
  FcontentRating:String;
  FaccessibilityHazard:String;
  FaccessibilityAPI:String;
  FlocationCreated:IPlace;
  FalternativeHeadline:String;
  Fawards:String;
  Fencodings:IMediaObject;
  Fproducer:IPerson;
  FaccessibilityFeature:String;
  Fvideo:IVideoObject;
  FreleasedEvent:IPublicationEvent;
  FeducationalUse:String;
  FisBasedOnUrl:IProduct;
  FcopyrightHolder:IOrganization;
  FdiscussionUrl:String;
  FpublisherImprint:IOrganization;
  FfileFormat:String;
  Ftext:String;
  Fpublication:IPublicationEvent;
  Flicense:String;
  FaccessModeSufficient:String;
  Fkeywords:String;
  FcontentReferenceTime:TDateTime;
  FaccessibilitySummary:String;
  Fversion:INumber;
  FdatePublished:TDateTime;
  FtimeRequired:IDuration;
  Faudio:IAudioObject;
  FisFamilyFriendly:Boolean;
  FinteractivityType:String;
  FeducationalAlignment:IAlignmentObject;
  FpublishingPrinciples:String;
  FaccessibilityControl:String;
  FaccountablePerson:IPerson;
  FaccessMode:String;
  Fabout:IThing;
  FsourceOrganization:IOrganization;
  Fcitation:ICreativeWork;
  FschemaVersion:String;
  FcopyrightYear:INumber;
  Fpublisher:IPerson;
  FlearningResourceType:String;
  Fcharacter:IPerson;
  FexampleOfWork:ICreativeWork;
  FworkTranslation:ICreativeWork;
  FcontentLocation:IPlace;
protected
  function Get_commentCount:Integer;virtual;
  procedure Set_commentCount(v:Integer);virtual;
  function Get_reviews:IReview;virtual;
  procedure Set_reviews(v:IReview);virtual;
  function Get_headline:String;virtual;
  procedure Set_headline(v:String);virtual;
  function Get_editor:IPerson;virtual;
  procedure Set_editor(v:IPerson);virtual;
  function Get_associatedMedia:IMediaObject;virtual;
  procedure Set_associatedMedia(v:IMediaObject);virtual;
  function Get_thumbnailUrl:String;virtual;
  procedure Set_thumbnailUrl(v:String);virtual;
  function Get_mentions:IThing;virtual;
  procedure Set_mentions(v:IThing);virtual;
  function Get_contentRating:String;virtual;
  procedure Set_contentRating(v:String);virtual;
  function Get_accessibilityHazard:String;virtual;
  procedure Set_accessibilityHazard(v:String);virtual;
  function Get_accessibilityAPI:String;virtual;
  procedure Set_accessibilityAPI(v:String);virtual;
  function Get_locationCreated:IPlace;virtual;
  procedure Set_locationCreated(v:IPlace);virtual;
  function Get_alternativeHeadline:String;virtual;
  procedure Set_alternativeHeadline(v:String);virtual;
  function Get_awards:String;virtual;
  procedure Set_awards(v:String);virtual;
  function Get_encodings:IMediaObject;virtual;
  procedure Set_encodings(v:IMediaObject);virtual;
  function Get_producer:IPerson;virtual;
  procedure Set_producer(v:IPerson);virtual;
  function Get_accessibilityFeature:String;virtual;
  procedure Set_accessibilityFeature(v:String);virtual;
  function Get_video:IVideoObject;virtual;
  procedure Set_video(v:IVideoObject);virtual;
  function Get_releasedEvent:IPublicationEvent;virtual;
  procedure Set_releasedEvent(v:IPublicationEvent);virtual;
  function Get_educationalUse:String;virtual;
  procedure Set_educationalUse(v:String);virtual;
  function Get_isBasedOnUrl:IProduct;virtual;
  procedure Set_isBasedOnUrl(v:IProduct);virtual;
  function Get_copyrightHolder:IOrganization;virtual;
  procedure Set_copyrightHolder(v:IOrganization);virtual;
  function Get_discussionUrl:String;virtual;
  procedure Set_discussionUrl(v:String);virtual;
  function Get_publisherImprint:IOrganization;virtual;
  procedure Set_publisherImprint(v:IOrganization);virtual;
  function Get_fileFormat:String;virtual;
  procedure Set_fileFormat(v:String);virtual;
  function Get_text:String;virtual;
  procedure Set_text(v:String);virtual;
  function Get_publication:IPublicationEvent;virtual;
  procedure Set_publication(v:IPublicationEvent);virtual;
  function Get_license:String;virtual;
  procedure Set_license(v:String);virtual;
  function Get_accessModeSufficient:String;virtual;
  procedure Set_accessModeSufficient(v:String);virtual;
  function Get_keywords:String;virtual;
  procedure Set_keywords(v:String);virtual;
  function Get_contentReferenceTime:TDateTime;virtual;
  procedure Set_contentReferenceTime(v:TDateTime);virtual;
  function Get_accessibilitySummary:String;virtual;
  procedure Set_accessibilitySummary(v:String);virtual;
  function Get_version:INumber;virtual;
  procedure Set_version(v:INumber);virtual;
  function Get_datePublished:TDateTime;virtual;
  procedure Set_datePublished(v:TDateTime);virtual;
  function Get_timeRequired:IDuration;virtual;
  procedure Set_timeRequired(v:IDuration);virtual;
  function Get_audio:IAudioObject;virtual;
  procedure Set_audio(v:IAudioObject);virtual;
  function Get_isFamilyFriendly:Boolean;virtual;
  procedure Set_isFamilyFriendly(v:Boolean);virtual;
  function Get_interactivityType:String;virtual;
  procedure Set_interactivityType(v:String);virtual;
  function Get_educationalAlignment:IAlignmentObject;virtual;
  procedure Set_educationalAlignment(v:IAlignmentObject);virtual;
  function Get_publishingPrinciples:String;virtual;
  procedure Set_publishingPrinciples(v:String);virtual;
  function Get_accessibilityControl:String;virtual;
  procedure Set_accessibilityControl(v:String);virtual;
  function Get_accountablePerson:IPerson;virtual;
  procedure Set_accountablePerson(v:IPerson);virtual;
  function Get_accessMode:String;virtual;
  procedure Set_accessMode(v:String);virtual;
  function Get_about:IThing;virtual;
  procedure Set_about(v:IThing);virtual;
  function Get_sourceOrganization:IOrganization;virtual;
  procedure Set_sourceOrganization(v:IOrganization);virtual;
  function Get_citation:ICreativeWork;virtual;
  procedure Set_citation(v:ICreativeWork);virtual;
  function Get_schemaVersion:String;virtual;
  procedure Set_schemaVersion(v:String);virtual;
  function Get_copyrightYear:INumber;virtual;
  procedure Set_copyrightYear(v:INumber);virtual;
  function Get_publisher:IPerson;virtual;
  procedure Set_publisher(v:IPerson);virtual;
  function Get_learningResourceType:String;virtual;
  procedure Set_learningResourceType(v:String);virtual;
  function Get_character:IPerson;virtual;
  procedure Set_character(v:IPerson);virtual;
  function Get_exampleOfWork:ICreativeWork;virtual;
  procedure Set_exampleOfWork(v:ICreativeWork);virtual;
  function Get_workTranslation:ICreativeWork;virtual;
  procedure Set_workTranslation(v:ICreativeWork);virtual;
  function Get_contentLocation:IPlace;virtual;
  procedure Set_contentLocation(v:IPlace);virtual;
public
  property reviews:IReview read Get_reviews write Set_reviews;
  property editor:IPerson read Get_editor write Set_editor;
  property associatedMedia:IMediaObject read Get_associatedMedia write Set_associatedMedia;
  property mentions:IThing read Get_mentions write Set_mentions;
  property locationCreated:IPlace read Get_locationCreated write Set_locationCreated;
  property encodings:IMediaObject read Get_encodings write Set_encodings;
  property producer:IPerson read Get_producer write Set_producer;
  property video:IVideoObject read Get_video write Set_video;
  property releasedEvent:IPublicationEvent read Get_releasedEvent write Set_releasedEvent;
  property isBasedOnUrl:IProduct read Get_isBasedOnUrl write Set_isBasedOnUrl;
  property copyrightHolder:IOrganization read Get_copyrightHolder write Set_copyrightHolder;
  property publisherImprint:IOrganization read Get_publisherImprint write Set_publisherImprint;
  property publication:IPublicationEvent read Get_publication write Set_publication;
  property version:INumber read Get_version write Set_version;
  property timeRequired:IDuration read Get_timeRequired write Set_timeRequired;
  property audio:IAudioObject read Get_audio write Set_audio;
  property educationalAlignment:IAlignmentObject read Get_educationalAlignment write Set_educationalAlignment;
  property accountablePerson:IPerson read Get_accountablePerson write Set_accountablePerson;
  property about:IThing read Get_about write Set_about;
  property sourceOrganization:IOrganization read Get_sourceOrganization write Set_sourceOrganization;
  property citation:ICreativeWork read Get_citation write Set_citation;
  property copyrightYear:INumber read Get_copyrightYear write Set_copyrightYear;
  property publisher:IPerson read Get_publisher write Set_publisher;
  property character:IPerson read Get_character write Set_character;
  property exampleOfWork:ICreativeWork read Get_exampleOfWork write Set_exampleOfWork;
  property workTranslation:ICreativeWork read Get_workTranslation write Set_workTranslation;
  property contentLocation:IPlace read Get_contentLocation write Set_contentLocation;
published
  property commentCount:Integer read Get_commentCount write Set_commentCount;
  property headline:String read Get_headline write Set_headline;
  property thumbnailUrl:String read Get_thumbnailUrl write Set_thumbnailUrl;
  property contentRating:String read Get_contentRating write Set_contentRating;
  property accessibilityHazard:String read Get_accessibilityHazard write Set_accessibilityHazard;
  property accessibilityAPI:String read Get_accessibilityAPI write Set_accessibilityAPI;
  property alternativeHeadline:String read Get_alternativeHeadline write Set_alternativeHeadline;
  property awards:String read Get_awards write Set_awards;
  property accessibilityFeature:String read Get_accessibilityFeature write Set_accessibilityFeature;
  property educationalUse:String read Get_educationalUse write Set_educationalUse;
  property discussionUrl:String read Get_discussionUrl write Set_discussionUrl;
  property fileFormat:String read Get_fileFormat write Set_fileFormat;
  property text:String read Get_text write Set_text;
  property license:String read Get_license write Set_license;
  property accessModeSufficient:String read Get_accessModeSufficient write Set_accessModeSufficient;
  property keywords:String read Get_keywords write Set_keywords;
  property contentReferenceTime:TDateTime read Get_contentReferenceTime write Set_contentReferenceTime;
  property accessibilitySummary:String read Get_accessibilitySummary write Set_accessibilitySummary;
  property datePublished:TDateTime read Get_datePublished write Set_datePublished;
  property isFamilyFriendly:Boolean read Get_isFamilyFriendly write Set_isFamilyFriendly;
  property interactivityType:String read Get_interactivityType write Set_interactivityType;
  property publishingPrinciples:String read Get_publishingPrinciples write Set_publishingPrinciples;
  property accessibilityControl:String read Get_accessibilityControl write Set_accessibilityControl;
  property accessMode:String read Get_accessMode write Set_accessMode;
  property schemaVersion:String read Get_schemaVersion write Set_schemaVersion;
  property learningResourceType:String read Get_learningResourceType write Set_learningResourceType;
end;

TRating=Class; //forward


(*Review*)
TReview=Class  (TCreativeWork,IReview)
private
  FreviewRating:IRating;
  FitemReviewed:IThing;
  FreviewBody:String;
protected
  function Get_reviewRating:IRating;virtual;
  procedure Set_reviewRating(v:IRating);virtual;
  function Get_itemReviewed:IThing;virtual;
  procedure Set_itemReviewed(v:IThing);virtual;
  function Get_reviewBody:String;virtual;
  procedure Set_reviewBody(v:String);virtual;
public
  property reviewRating:IRating read Get_reviewRating write Set_reviewRating;
  property itemReviewed:IThing read Get_itemReviewed write Set_itemReviewed;
published
  property reviewBody:String read Get_reviewBody write Set_reviewBody;
end;


(*Rating*)
TRating=Class  (TIntangible,IRating)
private
  Fauthor:IPerson;
  FratingValue:String;
  FworstRating:String;
  FbestRating:INumber;
protected
  function Get_author:IPerson;virtual;
  procedure Set_author(v:IPerson);virtual;
  function Get_ratingValue:String;virtual;
  procedure Set_ratingValue(v:String);virtual;
  function Get_worstRating:String;virtual;
  procedure Set_worstRating(v:String);virtual;
  function Get_bestRating:INumber;virtual;
  procedure Set_bestRating(v:INumber);virtual;
public
  property author:IPerson read Get_author write Set_author;
  property bestRating:INumber read Get_bestRating write Set_bestRating;
published
  property ratingValue:String read Get_ratingValue write Set_ratingValue;
  property worstRating:String read Get_worstRating write Set_worstRating;
end;

TContactPoint=Class; //forward

TPriceSpecification=Class; //forward

TCountry=Class; //forward

TEvent=Class; //forward

TEducationalOrganization=Class; //forward


(*Person*)
TPerson=Class  (TThing,IPerson)
private
  FvatID:String;
  Fnaics:String;
  FworkLocation:IContactPoint;
  FgivenName:String;
  FbirthPlace:IPlace;
  FdeathDate:TDateTime;
  FrelatedTo:IPerson;
  FhonorificSuffix:String;
  FisicV4:String;
  FdeathPlace:IPlace;
  Fcolleagues:IPerson;
  FworksFor:IOrganization;
  FadditionalName:String;
  Ffollows:IPerson;
  Fspouse:IPerson;
  Fknows:IPerson;
  FbirthDate:TDateTime;
  Fgender:String;
  Fsiblings:IPerson;
  Fchildren:IPerson;
  Ffunder:IPerson;
  Faffiliation:IOrganization;
  FhonorificPrefix:String;
  FnetWorth:IPriceSpecification;
  FfamilyName:String;
  Fparents:IPerson;
  FhomeLocation:IPlace;
  Fnationality:ICountry;
  FjobTitle:String;
  FperformerIn:IEvent;
  FalumniOf:IEducationalOrganization;
protected
  function Get_vatID:String;virtual;
  procedure Set_vatID(v:String);virtual;
  function Get_naics:String;virtual;
  procedure Set_naics(v:String);virtual;
  function Get_workLocation:IContactPoint;virtual;
  procedure Set_workLocation(v:IContactPoint);virtual;
  function Get_givenName:String;virtual;
  procedure Set_givenName(v:String);virtual;
  function Get_birthPlace:IPlace;virtual;
  procedure Set_birthPlace(v:IPlace);virtual;
  function Get_deathDate:TDateTime;virtual;
  procedure Set_deathDate(v:TDateTime);virtual;
  function Get_relatedTo:IPerson;virtual;
  procedure Set_relatedTo(v:IPerson);virtual;
  function Get_honorificSuffix:String;virtual;
  procedure Set_honorificSuffix(v:String);virtual;
  function Get_isicV4:String;virtual;
  procedure Set_isicV4(v:String);virtual;
  function Get_deathPlace:IPlace;virtual;
  procedure Set_deathPlace(v:IPlace);virtual;
  function Get_colleagues:IPerson;virtual;
  procedure Set_colleagues(v:IPerson);virtual;
  function Get_worksFor:IOrganization;virtual;
  procedure Set_worksFor(v:IOrganization);virtual;
  function Get_additionalName:String;virtual;
  procedure Set_additionalName(v:String);virtual;
  function Get_follows:IPerson;virtual;
  procedure Set_follows(v:IPerson);virtual;
  function Get_spouse:IPerson;virtual;
  procedure Set_spouse(v:IPerson);virtual;
  function Get_knows:IPerson;virtual;
  procedure Set_knows(v:IPerson);virtual;
  function Get_birthDate:TDateTime;virtual;
  procedure Set_birthDate(v:TDateTime);virtual;
  function Get_gender:String;virtual;
  procedure Set_gender(v:String);virtual;
  function Get_siblings:IPerson;virtual;
  procedure Set_siblings(v:IPerson);virtual;
  function Get_children:IPerson;virtual;
  procedure Set_children(v:IPerson);virtual;
  function Get_funder:IPerson;virtual;
  procedure Set_funder(v:IPerson);virtual;
  function Get_affiliation:IOrganization;virtual;
  procedure Set_affiliation(v:IOrganization);virtual;
  function Get_honorificPrefix:String;virtual;
  procedure Set_honorificPrefix(v:String);virtual;
  function Get_netWorth:IPriceSpecification;virtual;
  procedure Set_netWorth(v:IPriceSpecification);virtual;
  function Get_familyName:String;virtual;
  procedure Set_familyName(v:String);virtual;
  function Get_parents:IPerson;virtual;
  procedure Set_parents(v:IPerson);virtual;
  function Get_homeLocation:IPlace;virtual;
  procedure Set_homeLocation(v:IPlace);virtual;
  function Get_nationality:ICountry;virtual;
  procedure Set_nationality(v:ICountry);virtual;
  function Get_jobTitle:String;virtual;
  procedure Set_jobTitle(v:String);virtual;
  function Get_performerIn:IEvent;virtual;
  procedure Set_performerIn(v:IEvent);virtual;
  function Get_alumniOf:IEducationalOrganization;virtual;
  procedure Set_alumniOf(v:IEducationalOrganization);virtual;
public
  property workLocation:IContactPoint read Get_workLocation write Set_workLocation;
  property birthPlace:IPlace read Get_birthPlace write Set_birthPlace;
  property relatedTo:IPerson read Get_relatedTo write Set_relatedTo;
  property deathPlace:IPlace read Get_deathPlace write Set_deathPlace;
  property colleagues:IPerson read Get_colleagues write Set_colleagues;
  property worksFor:IOrganization read Get_worksFor write Set_worksFor;
  property follows:IPerson read Get_follows write Set_follows;
  property spouse:IPerson read Get_spouse write Set_spouse;
  property knows:IPerson read Get_knows write Set_knows;
  property siblings:IPerson read Get_siblings write Set_siblings;
  property children:IPerson read Get_children write Set_children;
  property funder:IPerson read Get_funder write Set_funder;
  property affiliation:IOrganization read Get_affiliation write Set_affiliation;
  property netWorth:IPriceSpecification read Get_netWorth write Set_netWorth;
  property parents:IPerson read Get_parents write Set_parents;
  property homeLocation:IPlace read Get_homeLocation write Set_homeLocation;
  property nationality:ICountry read Get_nationality write Set_nationality;
  property performerIn:IEvent read Get_performerIn write Set_performerIn;
  property alumniOf:IEducationalOrganization read Get_alumniOf write Set_alumniOf;
published
  property vatID:String read Get_vatID write Set_vatID;
  property naics:String read Get_naics write Set_naics;
  property givenName:String read Get_givenName write Set_givenName;
  property deathDate:TDateTime read Get_deathDate write Set_deathDate;
  property honorificSuffix:String read Get_honorificSuffix write Set_honorificSuffix;
  property isicV4:String read Get_isicV4 write Set_isicV4;
  property additionalName:String read Get_additionalName write Set_additionalName;
  property birthDate:TDateTime read Get_birthDate write Set_birthDate;
  property gender:String read Get_gender write Set_gender;
  property honorificPrefix:String read Get_honorificPrefix write Set_honorificPrefix;
  property familyName:String read Get_familyName write Set_familyName;
  property jobTitle:String read Get_jobTitle write Set_jobTitle;
end;


(*StructuredValue*)
TStructuredValue=Class  (TIntangible,IStructuredValue)
  function TangStructuredValue:TangibleValue;virtual;
end;

TContactPointOption=Class; //forward

TOpeningHoursSpecification=Class; //forward


(*ContactPoint*)
TContactPoint=Class  (TStructuredValue,IContactPoint)
private
  FavailableLanguage:String;
  FcontactType:String;
  FproductSupported:String;
  FcontactOption:IContactPointOption;
  FhoursAvailable:IOpeningHoursSpecification;
protected
  function Get_availableLanguage:String;virtual;
  procedure Set_availableLanguage(v:String);virtual;
  function Get_contactType:String;virtual;
  procedure Set_contactType(v:String);virtual;
  function Get_productSupported:String;virtual;
  procedure Set_productSupported(v:String);virtual;
  function Get_contactOption:IContactPointOption;virtual;
  procedure Set_contactOption(v:IContactPointOption);virtual;
  function Get_hoursAvailable:IOpeningHoursSpecification;virtual;
  procedure Set_hoursAvailable(v:IOpeningHoursSpecification);virtual;
public
  property contactOption:IContactPointOption read Get_contactOption write Set_contactOption;
  property hoursAvailable:IOpeningHoursSpecification read Get_hoursAvailable write Set_hoursAvailable;
published
  property availableLanguage:String read Get_availableLanguage write Set_availableLanguage;
  property contactType:String read Get_contactType write Set_contactType;
  property productSupported:String read Get_productSupported write Set_productSupported;
end;


(*Enumeration*)
TEnumeration=Class  (TIntangible,IEnumeration)
  function TangEnumeration:TangibleValue;virtual;
end;


(*ContactPointOption*)
TContactPointOption=Class  (TEnumeration,IContactPointOption)
  function TangContactPointOption:TangibleValue;virtual;
end;

TDayOfWeek=Class; //forward


(*OpeningHoursSpecification*)
TOpeningHoursSpecification=Class  (TStructuredValue,IOpeningHoursSpecification)
private
  Fopens:TDateTime;
  FdayOfWeek:IDayOfWeek;
  Fcloses:TDateTime;
protected
  function Get_opens:TDateTime;virtual;
  procedure Set_opens(v:TDateTime);virtual;
  function Get_dayOfWeek:IDayOfWeek;virtual;
  procedure Set_dayOfWeek(v:IDayOfWeek);virtual;
  function Get_closes:TDateTime;virtual;
  procedure Set_closes(v:TDateTime);virtual;
public
  property dayOfWeek:IDayOfWeek read Get_dayOfWeek write Set_dayOfWeek;
published
  property opens:TDateTime read Get_opens write Set_opens;
  property closes:TDateTime read Get_closes write Set_closes;
end;


(*DayOfWeek*)
TDayOfWeek=Class  (TEnumeration,IDayOfWeek)
  function TangDayOfWeek:TangibleValue;virtual;
end;

TGeoShape=Class; //forward

TImageObject=Class; //forward


(*Place*)
TPlace=Class  (TThing,IPlace)
private
  Fmap:String;
  Fmaps:String;
  FopeningHoursSpecification:IOpeningHoursSpecification;
  Fgeo:IGeoShape;
  FfaxNumber:String;
  FspecialOpeningHoursSpecification:IOpeningHoursSpecification;
  Ftelephone:String;
  FbranchCode:String;
  FmaximumAttendeeCapacity:Integer;
  Fphotos:IImageObject;
  FsmokingAllowed:Boolean;
  FcontainedIn:IPlace;
  FcontainsPlace:IPlace;
protected
  function Get_map:String;virtual;
  procedure Set_map(v:String);virtual;
  function Get_maps:String;virtual;
  procedure Set_maps(v:String);virtual;
  function Get_openingHoursSpecification:IOpeningHoursSpecification;virtual;
  procedure Set_openingHoursSpecification(v:IOpeningHoursSpecification);virtual;
  function Get_geo:IGeoShape;virtual;
  procedure Set_geo(v:IGeoShape);virtual;
  function Get_faxNumber:String;virtual;
  procedure Set_faxNumber(v:String);virtual;
  function Get_specialOpeningHoursSpecification:IOpeningHoursSpecification;virtual;
  procedure Set_specialOpeningHoursSpecification(v:IOpeningHoursSpecification);virtual;
  function Get_telephone:String;virtual;
  procedure Set_telephone(v:String);virtual;
  function Get_branchCode:String;virtual;
  procedure Set_branchCode(v:String);virtual;
  function Get_maximumAttendeeCapacity:Integer;virtual;
  procedure Set_maximumAttendeeCapacity(v:Integer);virtual;
  function Get_photos:IImageObject;virtual;
  procedure Set_photos(v:IImageObject);virtual;
  function Get_smokingAllowed:Boolean;virtual;
  procedure Set_smokingAllowed(v:Boolean);virtual;
  function Get_containedIn:IPlace;virtual;
  procedure Set_containedIn(v:IPlace);virtual;
  function Get_containsPlace:IPlace;virtual;
  procedure Set_containsPlace(v:IPlace);virtual;
public
  property openingHoursSpecification:IOpeningHoursSpecification read Get_openingHoursSpecification write Set_openingHoursSpecification;
  property geo:IGeoShape read Get_geo write Set_geo;
  property specialOpeningHoursSpecification:IOpeningHoursSpecification read Get_specialOpeningHoursSpecification write Set_specialOpeningHoursSpecification;
  property photos:IImageObject read Get_photos write Set_photos;
  property containedIn:IPlace read Get_containedIn write Set_containedIn;
  property containsPlace:IPlace read Get_containsPlace write Set_containsPlace;
published
  property map:String read Get_map write Set_map;
  property maps:String read Get_maps write Set_maps;
  property faxNumber:String read Get_faxNumber write Set_faxNumber;
  property telephone:String read Get_telephone write Set_telephone;
  property branchCode:String read Get_branchCode write Set_branchCode;
  property maximumAttendeeCapacity:Integer read Get_maximumAttendeeCapacity write Set_maximumAttendeeCapacity;
  property smokingAllowed:Boolean read Get_smokingAllowed write Set_smokingAllowed;
end;

TPostalAddress=Class; //forward


(*GeoShape*)
TGeoShape=Class  (TStructuredValue,IGeoShape)
private
  FaddressCountry:ICountry;
  Fpolygon:String;
  Faddress:IPostalAddress;
  Fline:String;
  Fcircle:String;
  Felevation:INumber;
  Fbox:String;
protected
  function Get_addressCountry:ICountry;virtual;
  procedure Set_addressCountry(v:ICountry);virtual;
  function Get_polygon:String;virtual;
  procedure Set_polygon(v:String);virtual;
  function Get_address:IPostalAddress;virtual;
  procedure Set_address(v:IPostalAddress);virtual;
  function Get_line:String;virtual;
  procedure Set_line(v:String);virtual;
  function Get_circle:String;virtual;
  procedure Set_circle(v:String);virtual;
  function Get_elevation:INumber;virtual;
  procedure Set_elevation(v:INumber);virtual;
  function Get_box:String;virtual;
  procedure Set_box(v:String);virtual;
public
  property addressCountry:ICountry read Get_addressCountry write Set_addressCountry;
  property address:IPostalAddress read Get_address write Set_address;
  property elevation:INumber read Get_elevation write Set_elevation;
published
  property polygon:String read Get_polygon write Set_polygon;
  property line:String read Get_line write Set_line;
  property circle:String read Get_circle write Set_circle;
  property box:String read Get_box write Set_box;
end;


(*AdministrativeArea*)
TAdministrativeArea=Class  (TPlace,IAdministrativeArea)
 (*No atribs*)
end;


(*Country*)
TCountry=Class  (TAdministrativeArea,ICountry)
 (*No atribs*)
end;


(*PostalAddress*)
TPostalAddress=Class  (TContactPoint,IPostalAddress)
private
  FaddressRegion:String;
  FstreetAddress:String;
  FpostOfficeBoxNumber:String;
  FaddressLocality:String;
protected
  function Get_addressRegion:String;virtual;
  procedure Set_addressRegion(v:String);virtual;
  function Get_streetAddress:String;virtual;
  procedure Set_streetAddress(v:String);virtual;
  function Get_postOfficeBoxNumber:String;virtual;
  procedure Set_postOfficeBoxNumber(v:String);virtual;
  function Get_addressLocality:String;virtual;
  procedure Set_addressLocality(v:String);virtual;
public
published
  property addressRegion:String read Get_addressRegion write Set_addressRegion;
  property streetAddress:String read Get_streetAddress write Set_streetAddress;
  property postOfficeBoxNumber:String read Get_postOfficeBoxNumber write Set_postOfficeBoxNumber;
  property addressLocality:String read Get_addressLocality write Set_addressLocality;
end;


(*Number*)
TNumber=Class  (TBaseSchema,INumber)
 (*No atribs*)
end;

TNewsArticle=Class; //forward


(*MediaObject*)
TMediaObject=Class  (TCreativeWork,IMediaObject)
private
  FencodingFormat:String;
  Fbitrate:String;
  FregionsAllowed:IPlace;
  Fexpires:TDateTime;
  FrequiresSubscription:Boolean;
  FuploadDate:TDateTime;
  FassociatedArticle:INewsArticle;
  FencodesCreativeWork:ICreativeWork;
  FcontentUrl:String;
  FembedUrl:String;
  FplayerType:String;
  FcontentSize:String;
protected
  function Get_encodingFormat:String;virtual;
  procedure Set_encodingFormat(v:String);virtual;
  function Get_bitrate:String;virtual;
  procedure Set_bitrate(v:String);virtual;
  function Get_regionsAllowed:IPlace;virtual;
  procedure Set_regionsAllowed(v:IPlace);virtual;
  function Get_expires:TDateTime;virtual;
  procedure Set_expires(v:TDateTime);virtual;
  function Get_requiresSubscription:Boolean;virtual;
  procedure Set_requiresSubscription(v:Boolean);virtual;
  function Get_uploadDate:TDateTime;virtual;
  procedure Set_uploadDate(v:TDateTime);virtual;
  function Get_associatedArticle:INewsArticle;virtual;
  procedure Set_associatedArticle(v:INewsArticle);virtual;
  function Get_encodesCreativeWork:ICreativeWork;virtual;
  procedure Set_encodesCreativeWork(v:ICreativeWork);virtual;
  function Get_contentUrl:String;virtual;
  procedure Set_contentUrl(v:String);virtual;
  function Get_embedUrl:String;virtual;
  procedure Set_embedUrl(v:String);virtual;
  function Get_playerType:String;virtual;
  procedure Set_playerType(v:String);virtual;
  function Get_contentSize:String;virtual;
  procedure Set_contentSize(v:String);virtual;
public
  property regionsAllowed:IPlace read Get_regionsAllowed write Set_regionsAllowed;
  property associatedArticle:INewsArticle read Get_associatedArticle write Set_associatedArticle;
  property encodesCreativeWork:ICreativeWork read Get_encodesCreativeWork write Set_encodesCreativeWork;
published
  property encodingFormat:String read Get_encodingFormat write Set_encodingFormat;
  property bitrate:String read Get_bitrate write Set_bitrate;
  property expires:TDateTime read Get_expires write Set_expires;
  property requiresSubscription:Boolean read Get_requiresSubscription write Set_requiresSubscription;
  property uploadDate:TDateTime read Get_uploadDate write Set_uploadDate;
  property contentUrl:String read Get_contentUrl write Set_contentUrl;
  property embedUrl:String read Get_embedUrl write Set_embedUrl;
  property playerType:String read Get_playerType write Set_playerType;
  property contentSize:String read Get_contentSize write Set_contentSize;
end;


(*Article*)
TArticle=Class  (TCreativeWork,IArticle)
private
  FwordCount:Integer;
  FpageEnd:String;
  FarticleSection:String;
  FarticleBody:String;
protected
  function Get_wordCount:Integer;virtual;
  procedure Set_wordCount(v:Integer);virtual;
  function Get_pageEnd:String;virtual;
  procedure Set_pageEnd(v:String);virtual;
  function Get_articleSection:String;virtual;
  procedure Set_articleSection(v:String);virtual;
  function Get_articleBody:String;virtual;
  procedure Set_articleBody(v:String);virtual;
public
published
  property wordCount:Integer read Get_wordCount write Set_wordCount;
  property pageEnd:String read Get_pageEnd write Set_pageEnd;
  property articleSection:String read Get_articleSection write Set_articleSection;
  property articleBody:String read Get_articleBody write Set_articleBody;
end;


(*NewsArticle*)
TNewsArticle=Class  (TArticle,INewsArticle)
private
  FprintEdition:String;
  FprintColumn:String;
  FprintPage:String;
  FprintSection:String;
  Fdateline:String;
protected
  function Get_printEdition:String;virtual;
  procedure Set_printEdition(v:String);virtual;
  function Get_printColumn:String;virtual;
  procedure Set_printColumn(v:String);virtual;
  function Get_printPage:String;virtual;
  procedure Set_printPage(v:String);virtual;
  function Get_printSection:String;virtual;
  procedure Set_printSection(v:String);virtual;
  function Get_dateline:String;virtual;
  procedure Set_dateline(v:String);virtual;
public
published
  property printEdition:String read Get_printEdition write Set_printEdition;
  property printColumn:String read Get_printColumn write Set_printColumn;
  property printPage:String read Get_printPage write Set_printPage;
  property printSection:String read Get_printSection write Set_printSection;
  property dateline:String read Get_dateline write Set_dateline;
end;


(*ImageObject*)
TImageObject=Class  (TMediaObject,IImageObject)
private
  Fcaption:String;
  FexifData:String;
  FrepresentativeOfPage:Boolean;
protected
  function Get_caption:String;virtual;
  procedure Set_caption(v:String);virtual;
  function Get_exifData:String;virtual;
  procedure Set_exifData(v:String);virtual;
  function Get_representativeOfPage:Boolean;virtual;
  procedure Set_representativeOfPage(v:Boolean);virtual;
public
published
  property caption:String read Get_caption write Set_caption;
  property exifData:String read Get_exifData write Set_exifData;
  property representativeOfPage:Boolean read Get_representativeOfPage write Set_representativeOfPage;
end;

TOfferCatalog=Class; //forward

TDemand=Class; //forward

TOffer=Class; //forward


(*Organization*)
TOrganization=Class  (TThing,IOrganization)
private
  Femail:String;
  FhasOfferCatalog:IOfferCatalog;
  FleiCode:String;
  Fowns:IProduct;
  Ffounders:IPerson;
  Fmembers:IOrganization;
  FhasPOS:IPlace;
  FdissolutionDate:TDateTime;
  Flogo:IImageObject;
  FtaxID:String;
  Fbrand:IOrganization;
  FglobalLocationNumber:String;
  Fduns:String;
  FfoundingDate:TDateTime;
  Fevents:IEvent;
  Femployees:IPerson;
  FlegalName:String;
  Fdepartment:IOrganization;
  Fseeks:IDemand;
  FcontactPoints:IContactPoint;
  FfoundingLocation:IPlace;
  FsubOrganization:IOrganization;
  FmakesOffer:IOffer;
protected
  function Get_email:String;virtual;
  procedure Set_email(v:String);virtual;
  function Get_hasOfferCatalog:IOfferCatalog;virtual;
  procedure Set_hasOfferCatalog(v:IOfferCatalog);virtual;
  function Get_leiCode:String;virtual;
  procedure Set_leiCode(v:String);virtual;
  function Get_owns:IProduct;virtual;
  procedure Set_owns(v:IProduct);virtual;
  function Get_founders:IPerson;virtual;
  procedure Set_founders(v:IPerson);virtual;
  function Get_members:IOrganization;virtual;
  procedure Set_members(v:IOrganization);virtual;
  function Get_hasPOS:IPlace;virtual;
  procedure Set_hasPOS(v:IPlace);virtual;
  function Get_dissolutionDate:TDateTime;virtual;
  procedure Set_dissolutionDate(v:TDateTime);virtual;
  function Get_logo:IImageObject;virtual;
  procedure Set_logo(v:IImageObject);virtual;
  function Get_taxID:String;virtual;
  procedure Set_taxID(v:String);virtual;
  function Get_brand:IOrganization;virtual;
  procedure Set_brand(v:IOrganization);virtual;
  function Get_globalLocationNumber:String;virtual;
  procedure Set_globalLocationNumber(v:String);virtual;
  function Get_duns:String;virtual;
  procedure Set_duns(v:String);virtual;
  function Get_foundingDate:TDateTime;virtual;
  procedure Set_foundingDate(v:TDateTime);virtual;
  function Get_events:IEvent;virtual;
  procedure Set_events(v:IEvent);virtual;
  function Get_employees:IPerson;virtual;
  procedure Set_employees(v:IPerson);virtual;
  function Get_legalName:String;virtual;
  procedure Set_legalName(v:String);virtual;
  function Get_department:IOrganization;virtual;
  procedure Set_department(v:IOrganization);virtual;
  function Get_seeks:IDemand;virtual;
  procedure Set_seeks(v:IDemand);virtual;
  function Get_contactPoints:IContactPoint;virtual;
  procedure Set_contactPoints(v:IContactPoint);virtual;
  function Get_foundingLocation:IPlace;virtual;
  procedure Set_foundingLocation(v:IPlace);virtual;
  function Get_subOrganization:IOrganization;virtual;
  procedure Set_subOrganization(v:IOrganization);virtual;
  function Get_makesOffer:IOffer;virtual;
  procedure Set_makesOffer(v:IOffer);virtual;
public
  property hasOfferCatalog:IOfferCatalog read Get_hasOfferCatalog write Set_hasOfferCatalog;
  property owns:IProduct read Get_owns write Set_owns;
  property founders:IPerson read Get_founders write Set_founders;
  property members:IOrganization read Get_members write Set_members;
  property hasPOS:IPlace read Get_hasPOS write Set_hasPOS;
  property logo:IImageObject read Get_logo write Set_logo;
  property brand:IOrganization read Get_brand write Set_brand;
  property events:IEvent read Get_events write Set_events;
  property employees:IPerson read Get_employees write Set_employees;
  property department:IOrganization read Get_department write Set_department;
  property seeks:IDemand read Get_seeks write Set_seeks;
  property contactPoints:IContactPoint read Get_contactPoints write Set_contactPoints;
  property foundingLocation:IPlace read Get_foundingLocation write Set_foundingLocation;
  property subOrganization:IOrganization read Get_subOrganization write Set_subOrganization;
  property makesOffer:IOffer read Get_makesOffer write Set_makesOffer;
published
  property email:String read Get_email write Set_email;
  property leiCode:String read Get_leiCode write Set_leiCode;
  property dissolutionDate:TDateTime read Get_dissolutionDate write Set_dissolutionDate;
  property taxID:String read Get_taxID write Set_taxID;
  property globalLocationNumber:String read Get_globalLocationNumber write Set_globalLocationNumber;
  property duns:String read Get_duns write Set_duns;
  property foundingDate:TDateTime read Get_foundingDate write Set_foundingDate;
  property legalName:String read Get_legalName write Set_legalName;
end;


(*ItemList*)
TItemList=Class  (TIntangible,IItemList)
private
  FnumberOfItems:Integer;
  FitemListOrder:String;
  FitemListElement:IThing;
protected
  function Get_numberOfItems:Integer;virtual;
  procedure Set_numberOfItems(v:Integer);virtual;
  function Get_itemListOrder:String;virtual;
  procedure Set_itemListOrder(v:String);virtual;
  function Get_itemListElement:IThing;virtual;
  procedure Set_itemListElement(v:IThing);virtual;
public
  property itemListElement:IThing read Get_itemListElement write Set_itemListElement;
published
  property numberOfItems:Integer read Get_numberOfItems write Set_numberOfItems;
  property itemListOrder:String read Get_itemListOrder write Set_itemListOrder;
end;


(*OfferCatalog*)
TOfferCatalog=Class  (TItemList,IOfferCatalog)
  function TangOfferCatalog:TangibleValue;virtual;
end;

TProductModel=Class; //forward

TService=Class; //forward

TQuantitativeValue=Class; //forward


(*Product*)
TProduct=Class  (TThing,IProduct)
private
  Fcolor:String;
  FreleaseDate:TDateTime;
  Fmodel:IProductModel;
  Fcategory:IThing;
  FisAccessoryOrSparePartFor:IProduct;
  Fgtin8:String;
  FisSimilarTo:IService;
  Fweight:IQuantitativeValue;
  FisConsumableFor:IProduct;
  Fgtin12:String;
  FproductID:String;
protected
  function Get_color:String;virtual;
  procedure Set_color(v:String);virtual;
  function Get_releaseDate:TDateTime;virtual;
  procedure Set_releaseDate(v:TDateTime);virtual;
  function Get_model:IProductModel;virtual;
  procedure Set_model(v:IProductModel);virtual;
  function Get_category:IThing;virtual;
  procedure Set_category(v:IThing);virtual;
  function Get_isAccessoryOrSparePartFor:IProduct;virtual;
  procedure Set_isAccessoryOrSparePartFor(v:IProduct);virtual;
  function Get_gtin8:String;virtual;
  procedure Set_gtin8(v:String);virtual;
  function Get_isSimilarTo:IService;virtual;
  procedure Set_isSimilarTo(v:IService);virtual;
  function Get_weight:IQuantitativeValue;virtual;
  procedure Set_weight(v:IQuantitativeValue);virtual;
  function Get_isConsumableFor:IProduct;virtual;
  procedure Set_isConsumableFor(v:IProduct);virtual;
  function Get_gtin12:String;virtual;
  procedure Set_gtin12(v:String);virtual;
  function Get_productID:String;virtual;
  procedure Set_productID(v:String);virtual;
public
  property model:IProductModel read Get_model write Set_model;
  property category:IThing read Get_category write Set_category;
  property isAccessoryOrSparePartFor:IProduct read Get_isAccessoryOrSparePartFor write Set_isAccessoryOrSparePartFor;
  property isSimilarTo:IService read Get_isSimilarTo write Set_isSimilarTo;
  property weight:IQuantitativeValue read Get_weight write Set_weight;
  property isConsumableFor:IProduct read Get_isConsumableFor write Set_isConsumableFor;
published
  property color:String read Get_color write Set_color;
  property releaseDate:TDateTime read Get_releaseDate write Set_releaseDate;
  property gtin8:String read Get_gtin8 write Set_gtin8;
  property gtin12:String read Get_gtin12 write Set_gtin12;
  property productID:String read Get_productID write Set_productID;
end;


(*ProductModel*)
TProductModel=Class  (TProduct,IProductModel)
private
  FpredecessorOf:IProductModel;
  FisVariantOf:IProductModel;
  FsuccessorOf:IProductModel;
protected
  function Get_predecessorOf:IProductModel;virtual;
  procedure Set_predecessorOf(v:IProductModel);virtual;
  function Get_isVariantOf:IProductModel;virtual;
  procedure Set_isVariantOf(v:IProductModel);virtual;
  function Get_successorOf:IProductModel;virtual;
  procedure Set_successorOf(v:IProductModel);virtual;
public
  property predecessorOf:IProductModel read Get_predecessorOf write Set_predecessorOf;
  property isVariantOf:IProductModel read Get_isVariantOf write Set_isVariantOf;
  property successorOf:IProductModel read Get_successorOf write Set_successorOf;
published
end;

TAudience=Class; //forward

TServiceChannel=Class; //forward


(*Service*)
TService=Class  (TIntangible,IService)
private
  FisRelatedTo:IService;
  Fproduces:IThing;
  FserviceAudience:IAudience;
  FproviderMobility:String;
  FavailableChannel:IServiceChannel;
  FserviceType:String;
protected
  function Get_isRelatedTo:IService;virtual;
  procedure Set_isRelatedTo(v:IService);virtual;
  function Get_produces:IThing;virtual;
  procedure Set_produces(v:IThing);virtual;
  function Get_serviceAudience:IAudience;virtual;
  procedure Set_serviceAudience(v:IAudience);virtual;
  function Get_providerMobility:String;virtual;
  procedure Set_providerMobility(v:String);virtual;
  function Get_availableChannel:IServiceChannel;virtual;
  procedure Set_availableChannel(v:IServiceChannel);virtual;
  function Get_serviceType:String;virtual;
  procedure Set_serviceType(v:String);virtual;
public
  property isRelatedTo:IService read Get_isRelatedTo write Set_isRelatedTo;
  property produces:IThing read Get_produces write Set_produces;
  property serviceAudience:IAudience read Get_serviceAudience write Set_serviceAudience;
  property availableChannel:IServiceChannel read Get_availableChannel write Set_availableChannel;
published
  property providerMobility:String read Get_providerMobility write Set_providerMobility;
  property serviceType:String read Get_serviceType write Set_serviceType;
end;


(*Audience*)
TAudience=Class  (TIntangible,IAudience)
private
  FaudienceType:String;
  FgeographicArea:IAdministrativeArea;
protected
  function Get_audienceType:String;virtual;
  procedure Set_audienceType(v:String);virtual;
  function Get_geographicArea:IAdministrativeArea;virtual;
  procedure Set_geographicArea(v:IAdministrativeArea);virtual;
public
  property geographicArea:IAdministrativeArea read Get_geographicArea write Set_geographicArea;
published
  property audienceType:String read Get_audienceType write Set_audienceType;
end;


(*ServiceChannel*)
TServiceChannel=Class  (TIntangible,IServiceChannel)
private
  FservicePhone:IContactPoint;
  FserviceLocation:IPlace;
  FserviceSmsNumber:IContactPoint;
  FserviceUrl:String;
  FservicePostalAddress:IPostalAddress;
  FprovidesService:IService;
  FprocessingTime:IDuration;
protected
  function Get_servicePhone:IContactPoint;virtual;
  procedure Set_servicePhone(v:IContactPoint);virtual;
  function Get_serviceLocation:IPlace;virtual;
  procedure Set_serviceLocation(v:IPlace);virtual;
  function Get_serviceSmsNumber:IContactPoint;virtual;
  procedure Set_serviceSmsNumber(v:IContactPoint);virtual;
  function Get_serviceUrl:String;virtual;
  procedure Set_serviceUrl(v:String);virtual;
  function Get_servicePostalAddress:IPostalAddress;virtual;
  procedure Set_servicePostalAddress(v:IPostalAddress);virtual;
  function Get_providesService:IService;virtual;
  procedure Set_providesService(v:IService);virtual;
  function Get_processingTime:IDuration;virtual;
  procedure Set_processingTime(v:IDuration);virtual;
public
  property servicePhone:IContactPoint read Get_servicePhone write Set_servicePhone;
  property serviceLocation:IPlace read Get_serviceLocation write Set_serviceLocation;
  property serviceSmsNumber:IContactPoint read Get_serviceSmsNumber write Set_serviceSmsNumber;
  property servicePostalAddress:IPostalAddress read Get_servicePostalAddress write Set_servicePostalAddress;
  property providesService:IService read Get_providesService write Set_providesService;
  property processingTime:IDuration read Get_processingTime write Set_processingTime;
published
  property serviceUrl:String read Get_serviceUrl write Set_serviceUrl;
end;


(*Quantity*)
TQuantity=Class  (TIntangible,IQuantity)
  function TangQuantity:TangibleValue;virtual;
end;


(*Duration*)
TDuration=Class  (TQuantity,IDuration)
  function TangDuration:TangibleValue;virtual;
end;


(*QuantitativeValue*)
TQuantitativeValue=Class  (TStructuredValue,IQuantitativeValue)
private
  FmaxValue:INumber;
  FvalueReference:IQuantitativeValue;
  FunitText:String;
protected
  function Get_maxValue:INumber;virtual;
  procedure Set_maxValue(v:INumber);virtual;
  function Get_valueReference:IQuantitativeValue;virtual;
  procedure Set_valueReference(v:IQuantitativeValue);virtual;
  function Get_unitText:String;virtual;
  procedure Set_unitText(v:String);virtual;
public
  property maxValue:INumber read Get_maxValue write Set_maxValue;
  property valueReference:IQuantitativeValue read Get_valueReference write Set_valueReference;
published
  property unitText:String read Get_unitText write Set_unitText;
end;

TEventStatusType=Class; //forward


(*Event*)
TEvent=Class  (TThing,IEvent)
private
  FeventStatus:IEventStatusType;
  Fattendees:IOrganization;
  Fcomposer:IOrganization;
  FstartDate:TDateTime;
  FpreviousStartDate:TDateTime;
  Fperformers:IPerson;
  FsubEvents:IEvent;
  Fcontributor:IOrganization;
  Forganizer:IOrganization;
  FtypicalAgeRange:String;
  Foffers:IOffer;
  FremainingAttendeeCapacity:Integer;
  FworkPerformed:ICreativeWork;
  FdoorTime:TDateTime;
  FsuperEvent:IEvent;
  FrecordedIn:ICreativeWork;
protected
  function Get_eventStatus:IEventStatusType;virtual;
  procedure Set_eventStatus(v:IEventStatusType);virtual;
  function Get_attendees:IOrganization;virtual;
  procedure Set_attendees(v:IOrganization);virtual;
  function Get_composer:IOrganization;virtual;
  procedure Set_composer(v:IOrganization);virtual;
  function Get_startDate:TDateTime;virtual;
  procedure Set_startDate(v:TDateTime);virtual;
  function Get_previousStartDate:TDateTime;virtual;
  procedure Set_previousStartDate(v:TDateTime);virtual;
  function Get_performers:IPerson;virtual;
  procedure Set_performers(v:IPerson);virtual;
  function Get_subEvents:IEvent;virtual;
  procedure Set_subEvents(v:IEvent);virtual;
  function Get_contributor:IOrganization;virtual;
  procedure Set_contributor(v:IOrganization);virtual;
  function Get_organizer:IOrganization;virtual;
  procedure Set_organizer(v:IOrganization);virtual;
  function Get_typicalAgeRange:String;virtual;
  procedure Set_typicalAgeRange(v:String);virtual;
  function Get_offers:IOffer;virtual;
  procedure Set_offers(v:IOffer);virtual;
  function Get_remainingAttendeeCapacity:Integer;virtual;
  procedure Set_remainingAttendeeCapacity(v:Integer);virtual;
  function Get_workPerformed:ICreativeWork;virtual;
  procedure Set_workPerformed(v:ICreativeWork);virtual;
  function Get_doorTime:TDateTime;virtual;
  procedure Set_doorTime(v:TDateTime);virtual;
  function Get_superEvent:IEvent;virtual;
  procedure Set_superEvent(v:IEvent);virtual;
  function Get_recordedIn:ICreativeWork;virtual;
  procedure Set_recordedIn(v:ICreativeWork);virtual;
public
  property eventStatus:IEventStatusType read Get_eventStatus write Set_eventStatus;
  property attendees:IOrganization read Get_attendees write Set_attendees;
  property composer:IOrganization read Get_composer write Set_composer;
  property performers:IPerson read Get_performers write Set_performers;
  property subEvents:IEvent read Get_subEvents write Set_subEvents;
  property contributor:IOrganization read Get_contributor write Set_contributor;
  property organizer:IOrganization read Get_organizer write Set_organizer;
  property offers:IOffer read Get_offers write Set_offers;
  property workPerformed:ICreativeWork read Get_workPerformed write Set_workPerformed;
  property superEvent:IEvent read Get_superEvent write Set_superEvent;
  property recordedIn:ICreativeWork read Get_recordedIn write Set_recordedIn;
published
  property startDate:TDateTime read Get_startDate write Set_startDate;
  property previousStartDate:TDateTime read Get_previousStartDate write Set_previousStartDate;
  property typicalAgeRange:String read Get_typicalAgeRange write Set_typicalAgeRange;
  property remainingAttendeeCapacity:Integer read Get_remainingAttendeeCapacity write Set_remainingAttendeeCapacity;
  property doorTime:TDateTime read Get_doorTime write Set_doorTime;
end;


(*EventStatusType*)
TEventStatusType=Class  (TEnumeration,IEventStatusType)
  function TangEventStatusType:TangibleValue;virtual;
end;

TAggregateRating=Class; //forward

TDeliveryMethod=Class; //forward

TPaymentMethod=Class; //forward


(*Offer*)
TOffer=Class  (TIntangible,IOffer)
private
  FaggregateRating:IAggregateRating;
  FavailabilityStarts:TDateTime;
  Fsku:String;
  FitemOffered:IProduct;
  FavailableAtOrFrom:IPlace;
  FaddOn:IOffer;
  FeligibleQuantity:IQuantitativeValue;
  FavailableDeliveryMethod:IDeliveryMethod;
  FdeliveryLeadTime:IQuantitativeValue;
  FacceptedPaymentMethod:IPaymentMethod;
  FadvanceBookingRequirement:IQuantitativeValue;
  FpriceValidUntil:TDateTime;
protected
  function Get_aggregateRating:IAggregateRating;virtual;
  procedure Set_aggregateRating(v:IAggregateRating);virtual;
  function Get_availabilityStarts:TDateTime;virtual;
  procedure Set_availabilityStarts(v:TDateTime);virtual;
  function Get_sku:String;virtual;
  procedure Set_sku(v:String);virtual;
  function Get_itemOffered:IProduct;virtual;
  procedure Set_itemOffered(v:IProduct);virtual;
  function Get_availableAtOrFrom:IPlace;virtual;
  procedure Set_availableAtOrFrom(v:IPlace);virtual;
  function Get_addOn:IOffer;virtual;
  procedure Set_addOn(v:IOffer);virtual;
  function Get_eligibleQuantity:IQuantitativeValue;virtual;
  procedure Set_eligibleQuantity(v:IQuantitativeValue);virtual;
  function Get_availableDeliveryMethod:IDeliveryMethod;virtual;
  procedure Set_availableDeliveryMethod(v:IDeliveryMethod);virtual;
  function Get_deliveryLeadTime:IQuantitativeValue;virtual;
  procedure Set_deliveryLeadTime(v:IQuantitativeValue);virtual;
  function Get_acceptedPaymentMethod:IPaymentMethod;virtual;
  procedure Set_acceptedPaymentMethod(v:IPaymentMethod);virtual;
  function Get_advanceBookingRequirement:IQuantitativeValue;virtual;
  procedure Set_advanceBookingRequirement(v:IQuantitativeValue);virtual;
  function Get_priceValidUntil:TDateTime;virtual;
  procedure Set_priceValidUntil(v:TDateTime);virtual;
public
  property aggregateRating:IAggregateRating read Get_aggregateRating write Set_aggregateRating;
  property itemOffered:IProduct read Get_itemOffered write Set_itemOffered;
  property availableAtOrFrom:IPlace read Get_availableAtOrFrom write Set_availableAtOrFrom;
  property addOn:IOffer read Get_addOn write Set_addOn;
  property eligibleQuantity:IQuantitativeValue read Get_eligibleQuantity write Set_eligibleQuantity;
  property availableDeliveryMethod:IDeliveryMethod read Get_availableDeliveryMethod write Set_availableDeliveryMethod;
  property deliveryLeadTime:IQuantitativeValue read Get_deliveryLeadTime write Set_deliveryLeadTime;
  property acceptedPaymentMethod:IPaymentMethod read Get_acceptedPaymentMethod write Set_acceptedPaymentMethod;
  property advanceBookingRequirement:IQuantitativeValue read Get_advanceBookingRequirement write Set_advanceBookingRequirement;
published
  property availabilityStarts:TDateTime read Get_availabilityStarts write Set_availabilityStarts;
  property sku:String read Get_sku write Set_sku;
  property priceValidUntil:TDateTime read Get_priceValidUntil write Set_priceValidUntil;
end;


(*AggregateRating*)
TAggregateRating=Class  (TRating,IAggregateRating)
private
  FratingCount:Integer;
  FreviewCount:Integer;
protected
  function Get_ratingCount:Integer;virtual;
  procedure Set_ratingCount(v:Integer);virtual;
  function Get_reviewCount:Integer;virtual;
  procedure Set_reviewCount(v:Integer);virtual;
public
published
  property ratingCount:Integer read Get_ratingCount write Set_ratingCount;
  property reviewCount:Integer read Get_reviewCount write Set_reviewCount;
end;


(*DeliveryMethod*)
TDeliveryMethod=Class  (TEnumeration,IDeliveryMethod)
  function TangDeliveryMethod:TangibleValue;virtual;
end;


(*PaymentMethod*)
TPaymentMethod=Class  (TEnumeration,IPaymentMethod)
  function TangPaymentMethod:TangibleValue;virtual;
end;

TOfferItemCondition=Class; //forward

TItemAvailability=Class; //forward

TTypeAndQuantityNode=Class; //forward

TBusinessEntityType=Class; //forward


(*Demand*)
TDemand=Class  (TIntangible,IDemand)
private
  FavailabilityEnds:TDateTime;
  FitemCondition:IOfferItemCondition;
  FeligibleDuration:IQuantitativeValue;
  Fmpn:String;
  Fgtin13:String;
  Fgtin14:String;
  FvalidFrom:TDateTime;
  FineligibleRegion:IPlace;
  Favailability:IItemAvailability;
  FeligibleTransactionVolume:IPriceSpecification;
  FincludesObject:ITypeAndQuantityNode;
  FeligibleCustomerType:IBusinessEntityType;
  FinventoryLevel:IQuantitativeValue;
protected
  function Get_availabilityEnds:TDateTime;virtual;
  procedure Set_availabilityEnds(v:TDateTime);virtual;
  function Get_itemCondition:IOfferItemCondition;virtual;
  procedure Set_itemCondition(v:IOfferItemCondition);virtual;
  function Get_eligibleDuration:IQuantitativeValue;virtual;
  procedure Set_eligibleDuration(v:IQuantitativeValue);virtual;
  function Get_mpn:String;virtual;
  procedure Set_mpn(v:String);virtual;
  function Get_gtin13:String;virtual;
  procedure Set_gtin13(v:String);virtual;
  function Get_gtin14:String;virtual;
  procedure Set_gtin14(v:String);virtual;
  function Get_validFrom:TDateTime;virtual;
  procedure Set_validFrom(v:TDateTime);virtual;
  function Get_ineligibleRegion:IPlace;virtual;
  procedure Set_ineligibleRegion(v:IPlace);virtual;
  function Get_availability:IItemAvailability;virtual;
  procedure Set_availability(v:IItemAvailability);virtual;
  function Get_eligibleTransactionVolume:IPriceSpecification;virtual;
  procedure Set_eligibleTransactionVolume(v:IPriceSpecification);virtual;
  function Get_includesObject:ITypeAndQuantityNode;virtual;
  procedure Set_includesObject(v:ITypeAndQuantityNode);virtual;
  function Get_eligibleCustomerType:IBusinessEntityType;virtual;
  procedure Set_eligibleCustomerType(v:IBusinessEntityType);virtual;
  function Get_inventoryLevel:IQuantitativeValue;virtual;
  procedure Set_inventoryLevel(v:IQuantitativeValue);virtual;
public
  property itemCondition:IOfferItemCondition read Get_itemCondition write Set_itemCondition;
  property eligibleDuration:IQuantitativeValue read Get_eligibleDuration write Set_eligibleDuration;
  property ineligibleRegion:IPlace read Get_ineligibleRegion write Set_ineligibleRegion;
  property availability:IItemAvailability read Get_availability write Set_availability;
  property eligibleTransactionVolume:IPriceSpecification read Get_eligibleTransactionVolume write Set_eligibleTransactionVolume;
  property includesObject:ITypeAndQuantityNode read Get_includesObject write Set_includesObject;
  property eligibleCustomerType:IBusinessEntityType read Get_eligibleCustomerType write Set_eligibleCustomerType;
  property inventoryLevel:IQuantitativeValue read Get_inventoryLevel write Set_inventoryLevel;
published
  property availabilityEnds:TDateTime read Get_availabilityEnds write Set_availabilityEnds;
  property mpn:String read Get_mpn write Set_mpn;
  property gtin13:String read Get_gtin13 write Set_gtin13;
  property gtin14:String read Get_gtin14 write Set_gtin14;
  property validFrom:TDateTime read Get_validFrom write Set_validFrom;
end;


(*OfferItemCondition*)
TOfferItemCondition=Class  (TEnumeration,IOfferItemCondition)
  function TangOfferItemCondition:TangibleValue;virtual;
end;


(*ItemAvailability*)
TItemAvailability=Class  (TEnumeration,IItemAvailability)
  function TangItemAvailability:TangibleValue;virtual;
end;


(*PriceSpecification*)
TPriceSpecification=Class  (TStructuredValue,IPriceSpecification)
private
  FpriceCurrency:String;
  FvalidThrough:TDateTime;
  FvalueAddedTaxIncluded:Boolean;
  FminPrice:INumber;
  FmaxPrice:INumber;
protected
  function Get_priceCurrency:String;virtual;
  procedure Set_priceCurrency(v:String);virtual;
  function Get_validThrough:TDateTime;virtual;
  procedure Set_validThrough(v:TDateTime);virtual;
  function Get_valueAddedTaxIncluded:Boolean;virtual;
  procedure Set_valueAddedTaxIncluded(v:Boolean);virtual;
  function Get_minPrice:INumber;virtual;
  procedure Set_minPrice(v:INumber);virtual;
  function Get_maxPrice:INumber;virtual;
  procedure Set_maxPrice(v:INumber);virtual;
public
  property minPrice:INumber read Get_minPrice write Set_minPrice;
  property maxPrice:INumber read Get_maxPrice write Set_maxPrice;
published
  property priceCurrency:String read Get_priceCurrency write Set_priceCurrency;
  property validThrough:TDateTime read Get_validThrough write Set_validThrough;
  property valueAddedTaxIncluded:Boolean read Get_valueAddedTaxIncluded write Set_valueAddedTaxIncluded;
end;

TBusinessFunction=Class; //forward


(*TypeAndQuantityNode*)
TTypeAndQuantityNode=Class  (TStructuredValue,ITypeAndQuantityNode)
private
  FtypeOfGood:IService;
  FunitCode:String;
  FbusinessFunction:IBusinessFunction;
  FamountOfThisGood:INumber;
protected
  function Get_typeOfGood:IService;virtual;
  procedure Set_typeOfGood(v:IService);virtual;
  function Get_unitCode:String;virtual;
  procedure Set_unitCode(v:String);virtual;
  function Get_businessFunction:IBusinessFunction;virtual;
  procedure Set_businessFunction(v:IBusinessFunction);virtual;
  function Get_amountOfThisGood:INumber;virtual;
  procedure Set_amountOfThisGood(v:INumber);virtual;
public
  property typeOfGood:IService read Get_typeOfGood write Set_typeOfGood;
  property businessFunction:IBusinessFunction read Get_businessFunction write Set_businessFunction;
  property amountOfThisGood:INumber read Get_amountOfThisGood write Set_amountOfThisGood;
published
  property unitCode:String read Get_unitCode write Set_unitCode;
end;


(*BusinessFunction*)
TBusinessFunction=Class  (TEnumeration,IBusinessFunction)
  function TangBusinessFunction:TangibleValue;virtual;
end;


(*BusinessEntityType*)
TBusinessEntityType=Class  (TEnumeration,IBusinessEntityType)
  function TangBusinessEntityType:TangibleValue;virtual;
end;


(*EducationalOrganization*)
TEducationalOrganization=Class  (TOrganization,IEducationalOrganization)
 (*No atribs*)
end;


(*VideoObject*)
TVideoObject=Class  (TMediaObject,IVideoObject)
private
  Fthumbnail:IImageObject;
  FvideoFrameSize:String;
  FvideoQuality:String;
protected
  function Get_thumbnail:IImageObject;virtual;
  procedure Set_thumbnail(v:IImageObject);virtual;
  function Get_videoFrameSize:String;virtual;
  procedure Set_videoFrameSize(v:String);virtual;
  function Get_videoQuality:String;virtual;
  procedure Set_videoQuality(v:String);virtual;
public
  property thumbnail:IImageObject read Get_thumbnail write Set_thumbnail;
published
  property videoFrameSize:String read Get_videoFrameSize write Set_videoFrameSize;
  property videoQuality:String read Get_videoQuality write Set_videoQuality;
end;

TBroadcastService=Class; //forward


(*PublicationEvent*)
TPublicationEvent=Class  (TEvent,IPublicationEvent)
private
  Ffree:Boolean;
  FpublishedOn:IBroadcastService;
  FpublishedBy:IOrganization;
protected
  function Get_free:Boolean;virtual;
  procedure Set_free(v:Boolean);virtual;
  function Get_publishedOn:IBroadcastService;virtual;
  procedure Set_publishedOn(v:IBroadcastService);virtual;
  function Get_publishedBy:IOrganization;virtual;
  procedure Set_publishedBy(v:IOrganization);virtual;
public
  property publishedOn:IBroadcastService read Get_publishedOn write Set_publishedOn;
  property publishedBy:IOrganization read Get_publishedBy write Set_publishedBy;
published
  property free:Boolean read Get_free write Set_free;
end;


(*BroadcastService*)
TBroadcastService=Class  (TService,IBroadcastService)
private
  FbroadcastTimezone:String;
  FparentService:IBroadcastService;
  FbroadcastFrequency:String;
  FbroadcastAffiliateOf:IOrganization;
  FbroadcastDisplayName:String;
  Farea:IPlace;
  Fbroadcaster:IOrganization;
protected
  function Get_broadcastTimezone:String;virtual;
  procedure Set_broadcastTimezone(v:String);virtual;
  function Get_parentService:IBroadcastService;virtual;
  procedure Set_parentService(v:IBroadcastService);virtual;
  function Get_broadcastFrequency:String;virtual;
  procedure Set_broadcastFrequency(v:String);virtual;
  function Get_broadcastAffiliateOf:IOrganization;virtual;
  procedure Set_broadcastAffiliateOf(v:IOrganization);virtual;
  function Get_broadcastDisplayName:String;virtual;
  procedure Set_broadcastDisplayName(v:String);virtual;
  function Get_area:IPlace;virtual;
  procedure Set_area(v:IPlace);virtual;
  function Get_broadcaster:IOrganization;virtual;
  procedure Set_broadcaster(v:IOrganization);virtual;
public
  property parentService:IBroadcastService read Get_parentService write Set_parentService;
  property broadcastAffiliateOf:IOrganization read Get_broadcastAffiliateOf write Set_broadcastAffiliateOf;
  property area:IPlace read Get_area write Set_area;
  property broadcaster:IOrganization read Get_broadcaster write Set_broadcaster;
published
  property broadcastTimezone:String read Get_broadcastTimezone write Set_broadcastTimezone;
  property broadcastFrequency:String read Get_broadcastFrequency write Set_broadcastFrequency;
  property broadcastDisplayName:String read Get_broadcastDisplayName write Set_broadcastDisplayName;
end;


(*AudioObject*)
TAudioObject=Class  (TMediaObject,IAudioObject)
private
  Ftranscript:String;
protected
  function Get_transcript:String;virtual;
  procedure Set_transcript(v:String);virtual;
public
published
  property transcript:String read Get_transcript write Set_transcript;
end;


(*AlignmentObject*)
TAlignmentObject=Class  (TIntangible,IAlignmentObject)
private
  FtargetName:String;
  FtargetUrl:String;
  FtargetDescription:String;
  FeducationalFramework:String;
  FalignmentType:String;
protected
  function Get_targetName:String;virtual;
  procedure Set_targetName(v:String);virtual;
  function Get_targetUrl:String;virtual;
  procedure Set_targetUrl(v:String);virtual;
  function Get_targetDescription:String;virtual;
  procedure Set_targetDescription(v:String);virtual;
  function Get_educationalFramework:String;virtual;
  procedure Set_educationalFramework(v:String);virtual;
  function Get_alignmentType:String;virtual;
  procedure Set_alignmentType(v:String);virtual;
public
published
  property targetName:String read Get_targetName write Set_targetName;
  property targetUrl:String read Get_targetUrl write Set_targetUrl;
  property targetDescription:String read Get_targetDescription write Set_targetDescription;
  property educationalFramework:String read Get_educationalFramework write Set_educationalFramework;
  property alignmentType:String read Get_alignmentType write Set_alignmentType;
end;

TDataFeed=Class; //forward


(*SoftwareApplication*)
TSoftwareApplication=Class  (TCreativeWork,ISoftwareApplication)
private
  FstorageRequirements:String;
  FreleaseNotes:String;
  FoperatingSystem:String;
  FcountriesSupported:String;
  Fpermissions:String;
  Fscreenshot:String;
  FsoftwareHelp:ICreativeWork;
  FsoftwareVersion:String;
  FdownloadUrl:String;
  Fdevice:String;
  FapplicationSuite:String;
  FfeatureList:String;
  FsupportingData:IDataFeed;
  FapplicationCategory:String;
  FinstallUrl:String;
  FprocessorRequirements:String;
  FfileSize:String;
  FapplicationSubCategory:String;
  FcountriesNotSupported:String;
  Frequirements:String;
  FmemoryRequirements:String;
  FsoftwareAddOn:ISoftwareApplication;
protected
  function Get_storageRequirements:String;virtual;
  procedure Set_storageRequirements(v:String);virtual;
  function Get_releaseNotes:String;virtual;
  procedure Set_releaseNotes(v:String);virtual;
  function Get_operatingSystem:String;virtual;
  procedure Set_operatingSystem(v:String);virtual;
  function Get_countriesSupported:String;virtual;
  procedure Set_countriesSupported(v:String);virtual;
  function Get_permissions:String;virtual;
  procedure Set_permissions(v:String);virtual;
  function Get_screenshot:String;virtual;
  procedure Set_screenshot(v:String);virtual;
  function Get_softwareHelp:ICreativeWork;virtual;
  procedure Set_softwareHelp(v:ICreativeWork);virtual;
  function Get_softwareVersion:String;virtual;
  procedure Set_softwareVersion(v:String);virtual;
  function Get_downloadUrl:String;virtual;
  procedure Set_downloadUrl(v:String);virtual;
  function Get_device:String;virtual;
  procedure Set_device(v:String);virtual;
  function Get_applicationSuite:String;virtual;
  procedure Set_applicationSuite(v:String);virtual;
  function Get_featureList:String;virtual;
  procedure Set_featureList(v:String);virtual;
  function Get_supportingData:IDataFeed;virtual;
  procedure Set_supportingData(v:IDataFeed);virtual;
  function Get_applicationCategory:String;virtual;
  procedure Set_applicationCategory(v:String);virtual;
  function Get_installUrl:String;virtual;
  procedure Set_installUrl(v:String);virtual;
  function Get_processorRequirements:String;virtual;
  procedure Set_processorRequirements(v:String);virtual;
  function Get_fileSize:String;virtual;
  procedure Set_fileSize(v:String);virtual;
  function Get_applicationSubCategory:String;virtual;
  procedure Set_applicationSubCategory(v:String);virtual;
  function Get_countriesNotSupported:String;virtual;
  procedure Set_countriesNotSupported(v:String);virtual;
  function Get_requirements:String;virtual;
  procedure Set_requirements(v:String);virtual;
  function Get_memoryRequirements:String;virtual;
  procedure Set_memoryRequirements(v:String);virtual;
  function Get_softwareAddOn:ISoftwareApplication;virtual;
  procedure Set_softwareAddOn(v:ISoftwareApplication);virtual;
public
  property softwareHelp:ICreativeWork read Get_softwareHelp write Set_softwareHelp;
  property supportingData:IDataFeed read Get_supportingData write Set_supportingData;
  property softwareAddOn:ISoftwareApplication read Get_softwareAddOn write Set_softwareAddOn;
published
  property storageRequirements:String read Get_storageRequirements write Set_storageRequirements;
  property releaseNotes:String read Get_releaseNotes write Set_releaseNotes;
  property operatingSystem:String read Get_operatingSystem write Set_operatingSystem;
  property countriesSupported:String read Get_countriesSupported write Set_countriesSupported;
  property permissions:String read Get_permissions write Set_permissions;
  property screenshot:String read Get_screenshot write Set_screenshot;
  property softwareVersion:String read Get_softwareVersion write Set_softwareVersion;
  property downloadUrl:String read Get_downloadUrl write Set_downloadUrl;
  property device:String read Get_device write Set_device;
  property applicationSuite:String read Get_applicationSuite write Set_applicationSuite;
  property featureList:String read Get_featureList write Set_featureList;
  property applicationCategory:String read Get_applicationCategory write Set_applicationCategory;
  property installUrl:String read Get_installUrl write Set_installUrl;
  property processorRequirements:String read Get_processorRequirements write Set_processorRequirements;
  property fileSize:String read Get_fileSize write Set_fileSize;
  property applicationSubCategory:String read Get_applicationSubCategory write Set_applicationSubCategory;
  property countriesNotSupported:String read Get_countriesNotSupported write Set_countriesNotSupported;
  property requirements:String read Get_requirements write Set_requirements;
  property memoryRequirements:String read Get_memoryRequirements write Set_memoryRequirements;
end;

TDataCatalog=Class; //forward

TDataDownload=Class; //forward


(*Dataset*)
TDataset=Class  (TCreativeWork,IDataset)
private
  Ftemporal:TDateTime;
  FvariablesMeasured:String;
  Fspatial:IPlace;
  FincludedDataCatalog:IDataCatalog;
  FdatasetTimeInterval:TDateTime;
  Fcatalog:IDataCatalog;
  Fdistribution:IDataDownload;
protected
  function Get_temporal:TDateTime;virtual;
  procedure Set_temporal(v:TDateTime);virtual;
  function Get_variablesMeasured:String;virtual;
  procedure Set_variablesMeasured(v:String);virtual;
  function Get_spatial:IPlace;virtual;
  procedure Set_spatial(v:IPlace);virtual;
  function Get_includedDataCatalog:IDataCatalog;virtual;
  procedure Set_includedDataCatalog(v:IDataCatalog);virtual;
  function Get_datasetTimeInterval:TDateTime;virtual;
  procedure Set_datasetTimeInterval(v:TDateTime);virtual;
  function Get_catalog:IDataCatalog;virtual;
  procedure Set_catalog(v:IDataCatalog);virtual;
  function Get_distribution:IDataDownload;virtual;
  procedure Set_distribution(v:IDataDownload);virtual;
public
  property spatial:IPlace read Get_spatial write Set_spatial;
  property includedDataCatalog:IDataCatalog read Get_includedDataCatalog write Set_includedDataCatalog;
  property catalog:IDataCatalog read Get_catalog write Set_catalog;
  property distribution:IDataDownload read Get_distribution write Set_distribution;
published
  property temporal:TDateTime read Get_temporal write Set_temporal;
  property variablesMeasured:String read Get_variablesMeasured write Set_variablesMeasured;
  property datasetTimeInterval:TDateTime read Get_datasetTimeInterval write Set_datasetTimeInterval;
end;


(*DataCatalog*)
TDataCatalog=Class  (TCreativeWork,IDataCatalog)
private
  Fdataset:IDataset;
protected
  function Get_dataset:IDataset;virtual;
  procedure Set_dataset(v:IDataset);virtual;
public
  property dataset:IDataset read Get_dataset write Set_dataset;
published
end;


(*DataDownload*)
TDataDownload=Class  (TMediaObject,IDataDownload)
 (*No atribs*)
end;


(*DataFeed*)
TDataFeed=Class  (TDataset,IDataFeed)
private
  FdataFeedElement:IThing;
protected
  function Get_dataFeedElement:IThing;virtual;
  procedure Set_dataFeedElement(v:IThing);virtual;
public
  property dataFeedElement:IThing read Get_dataFeedElement write Set_dataFeedElement;
published
end;


(*ActionStatusType*)
TActionStatusType=Class  (TEnumeration,IActionStatusType)
  function TangActionStatusType:TangibleValue;virtual;
end;


(*CreativeWorkSeries*)
TCreativeWorkSeries=Class  (TCreativeWork,ICreativeWorkSeries)
 (*No atribs*)
end;


(*Periodical*)
TPeriodical=Class  (TCreativeWorkSeries,IPeriodical)
private
  Fissn:String;
protected
  function Get_issn:String;virtual;
  procedure Set_issn(v:String);virtual;
public
published
  property issn:String read Get_issn write Set_issn;
end;


(*Newspaper*)
TNewspaper=Class  (TPeriodical,INewspaper)
 (*No atribs*)
end;


(*Permit*)
TPermit=Class  (TIntangible,IPermit)
private
  FvalidFor:IDuration;
  FissuedThrough:IService;
  FvalidUntil:TDateTime;
  FvalidIn:IAdministrativeArea;
  FpermitAudience:IAudience;
  FissuedBy:IOrganization;
protected
  function Get_validFor:IDuration;virtual;
  procedure Set_validFor(v:IDuration);virtual;
  function Get_issuedThrough:IService;virtual;
  procedure Set_issuedThrough(v:IService);virtual;
  function Get_validUntil:TDateTime;virtual;
  procedure Set_validUntil(v:TDateTime);virtual;
  function Get_validIn:IAdministrativeArea;virtual;
  procedure Set_validIn(v:IAdministrativeArea);virtual;
  function Get_permitAudience:IAudience;virtual;
  procedure Set_permitAudience(v:IAudience);virtual;
  function Get_issuedBy:IOrganization;virtual;
  procedure Set_issuedBy(v:IOrganization);virtual;
public
  property validFor:IDuration read Get_validFor write Set_validFor;
  property issuedThrough:IService read Get_issuedThrough write Set_issuedThrough;
  property validIn:IAdministrativeArea read Get_validIn write Set_validIn;
  property permitAudience:IAudience read Get_permitAudience write Set_permitAudience;
  property issuedBy:IOrganization read Get_issuedBy write Set_issuedBy;
published
  property validUntil:TDateTime read Get_validUntil write Set_validUntil;
end;


(*GovernmentPermit*)
TGovernmentPermit=Class  (TPermit,IGovernmentPermit)
  function TangGovernmentPermit:TangibleValue;virtual;
end;


(*UpdateAction*)
TUpdateAction=Class  (TAction,IUpdateAction)
private
  Fcollection:IThing;
protected
  function Get_collection:IThing;virtual;
  procedure Set_collection(v:IThing);virtual;
public
  property collection:IThing read Get_collection write Set_collection;
published
end;


(*AddAction*)
TAddAction=Class  (TUpdateAction,IAddAction)
 (*No atribs*)
end;


(*InsertAction*)
TInsertAction=Class  (TAddAction,IInsertAction)
 (*No atribs*)
end;


(*PrependAction*)
TPrependAction=Class  (TInsertAction,IPrependAction)
 (*No atribs*)
end;


(*Episode*)
TEpisode=Class  (TCreativeWork,IEpisode)
private
  FepisodeNumber:String;
protected
  function Get_episodeNumber:String;virtual;
  procedure Set_episodeNumber(v:String);virtual;
public
published
  property episodeNumber:String read Get_episodeNumber write Set_episodeNumber;
end;


(*RadioEpisode*)
TRadioEpisode=Class  (TEpisode,IRadioEpisode)
 (*No atribs*)
end;


(*LocalBusiness*)
TLocalBusiness=Class  (TPlace,ILocalBusiness)
private
  FpriceRange:String;
  FbranchOf:IOrganization;
  FopeningHours:String;
  FpaymentAccepted:String;
  FcurrenciesAccepted:String;
protected
  function Get_priceRange:String;virtual;
  procedure Set_priceRange(v:String);virtual;
  function Get_branchOf:IOrganization;virtual;
  procedure Set_branchOf(v:IOrganization);virtual;
  function Get_openingHours:String;virtual;
  procedure Set_openingHours(v:String);virtual;
  function Get_paymentAccepted:String;virtual;
  procedure Set_paymentAccepted(v:String);virtual;
  function Get_currenciesAccepted:String;virtual;
  procedure Set_currenciesAccepted(v:String);virtual;
public
  property branchOf:IOrganization read Get_branchOf write Set_branchOf;
published
  property priceRange:String read Get_priceRange write Set_priceRange;
  property openingHours:String read Get_openingHours write Set_openingHours;
  property paymentAccepted:String read Get_paymentAccepted write Set_paymentAccepted;
  property currenciesAccepted:String read Get_currenciesAccepted write Set_currenciesAccepted;
end;


(*FoodEstablishment*)
TFoodEstablishment=Class  (TLocalBusiness,IFoodEstablishment)
private
  FacceptsReservations:String;
  FservesCuisine:String;
  Fmenu:String;
protected
  function Get_acceptsReservations:String;virtual;
  procedure Set_acceptsReservations(v:String);virtual;
  function Get_servesCuisine:String;virtual;
  procedure Set_servesCuisine(v:String);virtual;
  function Get_menu:String;virtual;
  procedure Set_menu(v:String);virtual;
public
published
  property acceptsReservations:String read Get_acceptsReservations write Set_acceptsReservations;
  property servesCuisine:String read Get_servesCuisine write Set_servesCuisine;
  property menu:String read Get_menu write Set_menu;
end;


(*Winery*)
TWinery=Class  (TFoodEstablishment,IWinery)
 (*No atribs*)
end;

TCableOrSatelliteService=Class; //forward


(*BroadcastChannel*)
TBroadcastChannel=Class  (TIntangible,IBroadcastChannel)
private
  FbroadcastChannelId:String;
  FbroadcastServiceTier:String;
  FinBroadcastLineup:ICableOrSatelliteService;
  FprovidesBroadcastService:IBroadcastService;
protected
  function Get_broadcastChannelId:String;virtual;
  procedure Set_broadcastChannelId(v:String);virtual;
  function Get_broadcastServiceTier:String;virtual;
  procedure Set_broadcastServiceTier(v:String);virtual;
  function Get_inBroadcastLineup:ICableOrSatelliteService;virtual;
  procedure Set_inBroadcastLineup(v:ICableOrSatelliteService);virtual;
  function Get_providesBroadcastService:IBroadcastService;virtual;
  procedure Set_providesBroadcastService(v:IBroadcastService);virtual;
public
  property inBroadcastLineup:ICableOrSatelliteService read Get_inBroadcastLineup write Set_inBroadcastLineup;
  property providesBroadcastService:IBroadcastService read Get_providesBroadcastService write Set_providesBroadcastService;
published
  property broadcastChannelId:String read Get_broadcastChannelId write Set_broadcastChannelId;
  property broadcastServiceTier:String read Get_broadcastServiceTier write Set_broadcastServiceTier;
end;


(*CableOrSatelliteService*)
TCableOrSatelliteService=Class  (TService,ICableOrSatelliteService)
  function TangCableOrSatelliteService:TangibleValue;virtual;
end;


(*RadioChannel*)
TRadioChannel=Class  (TBroadcastChannel,IRadioChannel)
  function TangRadioChannel:TangibleValue;virtual;
end;


(*AMRadioChannel*)
TAMRadioChannel=Class  (TRadioChannel,IAMRadioChannel)
  function TangAMRadioChannel:TangibleValue;virtual;
end;


(*Collection*)
TCollection=Class  (TCreativeWork,ICollection)
 (*No atribs*)
end;


(*Season*)
TSeason=Class  (TCreativeWork,ISeason)
 (*No atribs*)
end;


(*Brewery*)
TBrewery=Class  (TFoodEstablishment,IBrewery)
 (*No atribs*)
end;

TMedicalCode=Class; //forward

TMedicalGuideline=Class; //forward

TMedicineSystem=Class; //forward

TMedicalStudy=Class; //forward

TMedicalSpecialty=Class; //forward


(*MedicalEntity*)
TMedicalEntity=Class  (TThing,IMedicalEntity)
private
  Fcode:IMedicalCode;
  Fguideline:IMedicalGuideline;
  FmedicineSystem:IMedicineSystem;
  FlegalStatus:String;
  FrecognizingAuthority:IOrganization;
  Fstudy:IMedicalStudy;
  FrelevantSpecialty:IMedicalSpecialty;
protected
  function Get_code:IMedicalCode;virtual;
  procedure Set_code(v:IMedicalCode);virtual;
  function Get_guideline:IMedicalGuideline;virtual;
  procedure Set_guideline(v:IMedicalGuideline);virtual;
  function Get_medicineSystem:IMedicineSystem;virtual;
  procedure Set_medicineSystem(v:IMedicineSystem);virtual;
  function Get_legalStatus:String;virtual;
  procedure Set_legalStatus(v:String);virtual;
  function Get_recognizingAuthority:IOrganization;virtual;
  procedure Set_recognizingAuthority(v:IOrganization);virtual;
  function Get_study:IMedicalStudy;virtual;
  procedure Set_study(v:IMedicalStudy);virtual;
  function Get_relevantSpecialty:IMedicalSpecialty;virtual;
  procedure Set_relevantSpecialty(v:IMedicalSpecialty);virtual;
public
  property code:IMedicalCode read Get_code write Set_code;
  property guideline:IMedicalGuideline read Get_guideline write Set_guideline;
  property medicineSystem:IMedicineSystem read Get_medicineSystem write Set_medicineSystem;
  property recognizingAuthority:IOrganization read Get_recognizingAuthority write Set_recognizingAuthority;
  property study:IMedicalStudy read Get_study write Set_study;
  property relevantSpecialty:IMedicalSpecialty read Get_relevantSpecialty write Set_relevantSpecialty;
published
  property legalStatus:String read Get_legalStatus write Set_legalStatus;
end;


(*MedicalIntangible*)
TMedicalIntangible=Class  (TMedicalEntity,IMedicalIntangible)
 (*No atribs*)
end;


(*MedicalCode*)
TMedicalCode=Class  (TMedicalIntangible,IMedicalCode)
private
  FcodingSystem:String;
  FcodeValue:String;
protected
  function Get_codingSystem:String;virtual;
  procedure Set_codingSystem(v:String);virtual;
  function Get_codeValue:String;virtual;
  procedure Set_codeValue(v:String);virtual;
public
published
  property codingSystem:String read Get_codingSystem write Set_codingSystem;
  property codeValue:String read Get_codeValue write Set_codeValue;
end;

TMedicalEvidenceLevel=Class; //forward


(*MedicalGuideline*)
TMedicalGuideline=Class  (TMedicalEntity,IMedicalGuideline)
private
  FevidenceOrigin:String;
  FguidelineSubject:IMedicalEntity;
  FguidelineDate:TDateTime;
  FevidenceLevel:IMedicalEvidenceLevel;
protected
  function Get_evidenceOrigin:String;virtual;
  procedure Set_evidenceOrigin(v:String);virtual;
  function Get_guidelineSubject:IMedicalEntity;virtual;
  procedure Set_guidelineSubject(v:IMedicalEntity);virtual;
  function Get_guidelineDate:TDateTime;virtual;
  procedure Set_guidelineDate(v:TDateTime);virtual;
  function Get_evidenceLevel:IMedicalEvidenceLevel;virtual;
  procedure Set_evidenceLevel(v:IMedicalEvidenceLevel);virtual;
public
  property guidelineSubject:IMedicalEntity read Get_guidelineSubject write Set_guidelineSubject;
  property evidenceLevel:IMedicalEvidenceLevel read Get_evidenceLevel write Set_evidenceLevel;
published
  property evidenceOrigin:String read Get_evidenceOrigin write Set_evidenceOrigin;
  property guidelineDate:TDateTime read Get_guidelineDate write Set_guidelineDate;
end;


(*MedicalEnumeration*)
TMedicalEnumeration=Class  (TEnumeration,IMedicalEnumeration)
  function TangMedicalEnumeration:TangibleValue;virtual;
end;


(*MedicalEvidenceLevel*)
TMedicalEvidenceLevel=Class  (TMedicalEnumeration,IMedicalEvidenceLevel)
  function TangMedicalEvidenceLevel:TangibleValue;virtual;
end;


(*MedicineSystem*)
TMedicineSystem=Class  (TMedicalEnumeration,IMedicineSystem)
  function TangMedicineSystem:TangibleValue;virtual;
end;

TMedicalCondition=Class; //forward


(*MedicalStudy*)
TMedicalStudy=Class  (TMedicalEntity,IMedicalStudy)
private
  FhealthCondition:IMedicalCondition;
  Fpopulation:String;
  FstudySubject:IMedicalEntity;
  FstudyLocation:IAdministrativeArea;
protected
  function Get_healthCondition:IMedicalCondition;virtual;
  procedure Set_healthCondition(v:IMedicalCondition);virtual;
  function Get_population:String;virtual;
  procedure Set_population(v:String);virtual;
  function Get_studySubject:IMedicalEntity;virtual;
  procedure Set_studySubject(v:IMedicalEntity);virtual;
  function Get_studyLocation:IAdministrativeArea;virtual;
  procedure Set_studyLocation(v:IAdministrativeArea);virtual;
public
  property healthCondition:IMedicalCondition read Get_healthCondition write Set_healthCondition;
  property studySubject:IMedicalEntity read Get_studySubject write Set_studySubject;
  property studyLocation:IAdministrativeArea read Get_studyLocation write Set_studyLocation;
published
  property population:String read Get_population write Set_population;
end;

TMedicalTherapy=Class; //forward

TMedicalTest=Class; //forward

TMedicalCause=Class; //forward

TMedicalStudyStatus=Class; //forward

TAnatomicalStructure=Class; //forward

TMedicalRiskFactor=Class; //forward

TMedicalSignOrSymptom=Class; //forward

TDDxElement=Class; //forward

TMedicalConditionStage=Class; //forward


(*MedicalCondition*)
TMedicalCondition=Class  (TMedicalEntity,IMedicalCondition)
private
  FprimaryPrevention:IMedicalTherapy;
  FtypicalTest:IMedicalTest;
  Fcause:IMedicalCause;
  Fstatus:IMedicalStudyStatus;
  Fsubtype:String;
  FexpectedPrognosis:String;
  FpossibleComplication:String;
  FassociatedAnatomy:IAnatomicalStructure;
  Fpathophysiology:String;
  FriskFactor:IMedicalRiskFactor;
  FsignOrSymptom:IMedicalSignOrSymptom;
  FdifferentialDiagnosis:IDDxElement;
  Fstage:IMedicalConditionStage;
  FnaturalProgression:String;
  FpossibleTreatment:IMedicalTherapy;
  FsecondaryPrevention:IMedicalTherapy;
protected
  function Get_primaryPrevention:IMedicalTherapy;virtual;
  procedure Set_primaryPrevention(v:IMedicalTherapy);virtual;
  function Get_typicalTest:IMedicalTest;virtual;
  procedure Set_typicalTest(v:IMedicalTest);virtual;
  function Get_cause:IMedicalCause;virtual;
  procedure Set_cause(v:IMedicalCause);virtual;
  function Get_status:IMedicalStudyStatus;virtual;
  procedure Set_status(v:IMedicalStudyStatus);virtual;
  function Get_subtype:String;virtual;
  procedure Set_subtype(v:String);virtual;
  function Get_expectedPrognosis:String;virtual;
  procedure Set_expectedPrognosis(v:String);virtual;
  function Get_possibleComplication:String;virtual;
  procedure Set_possibleComplication(v:String);virtual;
  function Get_associatedAnatomy:IAnatomicalStructure;virtual;
  procedure Set_associatedAnatomy(v:IAnatomicalStructure);virtual;
  function Get_pathophysiology:String;virtual;
  procedure Set_pathophysiology(v:String);virtual;
  function Get_riskFactor:IMedicalRiskFactor;virtual;
  procedure Set_riskFactor(v:IMedicalRiskFactor);virtual;
  function Get_signOrSymptom:IMedicalSignOrSymptom;virtual;
  procedure Set_signOrSymptom(v:IMedicalSignOrSymptom);virtual;
  function Get_differentialDiagnosis:IDDxElement;virtual;
  procedure Set_differentialDiagnosis(v:IDDxElement);virtual;
  function Get_stage:IMedicalConditionStage;virtual;
  procedure Set_stage(v:IMedicalConditionStage);virtual;
  function Get_naturalProgression:String;virtual;
  procedure Set_naturalProgression(v:String);virtual;
  function Get_possibleTreatment:IMedicalTherapy;virtual;
  procedure Set_possibleTreatment(v:IMedicalTherapy);virtual;
  function Get_secondaryPrevention:IMedicalTherapy;virtual;
  procedure Set_secondaryPrevention(v:IMedicalTherapy);virtual;
public
  property primaryPrevention:IMedicalTherapy read Get_primaryPrevention write Set_primaryPrevention;
  property typicalTest:IMedicalTest read Get_typicalTest write Set_typicalTest;
  property cause:IMedicalCause read Get_cause write Set_cause;
  property status:IMedicalStudyStatus read Get_status write Set_status;
  property associatedAnatomy:IAnatomicalStructure read Get_associatedAnatomy write Set_associatedAnatomy;
  property riskFactor:IMedicalRiskFactor read Get_riskFactor write Set_riskFactor;
  property signOrSymptom:IMedicalSignOrSymptom read Get_signOrSymptom write Set_signOrSymptom;
  property differentialDiagnosis:IDDxElement read Get_differentialDiagnosis write Set_differentialDiagnosis;
  property stage:IMedicalConditionStage read Get_stage write Set_stage;
  property possibleTreatment:IMedicalTherapy read Get_possibleTreatment write Set_possibleTreatment;
  property secondaryPrevention:IMedicalTherapy read Get_secondaryPrevention write Set_secondaryPrevention;
published
  property subtype:String read Get_subtype write Set_subtype;
  property expectedPrognosis:String read Get_expectedPrognosis write Set_expectedPrognosis;
  property possibleComplication:String read Get_possibleComplication write Set_possibleComplication;
  property pathophysiology:String read Get_pathophysiology write Set_pathophysiology;
  property naturalProgression:String read Get_naturalProgression write Set_naturalProgression;
end;

TMedicalIndication=Class; //forward

TMedicalProcedureType=Class; //forward


(*MedicalProcedure*)
TMedicalProcedure=Class  (TMedicalEntity,IMedicalProcedure)
private
  Ffollowup:String;
  Fpreparation:IMedicalEntity;
  FhowPerformed:String;
  Findication:IMedicalIndication;
  FprocedureType:IMedicalProcedureType;
  FbodyLocation:String;
  Foutcome:IMedicalEntity;
protected
  function Get_followup:String;virtual;
  procedure Set_followup(v:String);virtual;
  function Get_preparation:IMedicalEntity;virtual;
  procedure Set_preparation(v:IMedicalEntity);virtual;
  function Get_howPerformed:String;virtual;
  procedure Set_howPerformed(v:String);virtual;
  function Get_indication:IMedicalIndication;virtual;
  procedure Set_indication(v:IMedicalIndication);virtual;
  function Get_procedureType:IMedicalProcedureType;virtual;
  procedure Set_procedureType(v:IMedicalProcedureType);virtual;
  function Get_bodyLocation:String;virtual;
  procedure Set_bodyLocation(v:String);virtual;
  function Get_outcome:IMedicalEntity;virtual;
  procedure Set_outcome(v:IMedicalEntity);virtual;
public
  property preparation:IMedicalEntity read Get_preparation write Set_preparation;
  property indication:IMedicalIndication read Get_indication write Set_indication;
  property procedureType:IMedicalProcedureType read Get_procedureType write Set_procedureType;
  property outcome:IMedicalEntity read Get_outcome write Set_outcome;
published
  property followup:String read Get_followup write Set_followup;
  property howPerformed:String read Get_howPerformed write Set_howPerformed;
  property bodyLocation:String read Get_bodyLocation write Set_bodyLocation;
end;


(*MedicalIndication*)
TMedicalIndication=Class  (TMedicalEntity,IMedicalIndication)
 (*No atribs*)
end;


(*MedicalProcedureType*)
TMedicalProcedureType=Class  (TMedicalEnumeration,IMedicalProcedureType)
  function TangMedicalProcedureType:TangibleValue;virtual;
end;


(*TherapeuticProcedure*)
TTherapeuticProcedure=Class  (TMedicalProcedure,ITherapeuticProcedure)
 (*No atribs*)
end;


(*MedicalTherapy*)
TMedicalTherapy=Class  (TTherapeuticProcedure,IMedicalTherapy)
private
  FseriousAdverseOutcome:IMedicalEntity;
  FduplicateTherapy:IMedicalTherapy;
protected
  function Get_seriousAdverseOutcome:IMedicalEntity;virtual;
  procedure Set_seriousAdverseOutcome(v:IMedicalEntity);virtual;
  function Get_duplicateTherapy:IMedicalTherapy;virtual;
  procedure Set_duplicateTherapy(v:IMedicalTherapy);virtual;
public
  property seriousAdverseOutcome:IMedicalEntity read Get_seriousAdverseOutcome write Set_seriousAdverseOutcome;
  property duplicateTherapy:IMedicalTherapy read Get_duplicateTherapy write Set_duplicateTherapy;
published
end;

TMedicalDevice=Class; //forward

TDrug=Class; //forward

TMedicalSign=Class; //forward


(*MedicalTest*)
TMedicalTest=Class  (TMedicalEntity,IMedicalTest)
private
  FusesDevice:IMedicalDevice;
  FaffectedBy:IDrug;
  FnormalRange:IMedicalEnumeration;
  FsignDetected:IMedicalSign;
  FusedToDiagnose:IMedicalCondition;
protected
  function Get_usesDevice:IMedicalDevice;virtual;
  procedure Set_usesDevice(v:IMedicalDevice);virtual;
  function Get_affectedBy:IDrug;virtual;
  procedure Set_affectedBy(v:IDrug);virtual;
  function Get_normalRange:IMedicalEnumeration;virtual;
  procedure Set_normalRange(v:IMedicalEnumeration);virtual;
  function Get_signDetected:IMedicalSign;virtual;
  procedure Set_signDetected(v:IMedicalSign);virtual;
  function Get_usedToDiagnose:IMedicalCondition;virtual;
  procedure Set_usedToDiagnose(v:IMedicalCondition);virtual;
public
  property usesDevice:IMedicalDevice read Get_usesDevice write Set_usesDevice;
  property affectedBy:IDrug read Get_affectedBy write Set_affectedBy;
  property normalRange:IMedicalEnumeration read Get_normalRange write Set_normalRange;
  property signDetected:IMedicalSign read Get_signDetected write Set_signDetected;
  property usedToDiagnose:IMedicalCondition read Get_usedToDiagnose write Set_usedToDiagnose;
published
end;

TMedicalContraindication=Class; //forward


(*MedicalDevice*)
TMedicalDevice=Class  (TMedicalEntity,IMedicalDevice)
private
  FpreOp:String;
  FpostOp:String;
  Fpurpose:IThing;
  FadverseOutcome:IMedicalEntity;
  Fcontraindication:IMedicalContraindication;
  F_procedure:String;
protected
  function Get_preOp:String;virtual;
  procedure Set_preOp(v:String);virtual;
  function Get_postOp:String;virtual;
  procedure Set_postOp(v:String);virtual;
  function Get_purpose:IThing;virtual;
  procedure Set_purpose(v:IThing);virtual;
  function Get_adverseOutcome:IMedicalEntity;virtual;
  procedure Set_adverseOutcome(v:IMedicalEntity);virtual;
  function Get_contraindication:IMedicalContraindication;virtual;
  procedure Set_contraindication(v:IMedicalContraindication);virtual;
  function Get__procedure:String;virtual;
  procedure Set__procedure(v:String);virtual;
public
  property purpose:IThing read Get_purpose write Set_purpose;
  property adverseOutcome:IMedicalEntity read Get_adverseOutcome write Set_adverseOutcome;
  property contraindication:IMedicalContraindication read Get_contraindication write Set_contraindication;
published
  property preOp:String read Get_preOp write Set_preOp;
  property postOp:String read Get_postOp write Set_postOp;
  property _procedure:String read Get__procedure write Set__procedure;
end;


(*MedicalContraindication*)
TMedicalContraindication=Class  (TMedicalEntity,IMedicalContraindication)
 (*No atribs*)
end;

TMaximumDoseSchedule=Class; //forward


(*Substance*)
TSubstance=Class  (TMedicalEntity,ISubstance)
private
  FmaximumIntake:IMaximumDoseSchedule;
protected
  function Get_maximumIntake:IMaximumDoseSchedule;virtual;
  procedure Set_maximumIntake(v:IMaximumDoseSchedule);virtual;
public
  property maximumIntake:IMaximumDoseSchedule read Get_maximumIntake write Set_maximumIntake;
published
end;

TQualitativeValue=Class; //forward


(*DoseSchedule*)
TDoseSchedule=Class  (TMedicalIntangible,IDoseSchedule)
private
  FdoseUnit:String;
  FdoseValue:IQualitativeValue;
  Ffrequency:String;
protected
  function Get_doseUnit:String;virtual;
  procedure Set_doseUnit(v:String);virtual;
  function Get_doseValue:IQualitativeValue;virtual;
  procedure Set_doseValue(v:IQualitativeValue);virtual;
  function Get_frequency:String;virtual;
  procedure Set_frequency(v:String);virtual;
public
  property doseValue:IQualitativeValue read Get_doseValue write Set_doseValue;
published
  property doseUnit:String read Get_doseUnit write Set_doseUnit;
  property frequency:String read Get_frequency write Set_frequency;
end;

TPropertyValue=Class; //forward


(*QualitativeValue*)
TQualitativeValue=Class  (TEnumeration,IQualitativeValue)
private
  Flesser:IQualitativeValue;
  FnonEqual:IQualitativeValue;
  FlesserOrEqual:IQualitativeValue;
  Fgreater:IQualitativeValue;
  FadditionalProperty:IPropertyValue;
  Fequal:IQualitativeValue;
  FgreaterOrEqual:IQualitativeValue;
protected
  function Get_lesser:IQualitativeValue;virtual;
  procedure Set_lesser(v:IQualitativeValue);virtual;
  function Get_nonEqual:IQualitativeValue;virtual;
  procedure Set_nonEqual(v:IQualitativeValue);virtual;
  function Get_lesserOrEqual:IQualitativeValue;virtual;
  procedure Set_lesserOrEqual(v:IQualitativeValue);virtual;
  function Get_greater:IQualitativeValue;virtual;
  procedure Set_greater(v:IQualitativeValue);virtual;
  function Get_additionalProperty:IPropertyValue;virtual;
  procedure Set_additionalProperty(v:IPropertyValue);virtual;
  function Get_equal:IQualitativeValue;virtual;
  procedure Set_equal(v:IQualitativeValue);virtual;
  function Get_greaterOrEqual:IQualitativeValue;virtual;
  procedure Set_greaterOrEqual(v:IQualitativeValue);virtual;
public
  property lesser:IQualitativeValue read Get_lesser write Set_lesser;
  property nonEqual:IQualitativeValue read Get_nonEqual write Set_nonEqual;
  property lesserOrEqual:IQualitativeValue read Get_lesserOrEqual write Set_lesserOrEqual;
  property greater:IQualitativeValue read Get_greater write Set_greater;
  property additionalProperty:IPropertyValue read Get_additionalProperty write Set_additionalProperty;
  property equal:IQualitativeValue read Get_equal write Set_equal;
  property greaterOrEqual:IQualitativeValue read Get_greaterOrEqual write Set_greaterOrEqual;
published
end;


(*PropertyValue*)
TPropertyValue=Class  (TStructuredValue,IPropertyValue)
private
  FminValue:INumber;
  FpropertyID:String;
protected
  function Get_minValue:INumber;virtual;
  procedure Set_minValue(v:INumber);virtual;
  function Get_propertyID:String;virtual;
  procedure Set_propertyID(v:String);virtual;
public
  property minValue:INumber read Get_minValue write Set_minValue;
published
  property propertyID:String read Get_propertyID write Set_propertyID;
end;


(*MaximumDoseSchedule*)
TMaximumDoseSchedule=Class  (TDoseSchedule,IMaximumDoseSchedule)
 (*No atribs*)
end;

THealthInsurancePlan=Class; //forward

TDrugCost=Class; //forward

TDrugPregnancyCategory=Class; //forward

TDrugPrescriptionStatus=Class; //forward

TDrugStrength=Class; //forward

TDrugClass=Class; //forward


(*Drug*)
TDrug=Class  (TSubstance,IDrug)
private
  Fwarning:String;
  FincludedInHealthInsurancePlan:IHealthInsurancePlan;
  FproprietaryName:String;
  Fcost:IDrugCost;
  FdrugUnit:String;
  FpregnancyCategory:IDrugPregnancyCategory;
  FdoseSchedule:IDoseSchedule;
  FdosageForm:String;
  FprescribingInfo:String;
  FprescriptionStatus:IDrugPrescriptionStatus;
  Frxcui:String;
  FpregnancyWarning:String;
  FavailableStrength:IDrugStrength;
  FclincalPharmacology:String;
  FrelatedDrug:IDrug;
  FdrugClass:IDrugClass;
  FadministrationRoute:String;
  FbreastfeedingWarning:String;
  FinteractingDrug:IDrug;
  FfoodWarning:String;
  FalcoholWarning:String;
  FlabelDetails:String;
  Foverdosage:String;
  FisAvailableGenerically:Boolean;
protected
  function Get_warning:String;virtual;
  procedure Set_warning(v:String);virtual;
  function Get_includedInHealthInsurancePlan:IHealthInsurancePlan;virtual;
  procedure Set_includedInHealthInsurancePlan(v:IHealthInsurancePlan);virtual;
  function Get_proprietaryName:String;virtual;
  procedure Set_proprietaryName(v:String);virtual;
  function Get_cost:IDrugCost;virtual;
  procedure Set_cost(v:IDrugCost);virtual;
  function Get_drugUnit:String;virtual;
  procedure Set_drugUnit(v:String);virtual;
  function Get_pregnancyCategory:IDrugPregnancyCategory;virtual;
  procedure Set_pregnancyCategory(v:IDrugPregnancyCategory);virtual;
  function Get_doseSchedule:IDoseSchedule;virtual;
  procedure Set_doseSchedule(v:IDoseSchedule);virtual;
  function Get_dosageForm:String;virtual;
  procedure Set_dosageForm(v:String);virtual;
  function Get_prescribingInfo:String;virtual;
  procedure Set_prescribingInfo(v:String);virtual;
  function Get_prescriptionStatus:IDrugPrescriptionStatus;virtual;
  procedure Set_prescriptionStatus(v:IDrugPrescriptionStatus);virtual;
  function Get_rxcui:String;virtual;
  procedure Set_rxcui(v:String);virtual;
  function Get_pregnancyWarning:String;virtual;
  procedure Set_pregnancyWarning(v:String);virtual;
  function Get_availableStrength:IDrugStrength;virtual;
  procedure Set_availableStrength(v:IDrugStrength);virtual;
  function Get_clincalPharmacology:String;virtual;
  procedure Set_clincalPharmacology(v:String);virtual;
  function Get_relatedDrug:IDrug;virtual;
  procedure Set_relatedDrug(v:IDrug);virtual;
  function Get_drugClass:IDrugClass;virtual;
  procedure Set_drugClass(v:IDrugClass);virtual;
  function Get_administrationRoute:String;virtual;
  procedure Set_administrationRoute(v:String);virtual;
  function Get_breastfeedingWarning:String;virtual;
  procedure Set_breastfeedingWarning(v:String);virtual;
  function Get_interactingDrug:IDrug;virtual;
  procedure Set_interactingDrug(v:IDrug);virtual;
  function Get_foodWarning:String;virtual;
  procedure Set_foodWarning(v:String);virtual;
  function Get_alcoholWarning:String;virtual;
  procedure Set_alcoholWarning(v:String);virtual;
  function Get_labelDetails:String;virtual;
  procedure Set_labelDetails(v:String);virtual;
  function Get_overdosage:String;virtual;
  procedure Set_overdosage(v:String);virtual;
  function Get_isAvailableGenerically:Boolean;virtual;
  procedure Set_isAvailableGenerically(v:Boolean);virtual;
public
  property includedInHealthInsurancePlan:IHealthInsurancePlan read Get_includedInHealthInsurancePlan write Set_includedInHealthInsurancePlan;
  property cost:IDrugCost read Get_cost write Set_cost;
  property pregnancyCategory:IDrugPregnancyCategory read Get_pregnancyCategory write Set_pregnancyCategory;
  property doseSchedule:IDoseSchedule read Get_doseSchedule write Set_doseSchedule;
  property prescriptionStatus:IDrugPrescriptionStatus read Get_prescriptionStatus write Set_prescriptionStatus;
  property availableStrength:IDrugStrength read Get_availableStrength write Set_availableStrength;
  property relatedDrug:IDrug read Get_relatedDrug write Set_relatedDrug;
  property drugClass:IDrugClass read Get_drugClass write Set_drugClass;
  property interactingDrug:IDrug read Get_interactingDrug write Set_interactingDrug;
published
  property warning:String read Get_warning write Set_warning;
  property proprietaryName:String read Get_proprietaryName write Set_proprietaryName;
  property drugUnit:String read Get_drugUnit write Set_drugUnit;
  property dosageForm:String read Get_dosageForm write Set_dosageForm;
  property prescribingInfo:String read Get_prescribingInfo write Set_prescribingInfo;
  property rxcui:String read Get_rxcui write Set_rxcui;
  property pregnancyWarning:String read Get_pregnancyWarning write Set_pregnancyWarning;
  property clincalPharmacology:String read Get_clincalPharmacology write Set_clincalPharmacology;
  property administrationRoute:String read Get_administrationRoute write Set_administrationRoute;
  property breastfeedingWarning:String read Get_breastfeedingWarning write Set_breastfeedingWarning;
  property foodWarning:String read Get_foodWarning write Set_foodWarning;
  property alcoholWarning:String read Get_alcoholWarning write Set_alcoholWarning;
  property labelDetails:String read Get_labelDetails write Set_labelDetails;
  property overdosage:String read Get_overdosage write Set_overdosage;
  property isAvailableGenerically:Boolean read Get_isAvailableGenerically write Set_isAvailableGenerically;
end;

THealthPlanNetwork=Class; //forward

THealthPlanFormulary=Class; //forward


(*HealthInsurancePlan*)
THealthInsurancePlan=Class  (TIntangible,IHealthInsurancePlan)
private
  FincludesHealthPlanNetwork:IHealthPlanNetwork;
  FhealthPlanId:String;
  FhealthPlanDrugTier:String;
  FhealthPlanMarketingUrl:String;
  FusesHealthPlanIdStandard:String;
  FhealthPlanDrugOption:String;
  FincludesHealthPlanFormulary:IHealthPlanFormulary;
  FbenefitsSummaryUrl:String;
protected
  function Get_includesHealthPlanNetwork:IHealthPlanNetwork;virtual;
  procedure Set_includesHealthPlanNetwork(v:IHealthPlanNetwork);virtual;
  function Get_healthPlanId:String;virtual;
  procedure Set_healthPlanId(v:String);virtual;
  function Get_healthPlanDrugTier:String;virtual;
  procedure Set_healthPlanDrugTier(v:String);virtual;
  function Get_healthPlanMarketingUrl:String;virtual;
  procedure Set_healthPlanMarketingUrl(v:String);virtual;
  function Get_usesHealthPlanIdStandard:String;virtual;
  procedure Set_usesHealthPlanIdStandard(v:String);virtual;
  function Get_healthPlanDrugOption:String;virtual;
  procedure Set_healthPlanDrugOption(v:String);virtual;
  function Get_includesHealthPlanFormulary:IHealthPlanFormulary;virtual;
  procedure Set_includesHealthPlanFormulary(v:IHealthPlanFormulary);virtual;
  function Get_benefitsSummaryUrl:String;virtual;
  procedure Set_benefitsSummaryUrl(v:String);virtual;
public
  property includesHealthPlanNetwork:IHealthPlanNetwork read Get_includesHealthPlanNetwork write Set_includesHealthPlanNetwork;
  property includesHealthPlanFormulary:IHealthPlanFormulary read Get_includesHealthPlanFormulary write Set_includesHealthPlanFormulary;
published
  property healthPlanId:String read Get_healthPlanId write Set_healthPlanId;
  property healthPlanDrugTier:String read Get_healthPlanDrugTier write Set_healthPlanDrugTier;
  property healthPlanMarketingUrl:String read Get_healthPlanMarketingUrl write Set_healthPlanMarketingUrl;
  property usesHealthPlanIdStandard:String read Get_usesHealthPlanIdStandard write Set_usesHealthPlanIdStandard;
  property healthPlanDrugOption:String read Get_healthPlanDrugOption write Set_healthPlanDrugOption;
  property benefitsSummaryUrl:String read Get_benefitsSummaryUrl write Set_benefitsSummaryUrl;
end;


(*HealthPlanNetwork*)
THealthPlanNetwork=Class  (TIntangible,IHealthPlanNetwork)
private
  FhealthPlanNetworkTier:String;
  FhealthPlanCostSharing:Boolean;
protected
  function Get_healthPlanNetworkTier:String;virtual;
  procedure Set_healthPlanNetworkTier(v:String);virtual;
  function Get_healthPlanCostSharing:Boolean;virtual;
  procedure Set_healthPlanCostSharing(v:Boolean);virtual;
public
published
  property healthPlanNetworkTier:String read Get_healthPlanNetworkTier write Set_healthPlanNetworkTier;
  property healthPlanCostSharing:Boolean read Get_healthPlanCostSharing write Set_healthPlanCostSharing;
end;


(*HealthPlanFormulary*)
THealthPlanFormulary=Class  (TIntangible,IHealthPlanFormulary)
private
  FoffersPrescriptionByMail:Boolean;
protected
  function Get_offersPrescriptionByMail:Boolean;virtual;
  procedure Set_offersPrescriptionByMail(v:Boolean);virtual;
public
published
  property offersPrescriptionByMail:Boolean read Get_offersPrescriptionByMail write Set_offersPrescriptionByMail;
end;

TDrugCostCategory=Class; //forward


(*DrugCost*)
TDrugCost=Class  (TMedicalEnumeration,IDrugCost)
private
  FcostPerUnit:IQualitativeValue;
  FapplicableLocation:IAdministrativeArea;
  FcostCategory:IDrugCostCategory;
  FcostCurrency:String;
  FcostOrigin:String;
protected
  function Get_costPerUnit:IQualitativeValue;virtual;
  procedure Set_costPerUnit(v:IQualitativeValue);virtual;
  function Get_applicableLocation:IAdministrativeArea;virtual;
  procedure Set_applicableLocation(v:IAdministrativeArea);virtual;
  function Get_costCategory:IDrugCostCategory;virtual;
  procedure Set_costCategory(v:IDrugCostCategory);virtual;
  function Get_costCurrency:String;virtual;
  procedure Set_costCurrency(v:String);virtual;
  function Get_costOrigin:String;virtual;
  procedure Set_costOrigin(v:String);virtual;
public
  property costPerUnit:IQualitativeValue read Get_costPerUnit write Set_costPerUnit;
  property applicableLocation:IAdministrativeArea read Get_applicableLocation write Set_applicableLocation;
  property costCategory:IDrugCostCategory read Get_costCategory write Set_costCategory;
published
  property costCurrency:String read Get_costCurrency write Set_costCurrency;
  property costOrigin:String read Get_costOrigin write Set_costOrigin;
end;


(*DrugCostCategory*)
TDrugCostCategory=Class  (TMedicalEnumeration,IDrugCostCategory)
  function TangDrugCostCategory:TangibleValue;virtual;
end;


(*DrugPregnancyCategory*)
TDrugPregnancyCategory=Class  (TMedicalEnumeration,IDrugPregnancyCategory)
  function TangDrugPregnancyCategory:TangibleValue;virtual;
end;


(*DrugPrescriptionStatus*)
TDrugPrescriptionStatus=Class  (TMedicalEnumeration,IDrugPrescriptionStatus)
  function TangDrugPrescriptionStatus:TangibleValue;virtual;
end;


(*DrugStrength*)
TDrugStrength=Class  (TMedicalIntangible,IDrugStrength)
private
  FstrengthUnit:String;
  FactiveIngredient:String;
  FavailableIn:IAdministrativeArea;
  FstrengthValue:INumber;
protected
  function Get_strengthUnit:String;virtual;
  procedure Set_strengthUnit(v:String);virtual;
  function Get_activeIngredient:String;virtual;
  procedure Set_activeIngredient(v:String);virtual;
  function Get_availableIn:IAdministrativeArea;virtual;
  procedure Set_availableIn(v:IAdministrativeArea);virtual;
  function Get_strengthValue:INumber;virtual;
  procedure Set_strengthValue(v:INumber);virtual;
public
  property availableIn:IAdministrativeArea read Get_availableIn write Set_availableIn;
  property strengthValue:INumber read Get_strengthValue write Set_strengthValue;
published
  property strengthUnit:String read Get_strengthUnit write Set_strengthUnit;
  property activeIngredient:String read Get_activeIngredient write Set_activeIngredient;
end;


(*DrugClass*)
TDrugClass=Class  (TMedicalEnumeration,IDrugClass)
private
  Fdrug:IDrug;
protected
  function Get_drug:IDrug;virtual;
  procedure Set_drug(v:IDrug);virtual;
public
  property drug:IDrug read Get_drug write Set_drug;
published
end;


(*MedicalSignOrSymptom*)
TMedicalSignOrSymptom=Class  (TMedicalCondition,IMedicalSignOrSymptom)
 (*No atribs*)
end;

TPhysicalExam=Class; //forward


(*MedicalSign*)
TMedicalSign=Class  (TMedicalSignOrSymptom,IMedicalSign)
private
  FidentifyingTest:IMedicalTest;
  FidentifyingExam:IPhysicalExam;
protected
  function Get_identifyingTest:IMedicalTest;virtual;
  procedure Set_identifyingTest(v:IMedicalTest);virtual;
  function Get_identifyingExam:IPhysicalExam;virtual;
  procedure Set_identifyingExam(v:IPhysicalExam);virtual;
public
  property identifyingTest:IMedicalTest read Get_identifyingTest write Set_identifyingTest;
  property identifyingExam:IPhysicalExam read Get_identifyingExam write Set_identifyingExam;
published
end;


(*PhysicalExam*)
TPhysicalExam=Class  (TMedicalEnumeration,IPhysicalExam)
  function TangPhysicalExam:TangibleValue;virtual;
end;


(*MedicalCause*)
TMedicalCause=Class  (TMedicalEntity,IMedicalCause)
private
  FcauseOf:IMedicalEntity;
protected
  function Get_causeOf:IMedicalEntity;virtual;
  procedure Set_causeOf(v:IMedicalEntity);virtual;
public
  property causeOf:IMedicalEntity read Get_causeOf write Set_causeOf;
published
end;


(*MedicalStudyStatus*)
TMedicalStudyStatus=Class  (TMedicalEnumeration,IMedicalStudyStatus)
  function TangMedicalStudyStatus:TangibleValue;virtual;
end;

TAnatomicalSystem=Class; //forward


(*AnatomicalStructure*)
TAnatomicalStructure=Class  (TMedicalEntity,IAnatomicalStructure)
private
  FrelatedTherapy:IMedicalTherapy;
  F_function:String;
  FconnectedTo:IAnatomicalStructure;
  Fdiagram:IImageObject;
  FpartOfSystem:IAnatomicalSystem;
  FsubStructure:IAnatomicalStructure;
protected
  function Get_relatedTherapy:IMedicalTherapy;virtual;
  procedure Set_relatedTherapy(v:IMedicalTherapy);virtual;
  function Get__function:String;virtual;
  procedure Set__function(v:String);virtual;
  function Get_connectedTo:IAnatomicalStructure;virtual;
  procedure Set_connectedTo(v:IAnatomicalStructure);virtual;
  function Get_diagram:IImageObject;virtual;
  procedure Set_diagram(v:IImageObject);virtual;
  function Get_partOfSystem:IAnatomicalSystem;virtual;
  procedure Set_partOfSystem(v:IAnatomicalSystem);virtual;
  function Get_subStructure:IAnatomicalStructure;virtual;
  procedure Set_subStructure(v:IAnatomicalStructure);virtual;
public
  property relatedTherapy:IMedicalTherapy read Get_relatedTherapy write Set_relatedTherapy;
  property connectedTo:IAnatomicalStructure read Get_connectedTo write Set_connectedTo;
  property diagram:IImageObject read Get_diagram write Set_diagram;
  property partOfSystem:IAnatomicalSystem read Get_partOfSystem write Set_partOfSystem;
  property subStructure:IAnatomicalStructure read Get_subStructure write Set_subStructure;
published
  property _function:String read Get__function write Set__function;
end;


(*AnatomicalSystem*)
TAnatomicalSystem=Class  (TMedicalEntity,IAnatomicalSystem)
private
  FcomprisedOf:IAnatomicalStructure;
  FassociatedPathophysiology:String;
  FrelatedCondition:IMedicalCondition;
  FrelatedStructure:IAnatomicalStructure;
protected
  function Get_comprisedOf:IAnatomicalStructure;virtual;
  procedure Set_comprisedOf(v:IAnatomicalStructure);virtual;
  function Get_associatedPathophysiology:String;virtual;
  procedure Set_associatedPathophysiology(v:String);virtual;
  function Get_relatedCondition:IMedicalCondition;virtual;
  procedure Set_relatedCondition(v:IMedicalCondition);virtual;
  function Get_relatedStructure:IAnatomicalStructure;virtual;
  procedure Set_relatedStructure(v:IAnatomicalStructure);virtual;
public
  property comprisedOf:IAnatomicalStructure read Get_comprisedOf write Set_comprisedOf;
  property relatedCondition:IMedicalCondition read Get_relatedCondition write Set_relatedCondition;
  property relatedStructure:IAnatomicalStructure read Get_relatedStructure write Set_relatedStructure;
published
  property associatedPathophysiology:String read Get_associatedPathophysiology write Set_associatedPathophysiology;
end;


(*MedicalRiskFactor*)
TMedicalRiskFactor=Class  (TMedicalEntity,IMedicalRiskFactor)
private
  FincreasesRiskOf:IMedicalEntity;
protected
  function Get_increasesRiskOf:IMedicalEntity;virtual;
  procedure Set_increasesRiskOf(v:IMedicalEntity);virtual;
public
  property increasesRiskOf:IMedicalEntity read Get_increasesRiskOf write Set_increasesRiskOf;
published
end;


(*DDxElement*)
TDDxElement=Class  (TMedicalIntangible,IDDxElement)
private
  Fdiagnosis:IMedicalCondition;
  FdistinguishingSign:IMedicalSignOrSymptom;
protected
  function Get_diagnosis:IMedicalCondition;virtual;
  procedure Set_diagnosis(v:IMedicalCondition);virtual;
  function Get_distinguishingSign:IMedicalSignOrSymptom;virtual;
  procedure Set_distinguishingSign(v:IMedicalSignOrSymptom);virtual;
public
  property diagnosis:IMedicalCondition read Get_diagnosis write Set_diagnosis;
  property distinguishingSign:IMedicalSignOrSymptom read Get_distinguishingSign write Set_distinguishingSign;
published
end;


(*MedicalConditionStage*)
TMedicalConditionStage=Class  (TMedicalIntangible,IMedicalConditionStage)
private
  FstageAsNumber:INumber;
  FsubStageSuffix:String;
protected
  function Get_stageAsNumber:INumber;virtual;
  procedure Set_stageAsNumber(v:INumber);virtual;
  function Get_subStageSuffix:String;virtual;
  procedure Set_subStageSuffix(v:String);virtual;
public
  property stageAsNumber:INumber read Get_stageAsNumber write Set_stageAsNumber;
published
  property subStageSuffix:String read Get_subStageSuffix write Set_subStageSuffix;
end;


(*Specialty*)
TSpecialty=Class  (TEnumeration,ISpecialty)
  function TangSpecialty:TangibleValue;virtual;
end;


(*MedicalSpecialty*)
TMedicalSpecialty=Class  (TSpecialty,IMedicalSpecialty)
  function TangMedicalSpecialty:TangibleValue;virtual;
end;


(*BloodTest*)
TBloodTest=Class  (TMedicalTest,IBloodTest)
 (*No atribs*)
end;


(*Store*)
TStore=Class  (TLocalBusiness,IStore)
 (*No atribs*)
end;


(*OutletStore*)
TOutletStore=Class  (TStore,IOutletStore)
 (*No atribs*)
end;

TCreativeWorkSeason=Class; //forward


(*Clip*)
TClip=Class  (TCreativeWork,IClip)
private
  FpartOfEpisode:IEpisode;
  FclipNumber:String;
  FpartOfSeason:ICreativeWorkSeason;
  Fdirectors:IPerson;
protected
  function Get_partOfEpisode:IEpisode;virtual;
  procedure Set_partOfEpisode(v:IEpisode);virtual;
  function Get_clipNumber:String;virtual;
  procedure Set_clipNumber(v:String);virtual;
  function Get_partOfSeason:ICreativeWorkSeason;virtual;
  procedure Set_partOfSeason(v:ICreativeWorkSeason);virtual;
  function Get_directors:IPerson;virtual;
  procedure Set_directors(v:IPerson);virtual;
public
  property partOfEpisode:IEpisode read Get_partOfEpisode write Set_partOfEpisode;
  property partOfSeason:ICreativeWorkSeason read Get_partOfSeason write Set_partOfSeason;
  property directors:IPerson read Get_directors write Set_directors;
published
  property clipNumber:String read Get_clipNumber write Set_clipNumber;
end;


(*CreativeWorkSeason*)
TCreativeWorkSeason=Class  (TCreativeWork,ICreativeWorkSeason)
private
  Fepisodes:IEpisode;
  FseasonNumber:Integer;
protected
  function Get_episodes:IEpisode;virtual;
  procedure Set_episodes(v:IEpisode);virtual;
  function Get_seasonNumber:Integer;virtual;
  procedure Set_seasonNumber(v:Integer);virtual;
public
  property episodes:IEpisode read Get_episodes write Set_episodes;
published
  property seasonNumber:Integer read Get_seasonNumber write Set_seasonNumber;
end;


(*VideoGameClip*)
TVideoGameClip=Class  (TClip,IVideoGameClip)
 (*No atribs*)
end;


(*SurgicalProcedure*)
TSurgicalProcedure=Class  (TMedicalProcedure,ISurgicalProcedure)
 (*No atribs*)
end;


(*DepartmentStore*)
TDepartmentStore=Class  (TStore,IDepartmentStore)
 (*No atribs*)
end;


(*ToyStore*)
TToyStore=Class  (TStore,IToyStore)
 (*No atribs*)
end;


(*Library*)
TLibrary=Class  (TLocalBusiness,ILibrary)
 (*No atribs*)
end;


(*HighSchool*)
THighSchool=Class  (TEducationalOrganization,IHighSchool)
 (*No atribs*)
end;


(*LegalService*)
TLegalService=Class  (TLocalBusiness,ILegalService)
 (*No atribs*)
end;


(*Notary*)
TNotary=Class  (TLegalService,INotary)
 (*No atribs*)
end;


(*MovieClip*)
TMovieClip=Class  (TClip,IMovieClip)
 (*No atribs*)
end;


(*ConsumeAction*)
TConsumeAction=Class  (TAction,IConsumeAction)
private
  FexpectsAcceptanceOf:IOffer;
protected
  function Get_expectsAcceptanceOf:IOffer;virtual;
  procedure Set_expectsAcceptanceOf(v:IOffer);virtual;
public
  property expectsAcceptanceOf:IOffer read Get_expectsAcceptanceOf write Set_expectsAcceptanceOf;
published
end;


(*DrinkAction*)
TDrinkAction=Class  (TConsumeAction,IDrinkAction)
 (*No atribs*)
end;


(*CivicStructure*)
TCivicStructure=Class  (TPlace,ICivicStructure)
 (*No atribs*)
end;


(*GovernmentBuilding*)
TGovernmentBuilding=Class  (TCivicStructure,IGovernmentBuilding)
 (*No atribs*)
end;


(*CityHall*)
TCityHall=Class  (TGovernmentBuilding,ICityHall)
 (*No atribs*)
end;


(*SportsActivityLocation*)
TSportsActivityLocation=Class  (TLocalBusiness,ISportsActivityLocation)
 (*No atribs*)
end;


(*ExerciseGym*)
TExerciseGym=Class  (TSportsActivityLocation,IExerciseGym)
 (*No atribs*)
end;


(*ElementarySchool*)
TElementarySchool=Class  (TEducationalOrganization,IElementarySchool)
 (*No atribs*)
end;


(*OrganizeAction*)
TOrganizeAction=Class  (TAction,IOrganizeAction)
 (*No atribs*)
end;


(*AllocateAction*)
TAllocateAction=Class  (TOrganizeAction,IAllocateAction)
 (*No atribs*)
end;


(*AssignAction*)
TAssignAction=Class  (TAllocateAction,IAssignAction)
 (*No atribs*)
end;


(*EntertainmentBusiness*)
TEntertainmentBusiness=Class  (TLocalBusiness,IEntertainmentBusiness)
 (*No atribs*)
end;


(*Casino*)
TCasino=Class  (TEntertainmentBusiness,ICasino)
 (*No atribs*)
end;


(*MoveAction*)
TMoveAction=Class  (TAction,IMoveAction)
private
  FtoLocation:IPlace;
protected
  function Get_toLocation:IPlace;virtual;
  procedure Set_toLocation(v:IPlace);virtual;
public
  property toLocation:IPlace read Get_toLocation write Set_toLocation;
published
end;


(*DepartAction*)
TDepartAction=Class  (TMoveAction,IDepartAction)
 (*No atribs*)
end;


(*TelevisionChannel*)
TTelevisionChannel=Class  (TBroadcastChannel,ITelevisionChannel)
  function TangTelevisionChannel:TangibleValue;virtual;
end;


(*HobbyShop*)
THobbyShop=Class  (TStore,IHobbyShop)
 (*No atribs*)
end;


(*UserInteraction*)
TUserInteraction=Class  (TEvent,IUserInteraction)
 (*No atribs*)
end;


(*UserLikes*)
TUserLikes=Class  (TUserInteraction,IUserLikes)
 (*No atribs*)
end;


(*Float*)
TFloat=Class  (TNumber,IFloat)
 (*No atribs*)
end;


(*Ligament*)
TLigament=Class  (TAnatomicalStructure,ILigament)
 (*No atribs*)
end;


(*HealthAndBeautyBusiness*)
THealthAndBeautyBusiness=Class  (TLocalBusiness,IHealthAndBeautyBusiness)
 (*No atribs*)
end;


(*TattooParlor*)
TTattooParlor=Class  (THealthAndBeautyBusiness,ITattooParlor)
 (*No atribs*)
end;


(*WebPageElement*)
TWebPageElement=Class  (TCreativeWork,IWebPageElement)
 (*No atribs*)
end;


(*WPAdBlock*)
TWPAdBlock=Class  (TWebPageElement,IWPAdBlock)
 (*No atribs*)
end;


(*ApplyAction*)
TApplyAction=Class  (TOrganizeAction,IApplyAction)
 (*No atribs*)
end;


(*TheaterEvent*)
TTheaterEvent=Class  (TEvent,ITheaterEvent)
 (*No atribs*)
end;


(*WatchAction*)
TWatchAction=Class  (TConsumeAction,IWatchAction)
 (*No atribs*)
end;


(*TouristAttraction*)
TTouristAttraction=Class  (TPlace,ITouristAttraction)
 (*No atribs*)
end;


(*Landform*)
TLandform=Class  (TPlace,ILandform)
 (*No atribs*)
end;


(*Continent*)
TContinent=Class  (TLandform,IContinent)
 (*No atribs*)
end;


(*ControlAction*)
TControlAction=Class  (TAction,IControlAction)
 (*No atribs*)
end;


(*ResumeAction*)
TResumeAction=Class  (TControlAction,IResumeAction)
 (*No atribs*)
end;


(*Atlas*)
TAtlas=Class  (TCreativeWork,IAtlas)
 (*No atribs*)
end;


(*DanceEvent*)
TDanceEvent=Class  (TEvent,IDanceEvent)
 (*No atribs*)
end;


(*LodgingBusiness*)
TLodgingBusiness=Class  (TLocalBusiness,ILodgingBusiness)
private
  FpetsAllowed:Boolean;
  FcheckoutTime:TDateTime;
  FcheckinTime:TDateTime;
  FstarRating:IRating;
protected
  function Get_petsAllowed:Boolean;virtual;
  procedure Set_petsAllowed(v:Boolean);virtual;
  function Get_checkoutTime:TDateTime;virtual;
  procedure Set_checkoutTime(v:TDateTime);virtual;
  function Get_checkinTime:TDateTime;virtual;
  procedure Set_checkinTime(v:TDateTime);virtual;
  function Get_starRating:IRating;virtual;
  procedure Set_starRating(v:IRating);virtual;
public
  property starRating:IRating read Get_starRating write Set_starRating;
published
  property petsAllowed:Boolean read Get_petsAllowed write Set_petsAllowed;
  property checkoutTime:TDateTime read Get_checkoutTime write Set_checkoutTime;
  property checkinTime:TDateTime read Get_checkinTime write Set_checkinTime;
end;


(*Hotel*)
THotel=Class  (TLodgingBusiness,IHotel)
 (*No atribs*)
end;


(*MusicEvent*)
TMusicEvent=Class  (TEvent,IMusicEvent)
 (*No atribs*)
end;


(*BowlingAlley*)
TBowlingAlley=Class  (TSportsActivityLocation,IBowlingAlley)
 (*No atribs*)
end;


(*CreateAction*)
TCreateAction=Class  (TAction,ICreateAction)
 (*No atribs*)
end;


(*FilmAction*)
TFilmAction=Class  (TCreateAction,IFilmAction)
 (*No atribs*)
end;

TProgramMembership=Class; //forward

TTicket=Class; //forward

TReservationStatusType=Class; //forward


(*Reservation*)
TReservation=Class  (TIntangible,IReservation)
private
  FtotalPrice:String;
  FreservationId:String;
  FmodifiedTime:TDateTime;
  FprogramMembershipUsed:IProgramMembership;
  FbookingTime:TDateTime;
  FreservedTicket:ITicket;
  FreservationFor:IThing;
  FbookingAgent:IOrganization;
  FreservationStatus:IReservationStatusType;
protected
  function Get_totalPrice:String;virtual;
  procedure Set_totalPrice(v:String);virtual;
  function Get_reservationId:String;virtual;
  procedure Set_reservationId(v:String);virtual;
  function Get_modifiedTime:TDateTime;virtual;
  procedure Set_modifiedTime(v:TDateTime);virtual;
  function Get_programMembershipUsed:IProgramMembership;virtual;
  procedure Set_programMembershipUsed(v:IProgramMembership);virtual;
  function Get_bookingTime:TDateTime;virtual;
  procedure Set_bookingTime(v:TDateTime);virtual;
  function Get_reservedTicket:ITicket;virtual;
  procedure Set_reservedTicket(v:ITicket);virtual;
  function Get_reservationFor:IThing;virtual;
  procedure Set_reservationFor(v:IThing);virtual;
  function Get_bookingAgent:IOrganization;virtual;
  procedure Set_bookingAgent(v:IOrganization);virtual;
  function Get_reservationStatus:IReservationStatusType;virtual;
  procedure Set_reservationStatus(v:IReservationStatusType);virtual;
public
  property programMembershipUsed:IProgramMembership read Get_programMembershipUsed write Set_programMembershipUsed;
  property reservedTicket:ITicket read Get_reservedTicket write Set_reservedTicket;
  property reservationFor:IThing read Get_reservationFor write Set_reservationFor;
  property bookingAgent:IOrganization read Get_bookingAgent write Set_bookingAgent;
  property reservationStatus:IReservationStatusType read Get_reservationStatus write Set_reservationStatus;
published
  property totalPrice:String read Get_totalPrice write Set_totalPrice;
  property reservationId:String read Get_reservationId write Set_reservationId;
  property modifiedTime:TDateTime read Get_modifiedTime write Set_modifiedTime;
  property bookingTime:TDateTime read Get_bookingTime write Set_bookingTime;
end;


(*ProgramMembership*)
TProgramMembership=Class  (TIntangible,IProgramMembership)
private
  FhostingOrganization:IOrganization;
  FprogramName:String;
  FmembershipNumber:String;
protected
  function Get_hostingOrganization:IOrganization;virtual;
  procedure Set_hostingOrganization(v:IOrganization);virtual;
  function Get_programName:String;virtual;
  procedure Set_programName(v:String);virtual;
  function Get_membershipNumber:String;virtual;
  procedure Set_membershipNumber(v:String);virtual;
public
  property hostingOrganization:IOrganization read Get_hostingOrganization write Set_hostingOrganization;
published
  property programName:String read Get_programName write Set_programName;
  property membershipNumber:String read Get_membershipNumber write Set_membershipNumber;
end;

TSeat=Class; //forward


(*Ticket*)
TTicket=Class  (TIntangible,ITicket)
private
  FticketToken:String;
  FticketedSeat:ISeat;
  FticketNumber:String;
  FunderName:IOrganization;
  FdateIssued:TDateTime;
protected
  function Get_ticketToken:String;virtual;
  procedure Set_ticketToken(v:String);virtual;
  function Get_ticketedSeat:ISeat;virtual;
  procedure Set_ticketedSeat(v:ISeat);virtual;
  function Get_ticketNumber:String;virtual;
  procedure Set_ticketNumber(v:String);virtual;
  function Get_underName:IOrganization;virtual;
  procedure Set_underName(v:IOrganization);virtual;
  function Get_dateIssued:TDateTime;virtual;
  procedure Set_dateIssued(v:TDateTime);virtual;
public
  property ticketedSeat:ISeat read Get_ticketedSeat write Set_ticketedSeat;
  property underName:IOrganization read Get_underName write Set_underName;
published
  property ticketToken:String read Get_ticketToken write Set_ticketToken;
  property ticketNumber:String read Get_ticketNumber write Set_ticketNumber;
  property dateIssued:TDateTime read Get_dateIssued write Set_dateIssued;
end;


(*Seat*)
TSeat=Class  (TIntangible,ISeat)
private
  FseatRow:String;
  FseatNumber:String;
  FseatSection:String;
  FseatingType:IQualitativeValue;
protected
  function Get_seatRow:String;virtual;
  procedure Set_seatRow(v:String);virtual;
  function Get_seatNumber:String;virtual;
  procedure Set_seatNumber(v:String);virtual;
  function Get_seatSection:String;virtual;
  procedure Set_seatSection(v:String);virtual;
  function Get_seatingType:IQualitativeValue;virtual;
  procedure Set_seatingType(v:IQualitativeValue);virtual;
public
  property seatingType:IQualitativeValue read Get_seatingType write Set_seatingType;
published
  property seatRow:String read Get_seatRow write Set_seatRow;
  property seatNumber:String read Get_seatNumber write Set_seatNumber;
  property seatSection:String read Get_seatSection write Set_seatSection;
end;


(*ReservationStatusType*)
TReservationStatusType=Class  (TEnumeration,IReservationStatusType)
  function TangReservationStatusType:TangibleValue;virtual;
end;


(*BusReservation*)
TBusReservation=Class  (TReservation,IBusReservation)
  function TangBusReservation:TangibleValue;virtual;
end;


(*Taxi*)
TTaxi=Class  (TService,ITaxi)
  function TangTaxi:TangibleValue;virtual;
end;


(*OfficeEquipmentStore*)
TOfficeEquipmentStore=Class  (TStore,IOfficeEquipmentStore)
 (*No atribs*)
end;


(*LiquorStore*)
TLiquorStore=Class  (TStore,ILiquorStore)
 (*No atribs*)
end;


(*Embassy*)
TEmbassy=Class  (TGovernmentBuilding,IEmbassy)
 (*No atribs*)
end;

TDriveWheelConfigurationValue=Class; //forward

TSteeringPositionValue=Class; //forward

TEngineSpecification=Class; //forward


(*Vehicle*)
TVehicle=Class  (TProduct,IVehicle)
private
  FnumberOfPreviousOwners:INumber;
  FmeetsEmissionStandard:IQualitativeValue;
  FdriveWheelConfiguration:IDriveWheelConfigurationValue;
  FfuelConsumption:IQuantitativeValue;
  Fwheelbase:IQuantitativeValue;
  FvehicleInteriorType:String;
  FmodelDate:TDateTime;
  FknownVehicleDamages:String;
  FbodyType:String;
  FvehicleInteriorColor:String;
  FvehicleSpecialUsage:String;
  FproductionDate:TDateTime;
  FmileageFromOdometer:IQuantitativeValue;
  FvehicleModelDate:TDateTime;
  FnumberOfAirbags:INumber;
  FseatingCapacity:IQuantitativeValue;
  FsteeringPosition:ISteeringPositionValue;
  FdateVehicleFirstRegistered:TDateTime;
  FnumberOfDoors:INumber;
  FweightTotal:IQuantitativeValue;
  FnumberOfForwardGears:INumber;
  FtongueWeight:IQuantitativeValue;
  FvehicleConfiguration:String;
  FfuelEfficiency:IQuantitativeValue;
  FcargoVolume:IQuantitativeValue;
  FvehicleTransmission:IQualitativeValue;
  FvehicleSeatingCapacity:IQuantitativeValue;
  FaccelerationTime:IQuantitativeValue;
  FpurchaseDate:TDateTime;
  Fpayload:IQuantitativeValue;
  FfuelCapacity:IQuantitativeValue;
  FvehicleEngine:IEngineSpecification;
  FemissionsCO2:INumber;
  FnumberOfAxles:INumber;
  Fspeed:IQuantitativeValue;
  FvehicleIdentificationNumber:String;
  FtrailerWeight:IQuantitativeValue;
protected
  function Get_numberOfPreviousOwners:INumber;virtual;
  procedure Set_numberOfPreviousOwners(v:INumber);virtual;
  function Get_meetsEmissionStandard:IQualitativeValue;virtual;
  procedure Set_meetsEmissionStandard(v:IQualitativeValue);virtual;
  function Get_driveWheelConfiguration:IDriveWheelConfigurationValue;virtual;
  procedure Set_driveWheelConfiguration(v:IDriveWheelConfigurationValue);virtual;
  function Get_fuelConsumption:IQuantitativeValue;virtual;
  procedure Set_fuelConsumption(v:IQuantitativeValue);virtual;
  function Get_wheelbase:IQuantitativeValue;virtual;
  procedure Set_wheelbase(v:IQuantitativeValue);virtual;
  function Get_vehicleInteriorType:String;virtual;
  procedure Set_vehicleInteriorType(v:String);virtual;
  function Get_modelDate:TDateTime;virtual;
  procedure Set_modelDate(v:TDateTime);virtual;
  function Get_knownVehicleDamages:String;virtual;
  procedure Set_knownVehicleDamages(v:String);virtual;
  function Get_bodyType:String;virtual;
  procedure Set_bodyType(v:String);virtual;
  function Get_vehicleInteriorColor:String;virtual;
  procedure Set_vehicleInteriorColor(v:String);virtual;
  function Get_vehicleSpecialUsage:String;virtual;
  procedure Set_vehicleSpecialUsage(v:String);virtual;
  function Get_productionDate:TDateTime;virtual;
  procedure Set_productionDate(v:TDateTime);virtual;
  function Get_mileageFromOdometer:IQuantitativeValue;virtual;
  procedure Set_mileageFromOdometer(v:IQuantitativeValue);virtual;
  function Get_vehicleModelDate:TDateTime;virtual;
  procedure Set_vehicleModelDate(v:TDateTime);virtual;
  function Get_numberOfAirbags:INumber;virtual;
  procedure Set_numberOfAirbags(v:INumber);virtual;
  function Get_seatingCapacity:IQuantitativeValue;virtual;
  procedure Set_seatingCapacity(v:IQuantitativeValue);virtual;
  function Get_steeringPosition:ISteeringPositionValue;virtual;
  procedure Set_steeringPosition(v:ISteeringPositionValue);virtual;
  function Get_dateVehicleFirstRegistered:TDateTime;virtual;
  procedure Set_dateVehicleFirstRegistered(v:TDateTime);virtual;
  function Get_numberOfDoors:INumber;virtual;
  procedure Set_numberOfDoors(v:INumber);virtual;
  function Get_weightTotal:IQuantitativeValue;virtual;
  procedure Set_weightTotal(v:IQuantitativeValue);virtual;
  function Get_numberOfForwardGears:INumber;virtual;
  procedure Set_numberOfForwardGears(v:INumber);virtual;
  function Get_tongueWeight:IQuantitativeValue;virtual;
  procedure Set_tongueWeight(v:IQuantitativeValue);virtual;
  function Get_vehicleConfiguration:String;virtual;
  procedure Set_vehicleConfiguration(v:String);virtual;
  function Get_fuelEfficiency:IQuantitativeValue;virtual;
  procedure Set_fuelEfficiency(v:IQuantitativeValue);virtual;
  function Get_cargoVolume:IQuantitativeValue;virtual;
  procedure Set_cargoVolume(v:IQuantitativeValue);virtual;
  function Get_vehicleTransmission:IQualitativeValue;virtual;
  procedure Set_vehicleTransmission(v:IQualitativeValue);virtual;
  function Get_vehicleSeatingCapacity:IQuantitativeValue;virtual;
  procedure Set_vehicleSeatingCapacity(v:IQuantitativeValue);virtual;
  function Get_accelerationTime:IQuantitativeValue;virtual;
  procedure Set_accelerationTime(v:IQuantitativeValue);virtual;
  function Get_purchaseDate:TDateTime;virtual;
  procedure Set_purchaseDate(v:TDateTime);virtual;
  function Get_payload:IQuantitativeValue;virtual;
  procedure Set_payload(v:IQuantitativeValue);virtual;
  function Get_fuelCapacity:IQuantitativeValue;virtual;
  procedure Set_fuelCapacity(v:IQuantitativeValue);virtual;
  function Get_vehicleEngine:IEngineSpecification;virtual;
  procedure Set_vehicleEngine(v:IEngineSpecification);virtual;
  function Get_emissionsCO2:INumber;virtual;
  procedure Set_emissionsCO2(v:INumber);virtual;
  function Get_numberOfAxles:INumber;virtual;
  procedure Set_numberOfAxles(v:INumber);virtual;
  function Get_speed:IQuantitativeValue;virtual;
  procedure Set_speed(v:IQuantitativeValue);virtual;
  function Get_vehicleIdentificationNumber:String;virtual;
  procedure Set_vehicleIdentificationNumber(v:String);virtual;
  function Get_trailerWeight:IQuantitativeValue;virtual;
  procedure Set_trailerWeight(v:IQuantitativeValue);virtual;
public
  property numberOfPreviousOwners:INumber read Get_numberOfPreviousOwners write Set_numberOfPreviousOwners;
  property meetsEmissionStandard:IQualitativeValue read Get_meetsEmissionStandard write Set_meetsEmissionStandard;
  property driveWheelConfiguration:IDriveWheelConfigurationValue read Get_driveWheelConfiguration write Set_driveWheelConfiguration;
  property fuelConsumption:IQuantitativeValue read Get_fuelConsumption write Set_fuelConsumption;
  property wheelbase:IQuantitativeValue read Get_wheelbase write Set_wheelbase;
  property mileageFromOdometer:IQuantitativeValue read Get_mileageFromOdometer write Set_mileageFromOdometer;
  property numberOfAirbags:INumber read Get_numberOfAirbags write Set_numberOfAirbags;
  property seatingCapacity:IQuantitativeValue read Get_seatingCapacity write Set_seatingCapacity;
  property steeringPosition:ISteeringPositionValue read Get_steeringPosition write Set_steeringPosition;
  property numberOfDoors:INumber read Get_numberOfDoors write Set_numberOfDoors;
  property weightTotal:IQuantitativeValue read Get_weightTotal write Set_weightTotal;
  property numberOfForwardGears:INumber read Get_numberOfForwardGears write Set_numberOfForwardGears;
  property tongueWeight:IQuantitativeValue read Get_tongueWeight write Set_tongueWeight;
  property fuelEfficiency:IQuantitativeValue read Get_fuelEfficiency write Set_fuelEfficiency;
  property cargoVolume:IQuantitativeValue read Get_cargoVolume write Set_cargoVolume;
  property vehicleTransmission:IQualitativeValue read Get_vehicleTransmission write Set_vehicleTransmission;
  property vehicleSeatingCapacity:IQuantitativeValue read Get_vehicleSeatingCapacity write Set_vehicleSeatingCapacity;
  property accelerationTime:IQuantitativeValue read Get_accelerationTime write Set_accelerationTime;
  property payload:IQuantitativeValue read Get_payload write Set_payload;
  property fuelCapacity:IQuantitativeValue read Get_fuelCapacity write Set_fuelCapacity;
  property vehicleEngine:IEngineSpecification read Get_vehicleEngine write Set_vehicleEngine;
  property emissionsCO2:INumber read Get_emissionsCO2 write Set_emissionsCO2;
  property numberOfAxles:INumber read Get_numberOfAxles write Set_numberOfAxles;
  property speed:IQuantitativeValue read Get_speed write Set_speed;
  property trailerWeight:IQuantitativeValue read Get_trailerWeight write Set_trailerWeight;
published
  property vehicleInteriorType:String read Get_vehicleInteriorType write Set_vehicleInteriorType;
  property modelDate:TDateTime read Get_modelDate write Set_modelDate;
  property knownVehicleDamages:String read Get_knownVehicleDamages write Set_knownVehicleDamages;
  property bodyType:String read Get_bodyType write Set_bodyType;
  property vehicleInteriorColor:String read Get_vehicleInteriorColor write Set_vehicleInteriorColor;
  property vehicleSpecialUsage:String read Get_vehicleSpecialUsage write Set_vehicleSpecialUsage;
  property productionDate:TDateTime read Get_productionDate write Set_productionDate;
  property vehicleModelDate:TDateTime read Get_vehicleModelDate write Set_vehicleModelDate;
  property dateVehicleFirstRegistered:TDateTime read Get_dateVehicleFirstRegistered write Set_dateVehicleFirstRegistered;
  property vehicleConfiguration:String read Get_vehicleConfiguration write Set_vehicleConfiguration;
  property purchaseDate:TDateTime read Get_purchaseDate write Set_purchaseDate;
  property vehicleIdentificationNumber:String read Get_vehicleIdentificationNumber write Set_vehicleIdentificationNumber;
end;


(*DriveWheelConfigurationValue*)
TDriveWheelConfigurationValue=Class  (TQualitativeValue,IDriveWheelConfigurationValue)
  function TangDriveWheelConfigurationValue:TangibleValue;virtual;
end;


(*SteeringPositionValue*)
TSteeringPositionValue=Class  (TQualitativeValue,ISteeringPositionValue)
  function TangSteeringPositionValue:TangibleValue;virtual;
end;


(*EngineSpecification*)
TEngineSpecification=Class  (TStructuredValue,IEngineSpecification)
private
  FenginePower:IQuantitativeValue;
  FengineDisplacement:IQuantitativeValue;
  FfuelType:String;
  FengineType:String;
  Ftorque:IQuantitativeValue;
protected
  function Get_enginePower:IQuantitativeValue;virtual;
  procedure Set_enginePower(v:IQuantitativeValue);virtual;
  function Get_engineDisplacement:IQuantitativeValue;virtual;
  procedure Set_engineDisplacement(v:IQuantitativeValue);virtual;
  function Get_fuelType:String;virtual;
  procedure Set_fuelType(v:String);virtual;
  function Get_engineType:String;virtual;
  procedure Set_engineType(v:String);virtual;
  function Get_torque:IQuantitativeValue;virtual;
  procedure Set_torque(v:IQuantitativeValue);virtual;
public
  property enginePower:IQuantitativeValue read Get_enginePower write Set_enginePower;
  property engineDisplacement:IQuantitativeValue read Get_engineDisplacement write Set_engineDisplacement;
  property torque:IQuantitativeValue read Get_torque write Set_torque;
published
  property fuelType:String read Get_fuelType write Set_fuelType;
  property engineType:String read Get_engineType write Set_engineType;
end;


(*Motorcycle*)
TMotorcycle=Class  (TVehicle,IMotorcycle)
 (*No atribs*)
end;


(*BodyOfWater*)
TBodyOfWater=Class  (TLandform,IBodyOfWater)
 (*No atribs*)
end;


(*Canal*)
TCanal=Class  (TBodyOfWater,ICanal)
 (*No atribs*)
end;


(*ViewAction*)
TViewAction=Class  (TConsumeAction,IViewAction)
 (*No atribs*)
end;


(*PawnShop*)
TPawnShop=Class  (TStore,IPawnShop)
 (*No atribs*)
end;


(*HairSalon*)
THairSalon=Class  (THealthAndBeautyBusiness,IHairSalon)
 (*No atribs*)
end;

TBreadcrumbList=Class; //forward


(*WebPage*)
TWebPage=Class  (TCreativeWork,IWebPage)
private
  FprimaryImageOfPage:IImageObject;
  Fbreadcrumb:IBreadcrumbList;
  FsignificantLinks:String;
  FrelatedLink:String;
  FreviewedBy:IPerson;
  Fspecialty:ISpecialty;
  FlastReviewed:TDateTime;
protected
  function Get_primaryImageOfPage:IImageObject;virtual;
  procedure Set_primaryImageOfPage(v:IImageObject);virtual;
  function Get_breadcrumb:IBreadcrumbList;virtual;
  procedure Set_breadcrumb(v:IBreadcrumbList);virtual;
  function Get_significantLinks:String;virtual;
  procedure Set_significantLinks(v:String);virtual;
  function Get_relatedLink:String;virtual;
  procedure Set_relatedLink(v:String);virtual;
  function Get_reviewedBy:IPerson;virtual;
  procedure Set_reviewedBy(v:IPerson);virtual;
  function Get_specialty:ISpecialty;virtual;
  procedure Set_specialty(v:ISpecialty);virtual;
  function Get_lastReviewed:TDateTime;virtual;
  procedure Set_lastReviewed(v:TDateTime);virtual;
public
  property primaryImageOfPage:IImageObject read Get_primaryImageOfPage write Set_primaryImageOfPage;
  property breadcrumb:IBreadcrumbList read Get_breadcrumb write Set_breadcrumb;
  property reviewedBy:IPerson read Get_reviewedBy write Set_reviewedBy;
  property specialty:ISpecialty read Get_specialty write Set_specialty;
published
  property significantLinks:String read Get_significantLinks write Set_significantLinks;
  property relatedLink:String read Get_relatedLink write Set_relatedLink;
  property lastReviewed:TDateTime read Get_lastReviewed write Set_lastReviewed;
end;


(*BreadcrumbList*)
TBreadcrumbList=Class  (TItemList,IBreadcrumbList)
  function TangBreadcrumbList:TangibleValue;virtual;
end;


(*ItemPage*)
TItemPage=Class  (TWebPage,IItemPage)
 (*No atribs*)
end;


(*InteractAction*)
TInteractAction=Class  (TAction,IInteractAction)
 (*No atribs*)
end;


(*CommunicateAction*)
TCommunicateAction=Class  (TInteractAction,ICommunicateAction)
 (*No atribs*)
end;


(*ShareAction*)
TShareAction=Class  (TCommunicateAction,IShareAction)
 (*No atribs*)
end;


(*Painting*)
TPainting=Class  (TCreativeWork,IPainting)
 (*No atribs*)
end;


(*FinancialService*)
TFinancialService=Class  (TLocalBusiness,IFinancialService)
private
  FfeesAndCommissionsSpecification:String;
protected
  function Get_feesAndCommissionsSpecification:String;virtual;
  procedure Set_feesAndCommissionsSpecification(v:String);virtual;
public
published
  property feesAndCommissionsSpecification:String read Get_feesAndCommissionsSpecification write Set_feesAndCommissionsSpecification;
end;


(*InsuranceAgency*)
TInsuranceAgency=Class  (TFinancialService,IInsuranceAgency)
 (*No atribs*)
end;


(*ContactPage*)
TContactPage=Class  (TWebPage,IContactPage)
 (*No atribs*)
end;


(*UserPlays*)
TUserPlays=Class  (TUserInteraction,IUserPlays)
 (*No atribs*)
end;


(*PsychologicalTreatment*)
TPsychologicalTreatment=Class  (TTherapeuticProcedure,IPsychologicalTreatment)
 (*No atribs*)
end;


(*Zoo*)
TZoo=Class  (TCivicStructure,IZoo)
 (*No atribs*)
end;


(*MarryAction*)
TMarryAction=Class  (TInteractAction,IMarryAction)
 (*No atribs*)
end;


(*FireStation*)
TFireStation=Class  (TCivicStructure,IFireStation)
 (*No atribs*)
end;


(*SubwayStation*)
TSubwayStation=Class  (TCivicStructure,ISubwayStation)
 (*No atribs*)
end;


(*EventSeries*)
TEventSeries=Class  (TEvent,IEventSeries)
 (*No atribs*)
end;


(*Volcano*)
TVolcano=Class  (TLandform,IVolcano)
 (*No atribs*)
end;


(*AutomotiveBusiness*)
TAutomotiveBusiness=Class  (TLocalBusiness,IAutomotiveBusiness)
 (*No atribs*)
end;


(*AutoWash*)
TAutoWash=Class  (TAutomotiveBusiness,IAutoWash)
 (*No atribs*)
end;


(*GardenStore*)
TGardenStore=Class  (TStore,IGardenStore)
 (*No atribs*)
end;


(*UserBlocks*)
TUserBlocks=Class  (TUserInteraction,IUserBlocks)
 (*No atribs*)
end;


(*GoodRelationsClass*)
TGoodRelationsClass=Class  (TDeliveryMethod,IGoodRelationsClass)
  function TangGoodRelationsClass:TangibleValue;virtual;
end;


(*Code*)
TCode=Class  (TCreativeWork,ICode)
 (*No atribs*)
end;


(*TransferAction*)
TTransferAction=Class  (TAction,ITransferAction)
 (*No atribs*)
end;


(*DownloadAction*)
TDownloadAction=Class  (TTransferAction,IDownloadAction)
 (*No atribs*)
end;


(*OceanBodyOfWater*)
TOceanBodyOfWater=Class  (TBodyOfWater,IOceanBodyOfWater)
 (*No atribs*)
end;


(*AssessAction*)
TAssessAction=Class  (TAction,IAssessAction)
 (*No atribs*)
end;


(*ReactAction*)
TReactAction=Class  (TAssessAction,IReactAction)
 (*No atribs*)
end;


(*WantAction*)
TWantAction=Class  (TReactAction,IWantAction)
 (*No atribs*)
end;


(*VitalSign*)
TVitalSign=Class  (TMedicalSign,IVitalSign)
 (*No atribs*)
end;


(*PerformingGroup*)
TPerformingGroup=Class  (TOrganization,IPerformingGroup)
 (*No atribs*)
end;


(*DanceGroup*)
TDanceGroup=Class  (TPerformingGroup,IDanceGroup)
 (*No atribs*)
end;


(*Florist*)
TFlorist=Class  (TStore,IFlorist)
 (*No atribs*)
end;


(*WPSideBar*)
TWPSideBar=Class  (TWebPageElement,IWPSideBar)
 (*No atribs*)
end;


(*TheaterGroup*)
TTheaterGroup=Class  (TPerformingGroup,ITheaterGroup)
 (*No atribs*)
end;


(*ArriveAction*)
TArriveAction=Class  (TMoveAction,IArriveAction)
 (*No atribs*)
end;


(*RadiationTherapy*)
TRadiationTherapy=Class  (TMedicalTherapy,IRadiationTherapy)
 (*No atribs*)
end;


(*AutoPartsStore*)
TAutoPartsStore=Class  (TStore,IAutoPartsStore)
 (*No atribs*)
end;


(*AppendAction*)
TAppendAction=Class  (TInsertAction,IAppendAction)
 (*No atribs*)
end;


(*WPHeader*)
TWPHeader=Class  (TWebPageElement,IWPHeader)
 (*No atribs*)
end;

TDigitalDocumentPermission=Class; //forward


(*DigitalDocument*)
TDigitalDocument=Class  (TCreativeWork,IDigitalDocument)
private
  FhasDigitalDocumentPermission:IDigitalDocumentPermission;
protected
  function Get_hasDigitalDocumentPermission:IDigitalDocumentPermission;virtual;
  procedure Set_hasDigitalDocumentPermission(v:IDigitalDocumentPermission);virtual;
public
  property hasDigitalDocumentPermission:IDigitalDocumentPermission read Get_hasDigitalDocumentPermission write Set_hasDigitalDocumentPermission;
published
end;

TDigitalDocumentPermissionType=Class; //forward


(*DigitalDocumentPermission*)
TDigitalDocumentPermission=Class  (TIntangible,IDigitalDocumentPermission)
private
  FpermissionType:IDigitalDocumentPermissionType;
  Fgrantee:IAudience;
protected
  function Get_permissionType:IDigitalDocumentPermissionType;virtual;
  procedure Set_permissionType(v:IDigitalDocumentPermissionType);virtual;
  function Get_grantee:IAudience;virtual;
  procedure Set_grantee(v:IAudience);virtual;
public
  property permissionType:IDigitalDocumentPermissionType read Get_permissionType write Set_permissionType;
  property grantee:IAudience read Get_grantee write Set_grantee;
published
end;


(*DigitalDocumentPermissionType*)
TDigitalDocumentPermissionType=Class  (TEnumeration,IDigitalDocumentPermissionType)
  function TangDigitalDocumentPermissionType:TangibleValue;virtual;
end;


(*NoteDigitalDocument*)
TNoteDigitalDocument=Class  (TDigitalDocument,INoteDigitalDocument)
 (*No atribs*)
end;


(*SocialMediaPosting*)
TSocialMediaPosting=Class  (TArticle,ISocialMediaPosting)
private
  FsharedContent:ICreativeWork;
protected
  function Get_sharedContent:ICreativeWork;virtual;
  procedure Set_sharedContent(v:ICreativeWork);virtual;
public
  property sharedContent:ICreativeWork read Get_sharedContent write Set_sharedContent;
published
end;


(*DiscussionForumPosting*)
TDiscussionForumPosting=Class  (TSocialMediaPosting,IDiscussionForumPosting)
 (*No atribs*)
end;


(*CheckOutAction*)
TCheckOutAction=Class  (TCommunicateAction,ICheckOutAction)
 (*No atribs*)
end;


(*TextDigitalDocument*)
TTextDigitalDocument=Class  (TDigitalDocument,ITextDigitalDocument)
 (*No atribs*)
end;


(*BedAndBreakfast*)
TBedAndBreakfast=Class  (TLodgingBusiness,IBedAndBreakfast)
 (*No atribs*)
end;


(*Reservoir*)
TReservoir=Class  (TBodyOfWater,IReservoir)
 (*No atribs*)
end;


(*SaleEvent*)
TSaleEvent=Class  (TEvent,ISaleEvent)
 (*No atribs*)
end;


(*RadioStation*)
TRadioStation=Class  (TLocalBusiness,IRadioStation)
 (*No atribs*)
end;


(*BookmarkAction*)
TBookmarkAction=Class  (TOrganizeAction,IBookmarkAction)
 (*No atribs*)
end;


(*MedicalOrganization*)
TMedicalOrganization=Class  (TOrganization,IMedicalOrganization)
private
  FmedicalSpecialty:IMedicalSpecialty;
  FhealthPlanNetworkId:String;
  FisAcceptingNewPatients:Boolean;
protected
  function Get_medicalSpecialty:IMedicalSpecialty;virtual;
  procedure Set_medicalSpecialty(v:IMedicalSpecialty);virtual;
  function Get_healthPlanNetworkId:String;virtual;
  procedure Set_healthPlanNetworkId(v:String);virtual;
  function Get_isAcceptingNewPatients:Boolean;virtual;
  procedure Set_isAcceptingNewPatients(v:Boolean);virtual;
public
  property medicalSpecialty:IMedicalSpecialty read Get_medicalSpecialty write Set_medicalSpecialty;
published
  property healthPlanNetworkId:String read Get_healthPlanNetworkId write Set_healthPlanNetworkId;
  property isAcceptingNewPatients:Boolean read Get_isAcceptingNewPatients write Set_isAcceptingNewPatients;
end;


(*Pharmacy*)
TPharmacy=Class  (TMedicalOrganization,IPharmacy)
 (*No atribs*)
end;


(*UserTweets*)
TUserTweets=Class  (TUserInteraction,IUserTweets)
 (*No atribs*)
end;


(*TireShop*)
TTireShop=Class  (TStore,ITireShop)
 (*No atribs*)
end;


(*Series*)
TSeries=Class  (TCreativeWork,ISeries)
 (*No atribs*)
end;


(*UnRegisterAction*)
TUnRegisterAction=Class  (TInteractAction,IUnRegisterAction)
 (*No atribs*)
end;


(*FurnitureStore*)
TFurnitureStore=Class  (TStore,IFurnitureStore)
 (*No atribs*)
end;


(*MobilePhoneStore*)
TMobilePhoneStore=Class  (TStore,IMobilePhoneStore)
 (*No atribs*)
end;


(*CollectionPage*)
TCollectionPage=Class  (TWebPage,ICollectionPage)
 (*No atribs*)
end;


(*ImageGallery*)
TImageGallery=Class  (TCollectionPage,IImageGallery)
 (*No atribs*)
end;


(*FinancialProduct*)
TFinancialProduct=Class  (TService,IFinancialProduct)
private
  FannualPercentageRate:IQuantitativeValue;
  FinterestRate:INumber;
protected
  function Get_annualPercentageRate:IQuantitativeValue;virtual;
  procedure Set_annualPercentageRate(v:IQuantitativeValue);virtual;
  function Get_interestRate:INumber;virtual;
  procedure Set_interestRate(v:INumber);virtual;
public
  property annualPercentageRate:IQuantitativeValue read Get_annualPercentageRate write Set_annualPercentageRate;
  property interestRate:INumber read Get_interestRate write Set_interestRate;
published
end;


(*CurrencyConversionService*)
TCurrencyConversionService=Class  (TFinancialProduct,ICurrencyConversionService)
  function TangCurrencyConversionService:TangibleValue;virtual;
end;


(*InstallAction*)
TInstallAction=Class  (TConsumeAction,IInstallAction)
 (*No atribs*)
end;


(*VideoGallery*)
TVideoGallery=Class  (TCollectionPage,IVideoGallery)
 (*No atribs*)
end;


(*Sculpture*)
TSculpture=Class  (TCreativeWork,ISculpture)
 (*No atribs*)
end;


(*EventVenue*)
TEventVenue=Class  (TCivicStructure,IEventVenue)
 (*No atribs*)
end;


(*AdultEntertainment*)
TAdultEntertainment=Class  (TEntertainmentBusiness,IAdultEntertainment)
 (*No atribs*)
end;


(*TakeAction*)
TTakeAction=Class  (TTransferAction,ITakeAction)
 (*No atribs*)
end;


(*SuspendAction*)
TSuspendAction=Class  (TControlAction,ISuspendAction)
 (*No atribs*)
end;


(*MusicStore*)
TMusicStore=Class  (TStore,IMusicStore)
 (*No atribs*)
end;


(*TradeAction*)
TTradeAction=Class  (TAction,ITradeAction)
private
  Fprice:INumber;
  FpriceSpecification:IPriceSpecification;
protected
  function Get_price:INumber;virtual;
  procedure Set_price(v:INumber);virtual;
  function Get_priceSpecification:IPriceSpecification;virtual;
  procedure Set_priceSpecification(v:IPriceSpecification);virtual;
public
  property price:INumber read Get_price write Set_price;
  property priceSpecification:IPriceSpecification read Get_priceSpecification write Set_priceSpecification;
published
end;


(*PreOrderAction*)
TPreOrderAction=Class  (TTradeAction,IPreOrderAction)
 (*No atribs*)
end;


(*PetStore*)
TPetStore=Class  (TStore,IPetStore)
 (*No atribs*)
end;


(*Dentist*)
TDentist=Class  (TMedicalOrganization,IDentist)
 (*No atribs*)
end;


(*HomeAndConstructionBusiness*)
THomeAndConstructionBusiness=Class  (TLocalBusiness,IHomeAndConstructionBusiness)
 (*No atribs*)
end;


(*RoofingContractor*)
TRoofingContractor=Class  (THomeAndConstructionBusiness,IRoofingContractor)
 (*No atribs*)
end;


(*MovingCompany*)
TMovingCompany=Class  (THomeAndConstructionBusiness,IMovingCompany)
 (*No atribs*)
end;


(*Table*)
TTable=Class  (TWebPageElement,ITable)
 (*No atribs*)
end;


(*HealthClub*)
THealthClub=Class  (THealthAndBeautyBusiness,IHealthClub)
 (*No atribs*)
end;


(*Festival*)
TFestival=Class  (TEvent,IFestival)
 (*No atribs*)
end;


(*AchieveAction*)
TAchieveAction=Class  (TAction,IAchieveAction)
 (*No atribs*)
end;


(*TieAction*)
TTieAction=Class  (TAchieveAction,ITieAction)
 (*No atribs*)
end;


(*LakeBodyOfWater*)
TLakeBodyOfWater=Class  (TBodyOfWater,ILakeBodyOfWater)
 (*No atribs*)
end;


(*AutoRepair*)
TAutoRepair=Class  (TAutomotiveBusiness,IAutoRepair)
 (*No atribs*)
end;


(*ReadAction*)
TReadAction=Class  (TConsumeAction,IReadAction)
 (*No atribs*)
end;


(*Aquarium*)
TAquarium=Class  (TCivicStructure,IAquarium)
 (*No atribs*)
end;


(*PaymentCard*)
TPaymentCard=Class  (TFinancialProduct,IPaymentCard)
  function TangPaymentCard:TangibleValue;virtual;
end;


(*CreditCard*)
TCreditCard=Class  (TPaymentCard,ICreditCard)
  function TangCreditCard:TangibleValue;virtual;
end;


(*LandmarksOrHistoricalBuildings*)
TLandmarksOrHistoricalBuildings=Class  (TPlace,ILandmarksOrHistoricalBuildings)
 (*No atribs*)
end;


(*GovernmentOrganization*)
TGovernmentOrganization=Class  (TOrganization,IGovernmentOrganization)
 (*No atribs*)
end;


(*Preschool*)
TPreschool=Class  (TEducationalOrganization,IPreschool)
 (*No atribs*)
end;


(*Electrician*)
TElectrician=Class  (THomeAndConstructionBusiness,IElectrician)
 (*No atribs*)
end;


(*TaxiStand*)
TTaxiStand=Class  (TCivicStructure,ITaxiStand)
 (*No atribs*)
end;


(*AmusementPark*)
TAmusementPark=Class  (TEntertainmentBusiness,IAmusementPark)
 (*No atribs*)
end;


(*ReportedDoseSchedule*)
TReportedDoseSchedule=Class  (TDoseSchedule,IReportedDoseSchedule)
 (*No atribs*)
end;


(*PhysicalTherapy*)
TPhysicalTherapy=Class  (TMedicalTherapy,IPhysicalTherapy)
 (*No atribs*)
end;


(*Courthouse*)
TCourthouse=Class  (TGovernmentBuilding,ICourthouse)
 (*No atribs*)
end;


(*RVPark*)
TRVPark=Class  (TCivicStructure,IRVPark)
 (*No atribs*)
end;


(*EmploymentAgency*)
TEmploymentAgency=Class  (TLocalBusiness,IEmploymentAgency)
 (*No atribs*)
end;


(*PalliativeProcedure*)
TPalliativeProcedure=Class  (TMedicalProcedure,IPalliativeProcedure)
 (*No atribs*)
end;


(*TouristInformationCenter*)
TTouristInformationCenter=Class  (TLocalBusiness,ITouristInformationCenter)
 (*No atribs*)
end;


(*DeactivateAction*)
TDeactivateAction=Class  (TControlAction,IDeactivateAction)
 (*No atribs*)
end;


(*RiverBodyOfWater*)
TRiverBodyOfWater=Class  (TBodyOfWater,IRiverBodyOfWater)
 (*No atribs*)
end;


(*Locksmith*)
TLocksmith=Class  (THomeAndConstructionBusiness,ILocksmith)
 (*No atribs*)
end;


(*EndorsementRating*)
TEndorsementRating=Class  (TRating,IEndorsementRating)
  function TangEndorsementRating:TangibleValue;virtual;
end;


(*FoodService*)
TFoodService=Class  (TService,IFoodService)
  function TangFoodService:TangibleValue;virtual;
end;


(*RadioClip*)
TRadioClip=Class  (TClip,IRadioClip)
 (*No atribs*)
end;


(*Plumber*)
TPlumber=Class  (THomeAndConstructionBusiness,IPlumber)
 (*No atribs*)
end;


(*PlaceOfWorship*)
TPlaceOfWorship=Class  (TCivicStructure,IPlaceOfWorship)
 (*No atribs*)
end;


(*Church*)
TChurch=Class  (TPlaceOfWorship,IChurch)
 (*No atribs*)
end;


(*ListenAction*)
TListenAction=Class  (TConsumeAction,IListenAction)
 (*No atribs*)
end;

TLocationFeatureSpecification=Class; //forward


(*Accommodation*)
TAccommodation=Class  (TPlace,IAccommodation)
private
  FamenityFeature:ILocationFeatureSpecification;
  FfloorSize:IQuantitativeValue;
  FpermittedUsage:String;
protected
  function Get_amenityFeature:ILocationFeatureSpecification;virtual;
  procedure Set_amenityFeature(v:ILocationFeatureSpecification);virtual;
  function Get_floorSize:IQuantitativeValue;virtual;
  procedure Set_floorSize(v:IQuantitativeValue);virtual;
  function Get_permittedUsage:String;virtual;
  procedure Set_permittedUsage(v:String);virtual;
public
  property amenityFeature:ILocationFeatureSpecification read Get_amenityFeature write Set_amenityFeature;
  property floorSize:IQuantitativeValue read Get_floorSize write Set_floorSize;
published
  property permittedUsage:String read Get_permittedUsage write Set_permittedUsage;
end;


(*LocationFeatureSpecification*)
TLocationFeatureSpecification=Class  (TPropertyValue,ILocationFeatureSpecification)
  function TangLocationFeatureSpecification:TangibleValue;virtual;
end;


(*Room*)
TRoom=Class  (TAccommodation,IRoom)
 (*No atribs*)
end;


(*MeetingRoom*)
TMeetingRoom=Class  (TRoom,IMeetingRoom)
 (*No atribs*)
end;


(*PlanAction*)
TPlanAction=Class  (TOrganizeAction,IPlanAction)
private
  FscheduledTime:TDateTime;
protected
  function Get_scheduledTime:TDateTime;virtual;
  procedure Set_scheduledTime(v:TDateTime);virtual;
public
published
  property scheduledTime:TDateTime read Get_scheduledTime write Set_scheduledTime;
end;


(*ReserveAction*)
TReserveAction=Class  (TPlanAction,IReserveAction)
 (*No atribs*)
end;


(*GroceryStore*)
TGroceryStore=Class  (TStore,IGroceryStore)
 (*No atribs*)
end;


(*Campground*)
TCampground=Class  (TCivicStructure,ICampground)
 (*No atribs*)
end;


(*UserPlusOnes*)
TUserPlusOnes=Class  (TUserInteraction,IUserPlusOnes)
 (*No atribs*)
end;


(*AutomatedTeller*)
TAutomatedTeller=Class  (TFinancialService,IAutomatedTeller)
 (*No atribs*)
end;


(*AgreeAction*)
TAgreeAction=Class  (TReactAction,IAgreeAction)
 (*No atribs*)
end;


(*ComedyClub*)
TComedyClub=Class  (TEntertainmentBusiness,IComedyClub)
 (*No atribs*)
end;


(*Hostel*)
THostel=Class  (TLodgingBusiness,IHostel)
 (*No atribs*)
end;


(*ShoppingCenter*)
TShoppingCenter=Class  (TLocalBusiness,IShoppingCenter)
 (*No atribs*)
end;


(*CafeOrCoffeeShop*)
TCafeOrCoffeeShop=Class  (TFoodEstablishment,ICafeOrCoffeeShop)
 (*No atribs*)
end;


(*ClothingStore*)
TClothingStore=Class  (TStore,IClothingStore)
 (*No atribs*)
end;


(*ChildCare*)
TChildCare=Class  (TLocalBusiness,IChildCare)
 (*No atribs*)
end;


(*ApprovedIndication*)
TApprovedIndication=Class  (TMedicalIndication,IApprovedIndication)
 (*No atribs*)
end;


(*SearchResultsPage*)
TSearchResultsPage=Class  (TWebPage,ISearchResultsPage)
 (*No atribs*)
end;


(*GovernmentOffice*)
TGovernmentOffice=Class  (TLocalBusiness,IGovernmentOffice)
 (*No atribs*)
end;


(*PostOffice*)
TPostOffice=Class  (TGovernmentOffice,IPostOffice)
 (*No atribs*)
end;


(*AutoBodyShop*)
TAutoBodyShop=Class  (TAutomotiveBusiness,IAutoBodyShop)
 (*No atribs*)
end;


(*LockerDelivery*)
TLockerDelivery=Class  (TDeliveryMethod,ILockerDelivery)
  function TangLockerDelivery:TangibleValue;virtual;
end;


(*BookStore*)
TBookStore=Class  (TStore,IBookStore)
 (*No atribs*)
end;


(*CollegeOrUniversity*)
TCollegeOrUniversity=Class  (TEducationalOrganization,ICollegeOrUniversity)
 (*No atribs*)
end;


(*RecyclingCenter*)
TRecyclingCenter=Class  (TLocalBusiness,IRecyclingCenter)
 (*No atribs*)
end;


(*MedicalRiskEstimator*)
TMedicalRiskEstimator=Class  (TMedicalEntity,IMedicalRiskEstimator)
private
  FestimatesRiskOf:IMedicalEntity;
  FincludedRiskFactor:IMedicalRiskFactor;
protected
  function Get_estimatesRiskOf:IMedicalEntity;virtual;
  procedure Set_estimatesRiskOf(v:IMedicalEntity);virtual;
  function Get_includedRiskFactor:IMedicalRiskFactor;virtual;
  procedure Set_includedRiskFactor(v:IMedicalRiskFactor);virtual;
public
  property estimatesRiskOf:IMedicalEntity read Get_estimatesRiskOf write Set_estimatesRiskOf;
  property includedRiskFactor:IMedicalRiskFactor read Get_includedRiskFactor write Set_includedRiskFactor;
published
end;


(*MedicalRiskCalculator*)
TMedicalRiskCalculator=Class  (TMedicalRiskEstimator,IMedicalRiskCalculator)
 (*No atribs*)
end;


(*ComputerStore*)
TComputerStore=Class  (TStore,IComputerStore)
 (*No atribs*)
end;


(*DisagreeAction*)
TDisagreeAction=Class  (TReactAction,IDisagreeAction)
 (*No atribs*)
end;


(*MiddleSchool*)
TMiddleSchool=Class  (TEducationalOrganization,IMiddleSchool)
 (*No atribs*)
end;


(*School*)
TSchool=Class  (TEducationalOrganization,ISchool)
 (*No atribs*)
end;


(*SelfStorage*)
TSelfStorage=Class  (TLocalBusiness,ISelfStorage)
 (*No atribs*)
end;


(*Playground*)
TPlayground=Class  (TCivicStructure,IPlayground)
 (*No atribs*)
end;


(*PaymentService*)
TPaymentService=Class  (TFinancialProduct,IPaymentService)
  function TangPaymentService:TangibleValue;virtual;
end;


(*ArtGallery*)
TArtGallery=Class  (TEntertainmentBusiness,IArtGallery)
 (*No atribs*)
end;


(*AccountingService*)
TAccountingService=Class  (TFinancialService,IAccountingService)
 (*No atribs*)
end;


(*PreventionIndication*)
TPreventionIndication=Class  (TMedicalIndication,IPreventionIndication)
 (*No atribs*)
end;


(*CampingPitch*)
TCampingPitch=Class  (TAccommodation,ICampingPitch)
 (*No atribs*)
end;


(*DefenceEstablishment*)
TDefenceEstablishment=Class  (TGovernmentBuilding,IDefenceEstablishment)
 (*No atribs*)
end;


(*ComicSeries*)
TComicSeries=Class  (TPeriodical,IComicSeries)
 (*No atribs*)
end;


(*ChildrensEvent*)
TChildrensEvent=Class  (TEvent,IChildrensEvent)
 (*No atribs*)
end;


(*CatholicChurch*)
TCatholicChurch=Class  (TPlaceOfWorship,ICatholicChurch)
 (*No atribs*)
end;


(*AboutPage*)
TAboutPage=Class  (TWebPage,IAboutPage)
 (*No atribs*)
end;


(*IgnoreAction*)
TIgnoreAction=Class  (TAssessAction,IIgnoreAction)
 (*No atribs*)
end;


(*BusinessEvent*)
TBusinessEvent=Class  (TEvent,IBusinessEvent)
 (*No atribs*)
end;


(*Residence*)
TResidence=Class  (TPlace,IResidence)
 (*No atribs*)
end;


(*ApartmentComplex*)
TApartmentComplex=Class  (TResidence,IApartmentComplex)
 (*No atribs*)
end;


(*JewelryStore*)
TJewelryStore=Class  (TStore,IJewelryStore)
 (*No atribs*)
end;


(*SportingGoodsStore*)
TSportingGoodsStore=Class  (TStore,ISportingGoodsStore)
 (*No atribs*)
end;


(*MotorcycleRepair*)
TMotorcycleRepair=Class  (TAutomotiveBusiness,IMotorcycleRepair)
 (*No atribs*)
end;


(*Synagogue*)
TSynagogue=Class  (TPlaceOfWorship,ISynagogue)
 (*No atribs*)
end;


(*DiagnosticProcedure*)
TDiagnosticProcedure=Class  (TMedicalProcedure,IDiagnosticProcedure)
 (*No atribs*)
end;


(*Motel*)
TMotel=Class  (TLodgingBusiness,IMotel)
 (*No atribs*)
end;


(*CancelAction*)
TCancelAction=Class  (TPlanAction,ICancelAction)
 (*No atribs*)
end;


(*ElectronicsStore*)
TElectronicsStore=Class  (TStore,IElectronicsStore)
 (*No atribs*)
end;


(*GeneralContractor*)
TGeneralContractor=Class  (THomeAndConstructionBusiness,IGeneralContractor)
 (*No atribs*)
end;


(*BankOrCreditUnion*)
TBankOrCreditUnion=Class  (TFinancialService,IBankOrCreditUnion)
 (*No atribs*)
end;


(*WorkersUnion*)
TWorkersUnion=Class  (TOrganization,IWorkersUnion)
 (*No atribs*)
end;


(*AcceptAction*)
TAcceptAction=Class  (TAllocateAction,IAcceptAction)
 (*No atribs*)
end;


(*SportsClub*)
TSportsClub=Class  (TSportsActivityLocation,ISportsClub)
 (*No atribs*)
end;


(*AutoRental*)
TAutoRental=Class  (TAutomotiveBusiness,IAutoRental)
 (*No atribs*)
end;


(*PresentationDigitalDocument*)
TPresentationDigitalDocument=Class  (TDigitalDocument,IPresentationDigitalDocument)
 (*No atribs*)
end;


(*MotorizedBicycle*)
TMotorizedBicycle=Class  (TVehicle,IMotorizedBicycle)
 (*No atribs*)
end;


(*BeautySalon*)
TBeautySalon=Class  (THealthAndBeautyBusiness,IBeautySalon)
 (*No atribs*)
end;


(*HinduTemple*)
THinduTemple=Class  (TPlaceOfWorship,IHinduTemple)
 (*No atribs*)
end;


(*PublicSwimmingPool*)
TPublicSwimmingPool=Class  (TSportsActivityLocation,IPublicSwimmingPool)
 (*No atribs*)
end;


(*DaySpa*)
TDaySpa=Class  (THealthAndBeautyBusiness,IDaySpa)
 (*No atribs*)
end;


(*CheckInAction*)
TCheckInAction=Class  (TCommunicateAction,ICheckInAction)
 (*No atribs*)
end;


(*ExhibitionEvent*)
TExhibitionEvent=Class  (TEvent,IExhibitionEvent)
 (*No atribs*)
end;


(*Distillery*)
TDistillery=Class  (TFoodEstablishment,IDistillery)
 (*No atribs*)
end;


(*GatedResidenceCommunity*)
TGatedResidenceCommunity=Class  (TResidence,IGatedResidenceCommunity)
 (*No atribs*)
end;


(*ParkingFacility*)
TParkingFacility=Class  (TCivicStructure,IParkingFacility)
 (*No atribs*)
end;


(*EventReservation*)
TEventReservation=Class  (TReservation,IEventReservation)
  function TangEventReservation:TangibleValue;virtual;
end;


(*HardwareStore*)
THardwareStore=Class  (TStore,IHardwareStore)
 (*No atribs*)
end;


(*MotorcycleDealer*)
TMotorcycleDealer=Class  (TAutomotiveBusiness,IMotorcycleDealer)
 (*No atribs*)
end;


(*UserCheckins*)
TUserCheckins=Class  (TUserInteraction,IUserCheckins)
 (*No atribs*)
end;


(*RegisterAction*)
TRegisterAction=Class  (TInteractAction,IRegisterAction)
 (*No atribs*)
end;


(*IceCreamShop*)
TIceCreamShop=Class  (TFoodEstablishment,IIceCreamShop)
 (*No atribs*)
end;


(*MovieRentalStore*)
TMovieRentalStore=Class  (TStore,IMovieRentalStore)
 (*No atribs*)
end;


(*FindAction*)
TFindAction=Class  (TAction,IFindAction)
 (*No atribs*)
end;


(*CheckAction*)
TCheckAction=Class  (TFindAction,ICheckAction)
 (*No atribs*)
end;


(*WPFooter*)
TWPFooter=Class  (TWebPageElement,IWPFooter)
 (*No atribs*)
end;


(*TreatmentIndication*)
TTreatmentIndication=Class  (TMedicalIndication,ITreatmentIndication)
 (*No atribs*)
end;


(*MensClothingStore*)
TMensClothingStore=Class  (TStore,IMensClothingStore)
 (*No atribs*)
end;


(*City*)
TCity=Class  (TAdministrativeArea,ICity)
 (*No atribs*)
end;


(*DryCleaningOrLaundry*)
TDryCleaningOrLaundry=Class  (TLocalBusiness,IDryCleaningOrLaundry)
 (*No atribs*)
end;

TDistance=Class; //forward


(*VisualArtwork*)
TVisualArtwork=Class  (TCreativeWork,IVisualArtwork)
private
  Fartist:IPerson;
  Fwidth:IQuantitativeValue;
  Fsurface:String;
  Fdepth:IQuantitativeValue;
  FartMedium:String;
  FartEdition:Integer;
  Fartform:String;
  Fheight:IDistance;
protected
  function Get_artist:IPerson;virtual;
  procedure Set_artist(v:IPerson);virtual;
  function Get_width:IQuantitativeValue;virtual;
  procedure Set_width(v:IQuantitativeValue);virtual;
  function Get_surface:String;virtual;
  procedure Set_surface(v:String);virtual;
  function Get_depth:IQuantitativeValue;virtual;
  procedure Set_depth(v:IQuantitativeValue);virtual;
  function Get_artMedium:String;virtual;
  procedure Set_artMedium(v:String);virtual;
  function Get_artEdition:Integer;virtual;
  procedure Set_artEdition(v:Integer);virtual;
  function Get_artform:String;virtual;
  procedure Set_artform(v:String);virtual;
  function Get_height:IDistance;virtual;
  procedure Set_height(v:IDistance);virtual;
public
  property artist:IPerson read Get_artist write Set_artist;
  property width:IQuantitativeValue read Get_width write Set_width;
  property depth:IQuantitativeValue read Get_depth write Set_depth;
  property height:IDistance read Get_height write Set_height;
published
  property surface:String read Get_surface write Set_surface;
  property artMedium:String read Get_artMedium write Set_artMedium;
  property artEdition:Integer read Get_artEdition write Set_artEdition;
  property artform:String read Get_artform write Set_artform;
end;


(*Distance*)
TDistance=Class  (TQuantity,IDistance)
  function TangDistance:TangibleValue;virtual;
end;


(*CoverArt*)
TCoverArt=Class  (TVisualArtwork,ICoverArt)
 (*No atribs*)
end;


(*ComicCoverArt*)
TComicCoverArt=Class  (TCoverArt,IComicCoverArt)
 (*No atribs*)
end;


(*SeaBodyOfWater*)
TSeaBodyOfWater=Class  (TBodyOfWater,ISeaBodyOfWater)
 (*No atribs*)
end;


(*HousePainter*)
THousePainter=Class  (THomeAndConstructionBusiness,IHousePainter)
 (*No atribs*)
end;


(*DislikeAction*)
TDislikeAction=Class  (TReactAction,IDislikeAction)
 (*No atribs*)
end;


(*AnimalShelter*)
TAnimalShelter=Class  (TLocalBusiness,IAnimalShelter)
 (*No atribs*)
end;


(*ShoeStore*)
TShoeStore=Class  (TStore,IShoeStore)
 (*No atribs*)
end;


(*VisualArtsEvent*)
TVisualArtsEvent=Class  (TEvent,IVisualArtsEvent)
 (*No atribs*)
end;


(*Resort*)
TResort=Class  (TLodgingBusiness,IResort)
 (*No atribs*)
end;


(*BikeStore*)
TBikeStore=Class  (TStore,IBikeStore)
 (*No atribs*)
end;


(*Barcode*)
TBarcode=Class  (TImageObject,IBarcode)
 (*No atribs*)
end;


(*Attorney*)
TAttorney=Class  (TLegalService,IAttorney)
 (*No atribs*)
end;


(*SpreadsheetDigitalDocument*)
TSpreadsheetDigitalDocument=Class  (TDigitalDocument,ISpreadsheetDigitalDocument)
 (*No atribs*)
end;


(*ProfessionalService*)
TProfessionalService=Class  (TLocalBusiness,IProfessionalService)
 (*No atribs*)
end;


(*BuddhistTemple*)
TBuddhistTemple=Class  (TPlaceOfWorship,IBuddhistTemple)
 (*No atribs*)
end;


(*PhotographAction*)
TPhotographAction=Class  (TCreateAction,IPhotographAction)
 (*No atribs*)
end;


(*Bakery*)
TBakery=Class  (TFoodEstablishment,IBakery)
 (*No atribs*)
end;


(*State*)
TState=Class  (TAdministrativeArea,IState)
 (*No atribs*)
end;


(*Mountain*)
TMountain=Class  (TLandform,IMountain)
 (*No atribs*)
end;


(*SocialEvent*)
TSocialEvent=Class  (TEvent,ISocialEvent)
 (*No atribs*)
end;


(*MusicVenue*)
TMusicVenue=Class  (TCivicStructure,IMusicVenue)
 (*No atribs*)
end;


(*Park*)
TPark=Class  (TCivicStructure,IPark)
 (*No atribs*)
end;


(*BankAccount*)
TBankAccount=Class  (TFinancialProduct,IBankAccount)
  function TangBankAccount:TangibleValue;virtual;
end;


(*DepositAccount*)
TDepositAccount=Class  (TBankAccount,IDepositAccount)
  function TangDepositAccount:TangibleValue;virtual;
end;


(*ScheduleAction*)
TScheduleAction=Class  (TPlanAction,IScheduleAction)
 (*No atribs*)
end;


(*NailSalon*)
TNailSalon=Class  (THealthAndBeautyBusiness,INailSalon)
 (*No atribs*)
end;


(*EatAction*)
TEatAction=Class  (TConsumeAction,IEatAction)
 (*No atribs*)
end;


(*InternetCafe*)
TInternetCafe=Class  (TLocalBusiness,IInternetCafe)
 (*No atribs*)
end;


(*Restaurant*)
TRestaurant=Class  (TFoodEstablishment,IRestaurant)
 (*No atribs*)
end;


(*NightClub*)
TNightClub=Class  (TEntertainmentBusiness,INightClub)
 (*No atribs*)
end;


(*SubscribeAction*)
TSubscribeAction=Class  (TInteractAction,ISubscribeAction)
 (*No atribs*)
end;


(*DrawAction*)
TDrawAction=Class  (TCreateAction,IDrawAction)
 (*No atribs*)
end;


(*BookSeries*)
TBookSeries=Class  (TCreativeWorkSeries,IBookSeries)
 (*No atribs*)
end;


(*TrainReservation*)
TTrainReservation=Class  (TReservation,ITrainReservation)
  function TangTrainReservation:TangibleValue;virtual;
end;


(*EducationEvent*)
TEducationEvent=Class  (TEvent,IEducationEvent)
 (*No atribs*)
end;


(*PaintAction*)
TPaintAction=Class  (TCreateAction,IPaintAction)
 (*No atribs*)
end;


(*Cemetery*)
TCemetery=Class  (TCivicStructure,ICemetery)
 (*No atribs*)
end;


(*WholesaleStore*)
TWholesaleStore=Class  (TStore,IWholesaleStore)
 (*No atribs*)
end;


(*BarOrPub*)
TBarOrPub=Class  (TFoodEstablishment,IBarOrPub)
 (*No atribs*)
end;


(*Waterfall*)
TWaterfall=Class  (TBodyOfWater,IWaterfall)
 (*No atribs*)
end;


(*Mosque*)
TMosque=Class  (TPlaceOfWorship,IMosque)
 (*No atribs*)
end;


(*NGO*)
TNGO=Class  (TOrganization,INGO)
 (*No atribs*)
end;


(*Pond*)
TPond=Class  (TBodyOfWater,IPond)
 (*No atribs*)
end;


(*InformAction*)
TInformAction=Class  (TCommunicateAction,IInformAction)
 (*No atribs*)
end;


(*ConfirmAction*)
TConfirmAction=Class  (TInformAction,IConfirmAction)
 (*No atribs*)
end;


(*DeleteAction*)
TDeleteAction=Class  (TUpdateAction,IDeleteAction)
 (*No atribs*)
end;


(*ActivateAction*)
TActivateAction=Class  (TControlAction,IActivateAction)
 (*No atribs*)
end;


(*Crematorium*)
TCrematorium=Class  (TCivicStructure,ICrematorium)
 (*No atribs*)
end;


(*UserPageVisits*)
TUserPageVisits=Class  (TUserInteraction,IUserPageVisits)
 (*No atribs*)
end;


(*GolfCourse*)
TGolfCourse=Class  (TSportsActivityLocation,IGolfCourse)
 (*No atribs*)
end;


(*MusicVideoObject*)
TMusicVideoObject=Class  (TMediaObject,IMusicVideoObject)
 (*No atribs*)
end;


(*AutoDealer*)
TAutoDealer=Class  (TAutomotiveBusiness,IAutoDealer)
 (*No atribs*)
end;


(*UserDownloads*)
TUserDownloads=Class  (TUserInteraction,IUserDownloads)
 (*No atribs*)
end;


(*LegislativeBuilding*)
TLegislativeBuilding=Class  (TGovernmentBuilding,ILegislativeBuilding)
 (*No atribs*)
end;


(*ProfilePage*)
TProfilePage=Class  (TWebPage,IProfilePage)
 (*No atribs*)
end;


(*FMRadioChannel*)
TFMRadioChannel=Class  (TRadioChannel,IFMRadioChannel)
  function TangFMRadioChannel:TangibleValue;virtual;
end;


(*PerformingArtsTheater*)
TPerformingArtsTheater=Class  (TCivicStructure,IPerformingArtsTheater)
 (*No atribs*)
end;


(*Bridge*)
TBridge=Class  (TCivicStructure,IBridge)
 (*No atribs*)
end;


(*HomeGoodsStore*)
THomeGoodsStore=Class  (TStore,IHomeGoodsStore)
 (*No atribs*)
end;


(*Bone*)
TBone=Class  (TAnatomicalStructure,IBone)
 (*No atribs*)
end;


(*VeterinaryCare*)
TVeterinaryCare=Class  (TMedicalOrganization,IVeterinaryCare)
 (*No atribs*)
end;


(*LiteraryEvent*)
TLiteraryEvent=Class  (TEvent,ILiteraryEvent)
 (*No atribs*)
end;


(*TravelAgency*)
TTravelAgency=Class  (TLocalBusiness,ITravelAgency)
 (*No atribs*)
end;


(*LikeAction*)
TLikeAction=Class  (TReactAction,ILikeAction)
 (*No atribs*)
end;


(*OnDemandEvent*)
TOnDemandEvent=Class  (TPublicationEvent,IOnDemandEvent)
 (*No atribs*)
end;


(*Conversation*)
TConversation=Class  (TCreativeWork,IConversation)
 (*No atribs*)
end;


(*CheckoutPage*)
TCheckoutPage=Class  (TWebPage,ICheckoutPage)
 (*No atribs*)
end;


(*Museum*)
TMuseum=Class  (TCivicStructure,IMuseum)
 (*No atribs*)
end;


(*HVACBusiness*)
THVACBusiness=Class  (THomeAndConstructionBusiness,IHVACBusiness)
 (*No atribs*)
end;


(*MedicalSymptom*)
TMedicalSymptom=Class  (TMedicalSignOrSymptom,IMedicalSymptom)
 (*No atribs*)
end;


(*TennisComplex*)
TTennisComplex=Class  (TSportsActivityLocation,ITennisComplex)
 (*No atribs*)
end;


(*UseAction*)
TUseAction=Class  (TConsumeAction,IUseAction)
 (*No atribs*)
end;


(*WearAction*)
TWearAction=Class  (TUseAction,IWearAction)
 (*No atribs*)
end;


(*QuoteAction*)
TQuoteAction=Class  (TTradeAction,IQuoteAction)
 (*No atribs*)
end;


(*ConvenienceStore*)
TConvenienceStore=Class  (TStore,IConvenienceStore)
 (*No atribs*)
end;


(*GasStation*)
TGasStation=Class  (TAutomotiveBusiness,IGasStation)
 (*No atribs*)
end;


(*RejectAction*)
TRejectAction=Class  (TAllocateAction,IRejectAction)
 (*No atribs*)
end;


(*BefriendAction*)
TBefriendAction=Class  (TInteractAction,IBefriendAction)
 (*No atribs*)
end;


(*Beach*)
TBeach=Class  (TCivicStructure,IBeach)
 (*No atribs*)
end;


(*PoliceStation*)
TPoliceStation=Class  (TCivicStructure,IPoliceStation)
 (*No atribs*)
end;


(*ComedyEvent*)
TComedyEvent=Class  (TEvent,IComedyEvent)
 (*No atribs*)
end;


(*SkiResort*)
TSkiResort=Class  (TSportsActivityLocation,ISkiResort)
 (*No atribs*)
end;


(*SiteNavigationElement*)
TSiteNavigationElement=Class  (TWebPageElement,ISiteNavigationElement)
 (*No atribs*)
end;


(*MedicalBusiness*)
TMedicalBusiness=Class  (TLocalBusiness,IMedicalBusiness)
 (*No atribs*)
end;


(*Optician*)
TOptician=Class  (TMedicalBusiness,IOptician)
 (*No atribs*)
end;


(*RadioSeason*)
TRadioSeason=Class  (TCreativeWorkSeason,IRadioSeason)
 (*No atribs*)
end;


(*FastFoodRestaurant*)
TFastFoodRestaurant=Class  (TFoodEstablishment,IFastFoodRestaurant)
 (*No atribs*)
end;


(*MedicalGuidelineContraindication*)
TMedicalGuidelineContraindication=Class  (TMedicalGuideline,IMedicalGuidelineContraindication)
 (*No atribs*)
end;


(*StadiumOrArena*)
TStadiumOrArena=Class  (TCivicStructure,IStadiumOrArena)
 (*No atribs*)
end;


(*QAPage*)
TQAPage=Class  (TWebPage,IQAPage)
 (*No atribs*)
end;


(*TelevisionStation*)
TTelevisionStation=Class  (TLocalBusiness,ITelevisionStation)
 (*No atribs*)
end;


(*Message*)
TMessage=Class  (TCreativeWork,IMessage)
private
  FdateSent:TDateTime;
  FdateRead:TDateTime;
  FmessageAttachment:ICreativeWork;
  FdateReceived:TDateTime;
protected
  function Get_dateSent:TDateTime;virtual;
  procedure Set_dateSent(v:TDateTime);virtual;
  function Get_dateRead:TDateTime;virtual;
  procedure Set_dateRead(v:TDateTime);virtual;
  function Get_messageAttachment:ICreativeWork;virtual;
  procedure Set_messageAttachment(v:ICreativeWork);virtual;
  function Get_dateReceived:TDateTime;virtual;
  procedure Set_dateReceived(v:TDateTime);virtual;
public
  property messageAttachment:ICreativeWork read Get_messageAttachment write Set_messageAttachment;
published
  property dateSent:TDateTime read Get_dateSent write Set_dateSent;
  property dateRead:TDateTime read Get_dateRead write Set_dateRead;
  property dateReceived:TDateTime read Get_dateReceived write Set_dateReceived;
end;


(*EmailMessage*)
TEmailMessage=Class  (TMessage,IEmailMessage)
 (*No atribs*)
end;


(*DiscoverAction*)
TDiscoverAction=Class  (TFindAction,IDiscoverAction)
 (*No atribs*)
end;


(*BlogPosting*)
TBlogPosting=Class  (TSocialMediaPosting,IBlogPosting)
 (*No atribs*)
end;


(*PhysicalActivityCategory*)
TPhysicalActivityCategory=Class  (TEnumeration,IPhysicalActivityCategory)
  function TangPhysicalActivityCategory:TangibleValue;virtual;
end;


(*DonateAction*)
TDonateAction=Class  (TTradeAction,IDonateAction)
 (*No atribs*)
end;


(*ItemListOrderType*)
TItemListOrderType=Class  (TEnumeration,IItemListOrderType)
  function TangItemListOrderType:TangibleValue;virtual;
end;

TMovie=Class; //forward


(*ScreeningEvent*)
TScreeningEvent=Class  (TEvent,IScreeningEvent)
private
  FvideoFormat:String;
  FworkPresented:IMovie;
protected
  function Get_videoFormat:String;virtual;
  procedure Set_videoFormat(v:String);virtual;
  function Get_workPresented:IMovie;virtual;
  procedure Set_workPresented(v:IMovie);virtual;
public
  property workPresented:IMovie read Get_workPresented write Set_workPresented;
published
  property videoFormat:String read Get_videoFormat write Set_videoFormat;
end;

TMusicGroup=Class; //forward


(*Movie*)
TMovie=Class  (TCreativeWork,IMovie)
private
  FmusicBy:IMusicGroup;
  FsubtitleLanguage:String;
protected
  function Get_musicBy:IMusicGroup;virtual;
  procedure Set_musicBy(v:IMusicGroup);virtual;
  function Get_subtitleLanguage:String;virtual;
  procedure Set_subtitleLanguage(v:String);virtual;
public
  property musicBy:IMusicGroup read Get_musicBy write Set_musicBy;
published
  property subtitleLanguage:String read Get_subtitleLanguage write Set_subtitleLanguage;
end;

TMusicAlbum=Class; //forward


(*MusicGroup*)
TMusicGroup=Class  (TPerformingGroup,IMusicGroup)
private
  FmusicGroupMember:IPerson;
  Falbums:IMusicAlbum;
  Fgenre:String;
protected
  function Get_musicGroupMember:IPerson;virtual;
  procedure Set_musicGroupMember(v:IPerson);virtual;
  function Get_albums:IMusicAlbum;virtual;
  procedure Set_albums(v:IMusicAlbum);virtual;
  function Get_genre:String;virtual;
  procedure Set_genre(v:String);virtual;
public
  property musicGroupMember:IPerson read Get_musicGroupMember write Set_musicGroupMember;
  property albums:IMusicAlbum read Get_albums write Set_albums;
published
  property genre:String read Get_genre write Set_genre;
end;

TMusicRecording=Class; //forward


(*MusicPlaylist*)
TMusicPlaylist=Class  (TCreativeWork,IMusicPlaylist)
private
  Ftracks:IMusicRecording;
  FnumTracks:Integer;
protected
  function Get_tracks:IMusicRecording;virtual;
  procedure Set_tracks(v:IMusicRecording);virtual;
  function Get_numTracks:Integer;virtual;
  procedure Set_numTracks(v:Integer);virtual;
public
  property tracks:IMusicRecording read Get_tracks write Set_tracks;
published
  property numTracks:Integer read Get_numTracks write Set_numTracks;
end;

TMusicComposition=Class; //forward


(*MusicRecording*)
TMusicRecording=Class  (TCreativeWork,IMusicRecording)
private
  FinAlbum:IMusicAlbum;
  FinPlaylist:IMusicPlaylist;
  FbyArtist:IMusicGroup;
  FisrcCode:String;
  FrecordingOf:IMusicComposition;
protected
  function Get_inAlbum:IMusicAlbum;virtual;
  procedure Set_inAlbum(v:IMusicAlbum);virtual;
  function Get_inPlaylist:IMusicPlaylist;virtual;
  procedure Set_inPlaylist(v:IMusicPlaylist);virtual;
  function Get_byArtist:IMusicGroup;virtual;
  procedure Set_byArtist(v:IMusicGroup);virtual;
  function Get_isrcCode:String;virtual;
  procedure Set_isrcCode(v:String);virtual;
  function Get_recordingOf:IMusicComposition;virtual;
  procedure Set_recordingOf(v:IMusicComposition);virtual;
public
  property inAlbum:IMusicAlbum read Get_inAlbum write Set_inAlbum;
  property inPlaylist:IMusicPlaylist read Get_inPlaylist write Set_inPlaylist;
  property byArtist:IMusicGroup read Get_byArtist write Set_byArtist;
  property recordingOf:IMusicComposition read Get_recordingOf write Set_recordingOf;
published
  property isrcCode:String read Get_isrcCode write Set_isrcCode;
end;

TMusicAlbumReleaseType=Class; //forward

TMusicAlbumProductionType=Class; //forward


(*MusicAlbum*)
TMusicAlbum=Class  (TMusicPlaylist,IMusicAlbum)
private
  FalbumReleaseType:IMusicAlbumReleaseType;
  FalbumProductionType:IMusicAlbumProductionType;
protected
  function Get_albumReleaseType:IMusicAlbumReleaseType;virtual;
  procedure Set_albumReleaseType(v:IMusicAlbumReleaseType);virtual;
  function Get_albumProductionType:IMusicAlbumProductionType;virtual;
  procedure Set_albumProductionType(v:IMusicAlbumProductionType);virtual;
public
  property albumReleaseType:IMusicAlbumReleaseType read Get_albumReleaseType write Set_albumReleaseType;
  property albumProductionType:IMusicAlbumProductionType read Get_albumProductionType write Set_albumProductionType;
published
end;


(*MusicAlbumReleaseType*)
TMusicAlbumReleaseType=Class  (TEnumeration,IMusicAlbumReleaseType)
  function TangMusicAlbumReleaseType:TangibleValue;virtual;
end;


(*MusicAlbumProductionType*)
TMusicAlbumProductionType=Class  (TEnumeration,IMusicAlbumProductionType)
  function TangMusicAlbumProductionType:TangibleValue;virtual;
end;


(*MusicComposition*)
TMusicComposition=Class  (TCreativeWork,IMusicComposition)
private
  FmusicalKey:String;
  FiswcCode:String;
  FincludedComposition:IMusicComposition;
  FmusicCompositionForm:String;
  FmusicArrangement:IMusicComposition;
  Flyricist:IPerson;
  FfirstPerformance:IEvent;
  Flyrics:ICreativeWork;
protected
  function Get_musicalKey:String;virtual;
  procedure Set_musicalKey(v:String);virtual;
  function Get_iswcCode:String;virtual;
  procedure Set_iswcCode(v:String);virtual;
  function Get_includedComposition:IMusicComposition;virtual;
  procedure Set_includedComposition(v:IMusicComposition);virtual;
  function Get_musicCompositionForm:String;virtual;
  procedure Set_musicCompositionForm(v:String);virtual;
  function Get_musicArrangement:IMusicComposition;virtual;
  procedure Set_musicArrangement(v:IMusicComposition);virtual;
  function Get_lyricist:IPerson;virtual;
  procedure Set_lyricist(v:IPerson);virtual;
  function Get_firstPerformance:IEvent;virtual;
  procedure Set_firstPerformance(v:IEvent);virtual;
  function Get_lyrics:ICreativeWork;virtual;
  procedure Set_lyrics(v:ICreativeWork);virtual;
public
  property includedComposition:IMusicComposition read Get_includedComposition write Set_includedComposition;
  property musicArrangement:IMusicComposition read Get_musicArrangement write Set_musicArrangement;
  property lyricist:IPerson read Get_lyricist write Set_lyricist;
  property firstPerformance:IEvent read Get_firstPerformance write Set_firstPerformance;
  property lyrics:ICreativeWork read Get_lyrics write Set_lyrics;
published
  property musicalKey:String read Get_musicalKey write Set_musicalKey;
  property iswcCode:String read Get_iswcCode write Set_iswcCode;
  property musicCompositionForm:String read Get_musicCompositionForm write Set_musicCompositionForm;
end;


(*Hospital*)
THospital=Class  (TCivicStructure,IHospital)
 (*No atribs*)
end;

TAirport=Class; //forward

TBoardingPolicyType=Class; //forward


(*Flight*)
TFlight=Class  (TIntangible,IFlight)
private
  Fcarrier:IOrganization;
  FmealService:String;
  FflightNumber:String;
  Faircraft:String;
  FdepartureAirport:IAirport;
  FdepartureGate:String;
  FdepartureTerminal:String;
  FflightDistance:IDistance;
  FdepartureTime:TDateTime;
  FestimatedFlightDuration:IDuration;
  FboardingPolicy:IBoardingPolicyType;
  FarrivalAirport:IAirport;
  FwebCheckinTime:TDateTime;
  FarrivalGate:String;
  FarrivalTerminal:String;
protected
  function Get_carrier:IOrganization;virtual;
  procedure Set_carrier(v:IOrganization);virtual;
  function Get_mealService:String;virtual;
  procedure Set_mealService(v:String);virtual;
  function Get_flightNumber:String;virtual;
  procedure Set_flightNumber(v:String);virtual;
  function Get_aircraft:String;virtual;
  procedure Set_aircraft(v:String);virtual;
  function Get_departureAirport:IAirport;virtual;
  procedure Set_departureAirport(v:IAirport);virtual;
  function Get_departureGate:String;virtual;
  procedure Set_departureGate(v:String);virtual;
  function Get_departureTerminal:String;virtual;
  procedure Set_departureTerminal(v:String);virtual;
  function Get_flightDistance:IDistance;virtual;
  procedure Set_flightDistance(v:IDistance);virtual;
  function Get_departureTime:TDateTime;virtual;
  procedure Set_departureTime(v:TDateTime);virtual;
  function Get_estimatedFlightDuration:IDuration;virtual;
  procedure Set_estimatedFlightDuration(v:IDuration);virtual;
  function Get_boardingPolicy:IBoardingPolicyType;virtual;
  procedure Set_boardingPolicy(v:IBoardingPolicyType);virtual;
  function Get_arrivalAirport:IAirport;virtual;
  procedure Set_arrivalAirport(v:IAirport);virtual;
  function Get_webCheckinTime:TDateTime;virtual;
  procedure Set_webCheckinTime(v:TDateTime);virtual;
  function Get_arrivalGate:String;virtual;
  procedure Set_arrivalGate(v:String);virtual;
  function Get_arrivalTerminal:String;virtual;
  procedure Set_arrivalTerminal(v:String);virtual;
public
  property carrier:IOrganization read Get_carrier write Set_carrier;
  property departureAirport:IAirport read Get_departureAirport write Set_departureAirport;
  property flightDistance:IDistance read Get_flightDistance write Set_flightDistance;
  property estimatedFlightDuration:IDuration read Get_estimatedFlightDuration write Set_estimatedFlightDuration;
  property boardingPolicy:IBoardingPolicyType read Get_boardingPolicy write Set_boardingPolicy;
  property arrivalAirport:IAirport read Get_arrivalAirport write Set_arrivalAirport;
published
  property mealService:String read Get_mealService write Set_mealService;
  property flightNumber:String read Get_flightNumber write Set_flightNumber;
  property aircraft:String read Get_aircraft write Set_aircraft;
  property departureGate:String read Get_departureGate write Set_departureGate;
  property departureTerminal:String read Get_departureTerminal write Set_departureTerminal;
  property departureTime:TDateTime read Get_departureTime write Set_departureTime;
  property webCheckinTime:TDateTime read Get_webCheckinTime write Set_webCheckinTime;
  property arrivalGate:String read Get_arrivalGate write Set_arrivalGate;
  property arrivalTerminal:String read Get_arrivalTerminal write Set_arrivalTerminal;
end;


(*Airport*)
TAirport=Class  (TCivicStructure,IAirport)
private
  FicaoCode:String;
protected
  function Get_icaoCode:String;virtual;
  procedure Set_icaoCode(v:String);virtual;
public
published
  property icaoCode:String read Get_icaoCode write Set_icaoCode;
end;


(*BoardingPolicyType*)
TBoardingPolicyType=Class  (TEnumeration,IBoardingPolicyType)
  function TangBoardingPolicyType:TangibleValue;virtual;
end;


(*MovieSeries*)
TMovieSeries=Class  (TCreativeWorkSeries,IMovieSeries)
 (*No atribs*)
end;

TUnitPriceSpecification=Class; //forward


(*CompoundPriceSpecification*)
TCompoundPriceSpecification=Class  (TPriceSpecification,ICompoundPriceSpecification)
private
  FpriceComponent:IUnitPriceSpecification;
protected
  function Get_priceComponent:IUnitPriceSpecification;virtual;
  procedure Set_priceComponent(v:IUnitPriceSpecification);virtual;
public
  property priceComponent:IUnitPriceSpecification read Get_priceComponent write Set_priceComponent;
published
end;


(*UnitPriceSpecification*)
TUnitPriceSpecification=Class  (TPriceSpecification,IUnitPriceSpecification)
private
  FpriceType:String;
  FreferenceQuantity:IQuantitativeValue;
  FbillingIncrement:INumber;
protected
  function Get_priceType:String;virtual;
  procedure Set_priceType(v:String);virtual;
  function Get_referenceQuantity:IQuantitativeValue;virtual;
  procedure Set_referenceQuantity(v:IQuantitativeValue);virtual;
  function Get_billingIncrement:INumber;virtual;
  procedure Set_billingIncrement(v:INumber);virtual;
public
  property referenceQuantity:IQuantitativeValue read Get_referenceQuantity write Set_referenceQuantity;
  property billingIncrement:INumber read Get_billingIncrement write Set_billingIncrement;
published
  property priceType:String read Get_priceType write Set_priceType;
end;


(*EmergencyService*)
TEmergencyService=Class  (TLocalBusiness,IEmergencyService)
 (*No atribs*)
end;


(*IndividualProduct*)
TIndividualProduct=Class  (TProduct,IIndividualProduct)
 (*No atribs*)
end;

TComputerLanguage=Class; //forward


(*SoftwareSourceCode*)
TSoftwareSourceCode=Class  (TCreativeWork,ISoftwareSourceCode)
private
  FsampleType:String;
  Fruntime:String;
  FcodeRepository:String;
  FtargetProduct:ISoftwareApplication;
  FprogrammingLanguage:IComputerLanguage;
protected
  function Get_sampleType:String;virtual;
  procedure Set_sampleType(v:String);virtual;
  function Get_runtime:String;virtual;
  procedure Set_runtime(v:String);virtual;
  function Get_codeRepository:String;virtual;
  procedure Set_codeRepository(v:String);virtual;
  function Get_targetProduct:ISoftwareApplication;virtual;
  procedure Set_targetProduct(v:ISoftwareApplication);virtual;
  function Get_programmingLanguage:IComputerLanguage;virtual;
  procedure Set_programmingLanguage(v:IComputerLanguage);virtual;
public
  property targetProduct:ISoftwareApplication read Get_targetProduct write Set_targetProduct;
  property programmingLanguage:IComputerLanguage read Get_programmingLanguage write Set_programmingLanguage;
published
  property sampleType:String read Get_sampleType write Set_sampleType;
  property runtime:String read Get_runtime write Set_runtime;
  property codeRepository:String read Get_codeRepository write Set_codeRepository;
end;


(*ComputerLanguage*)
TComputerLanguage=Class  (TIntangible,IComputerLanguage)
  function TangComputerLanguage:TangibleValue;virtual;
end;


(*FlightReservation*)
TFlightReservation=Class  (TReservation,IFlightReservation)
private
  FpassengerPriorityStatus:String;
  FsecurityScreening:String;
  FboardingGroup:String;
  FpassengerSequenceNumber:String;
protected
  function Get_passengerPriorityStatus:String;virtual;
  procedure Set_passengerPriorityStatus(v:String);virtual;
  function Get_securityScreening:String;virtual;
  procedure Set_securityScreening(v:String);virtual;
  function Get_boardingGroup:String;virtual;
  procedure Set_boardingGroup(v:String);virtual;
  function Get_passengerSequenceNumber:String;virtual;
  procedure Set_passengerSequenceNumber(v:String);virtual;
public
published
  property passengerPriorityStatus:String read Get_passengerPriorityStatus write Set_passengerPriorityStatus;
  property securityScreening:String read Get_securityScreening write Set_securityScreening;
  property boardingGroup:String read Get_boardingGroup write Set_boardingGroup;
  property passengerSequenceNumber:String read Get_passengerSequenceNumber write Set_passengerSequenceNumber;
end;


(*Suite*)
TSuite=Class  (TAccommodation,ISuite)
private
  FnumberOfRooms:IQuantitativeValue;
protected
  function Get_numberOfRooms:IQuantitativeValue;virtual;
  procedure Set_numberOfRooms(v:IQuantitativeValue);virtual;
public
  property numberOfRooms:IQuantitativeValue read Get_numberOfRooms write Set_numberOfRooms;
published
end;


(*EnumerationValueSet*)
TEnumerationValueSet=Class  (TCreativeWork,IEnumerationValueSet)
private
  FhasEnumerationValue:String;
protected
  function Get_hasEnumerationValue:String;virtual;
  procedure Set_hasEnumerationValue(v:String);virtual;
public
published
  property hasEnumerationValue:String read Get_hasEnumerationValue write Set_hasEnumerationValue;
end;


(*ComicStory*)
TComicStory=Class  (TCreativeWork,IComicStory)
private
  Fcolorist:IPerson;
  Fletterer:IPerson;
protected
  function Get_colorist:IPerson;virtual;
  procedure Set_colorist(v:IPerson);virtual;
  function Get_letterer:IPerson;virtual;
  procedure Set_letterer(v:IPerson);virtual;
public
  property colorist:IPerson read Get_colorist write Set_colorist;
  property letterer:IPerson read Get_letterer write Set_letterer;
published
end;


(*JobPosting*)
TJobPosting=Class  (TIntangible,IJobPosting)
private
  Fskills:String;
  FspecialCommitments:String;
  Fbenefits:String;
  FhiringOrganization:IOrganization;
  FdatePosted:TDateTime;
  FemploymentType:String;
  Ftitle:String;
  FeducationRequirements:String;
  FoccupationalCategory:String;
  FjobLocation:IPlace;
  Findustry:String;
  Fresponsibilities:String;
  FsalaryCurrency:String;
  FexperienceRequirements:String;
  FworkHours:String;
  Fqualifications:String;
  Fincentives:String;
protected
  function Get_skills:String;virtual;
  procedure Set_skills(v:String);virtual;
  function Get_specialCommitments:String;virtual;
  procedure Set_specialCommitments(v:String);virtual;
  function Get_benefits:String;virtual;
  procedure Set_benefits(v:String);virtual;
  function Get_hiringOrganization:IOrganization;virtual;
  procedure Set_hiringOrganization(v:IOrganization);virtual;
  function Get_datePosted:TDateTime;virtual;
  procedure Set_datePosted(v:TDateTime);virtual;
  function Get_employmentType:String;virtual;
  procedure Set_employmentType(v:String);virtual;
  function Get_title:String;virtual;
  procedure Set_title(v:String);virtual;
  function Get_educationRequirements:String;virtual;
  procedure Set_educationRequirements(v:String);virtual;
  function Get_occupationalCategory:String;virtual;
  procedure Set_occupationalCategory(v:String);virtual;
  function Get_jobLocation:IPlace;virtual;
  procedure Set_jobLocation(v:IPlace);virtual;
  function Get_industry:String;virtual;
  procedure Set_industry(v:String);virtual;
  function Get_responsibilities:String;virtual;
  procedure Set_responsibilities(v:String);virtual;
  function Get_salaryCurrency:String;virtual;
  procedure Set_salaryCurrency(v:String);virtual;
  function Get_experienceRequirements:String;virtual;
  procedure Set_experienceRequirements(v:String);virtual;
  function Get_workHours:String;virtual;
  procedure Set_workHours(v:String);virtual;
  function Get_qualifications:String;virtual;
  procedure Set_qualifications(v:String);virtual;
  function Get_incentives:String;virtual;
  procedure Set_incentives(v:String);virtual;
public
  property hiringOrganization:IOrganization read Get_hiringOrganization write Set_hiringOrganization;
  property jobLocation:IPlace read Get_jobLocation write Set_jobLocation;
published
  property skills:String read Get_skills write Set_skills;
  property specialCommitments:String read Get_specialCommitments write Set_specialCommitments;
  property benefits:String read Get_benefits write Set_benefits;
  property datePosted:TDateTime read Get_datePosted write Set_datePosted;
  property employmentType:String read Get_employmentType write Set_employmentType;
  property title:String read Get_title write Set_title;
  property educationRequirements:String read Get_educationRequirements write Set_educationRequirements;
  property occupationalCategory:String read Get_occupationalCategory write Set_occupationalCategory;
  property industry:String read Get_industry write Set_industry;
  property responsibilities:String read Get_responsibilities write Set_responsibilities;
  property salaryCurrency:String read Get_salaryCurrency write Set_salaryCurrency;
  property experienceRequirements:String read Get_experienceRequirements write Set_experienceRequirements;
  property workHours:String read Get_workHours write Set_workHours;
  property qualifications:String read Get_qualifications write Set_qualifications;
  property incentives:String read Get_incentives write Set_incentives;
end;


(*PublicationIssue*)
TPublicationIssue=Class  (TCreativeWork,IPublicationIssue)
private
  Fpagination:String;
  FissueNumber:Integer;
  FpageStart:String;
protected
  function Get_pagination:String;virtual;
  procedure Set_pagination(v:String);virtual;
  function Get_issueNumber:Integer;virtual;
  procedure Set_issueNumber(v:Integer);virtual;
  function Get_pageStart:String;virtual;
  procedure Set_pageStart(v:String);virtual;
public
published
  property pagination:String read Get_pagination write Set_pagination;
  property issueNumber:Integer read Get_issueNumber write Set_issueNumber;
  property pageStart:String read Get_pageStart write Set_pageStart;
end;


(*TVSeason*)
TTVSeason=Class  (TCreativeWork,ITVSeason)
private
  FcountryOfOrigin:ICountry;
protected
  function Get_countryOfOrigin:ICountry;virtual;
  procedure Set_countryOfOrigin(v:ICountry);virtual;
public
  property countryOfOrigin:ICountry read Get_countryOfOrigin write Set_countryOfOrigin;
published
end;


(*InvestmentOrDeposit*)
TInvestmentOrDeposit=Class  (TFinancialProduct,IInvestmentOrDeposit)
  function TangInvestmentOrDeposit:TangibleValue;virtual;
end;


(*Vessel*)
TVessel=Class  (TAnatomicalStructure,IVessel)
 (*No atribs*)
end;


(*Vein*)
TVein=Class  (TVessel,IVein)
private
  FregionDrained:IAnatomicalStructure;
  Ftributary:IAnatomicalStructure;
  FdrainsTo:IVessel;
protected
  function Get_regionDrained:IAnatomicalStructure;virtual;
  procedure Set_regionDrained(v:IAnatomicalStructure);virtual;
  function Get_tributary:IAnatomicalStructure;virtual;
  procedure Set_tributary(v:IAnatomicalStructure);virtual;
  function Get_drainsTo:IVessel;virtual;
  procedure Set_drainsTo(v:IVessel);virtual;
public
  property regionDrained:IAnatomicalStructure read Get_regionDrained write Set_regionDrained;
  property tributary:IAnatomicalStructure read Get_tributary write Set_tributary;
  property drainsTo:IVessel read Get_drainsTo write Set_drainsTo;
published
end;

TLanguage=Class; //forward


(*WriteAction*)
TWriteAction=Class  (TCreateAction,IWriteAction)
private
  Flanguage:ILanguage;
protected
  function Get_language:ILanguage;virtual;
  procedure Set_language(v:ILanguage);virtual;
public
  property language:ILanguage read Get_language write Set_language;
published
end;


(*Language*)
TLanguage=Class  (TIntangible,ILanguage)
  function TangLanguage:TangibleValue;virtual;
end;


(*SellAction*)
TSellAction=Class  (TTradeAction,ISellAction)
private
  Fbuyer:IPerson;
protected
  function Get_buyer:IPerson;virtual;
  procedure Set_buyer(v:IPerson);virtual;
public
  property buyer:IPerson read Get_buyer write Set_buyer;
published
end;

TAnswer=Class; //forward


(*Question*)
TQuestion=Class  (TCreativeWork,IQuestion)
private
  FanswerCount:Integer;
  FacceptedAnswer:IAnswer;
  FdownvoteCount:Integer;
protected
  function Get_answerCount:Integer;virtual;
  procedure Set_answerCount(v:Integer);virtual;
  function Get_acceptedAnswer:IAnswer;virtual;
  procedure Set_acceptedAnswer(v:IAnswer);virtual;
  function Get_downvoteCount:Integer;virtual;
  procedure Set_downvoteCount(v:Integer);virtual;
public
  property acceptedAnswer:IAnswer read Get_acceptedAnswer write Set_acceptedAnswer;
published
  property answerCount:Integer read Get_answerCount write Set_answerCount;
  property downvoteCount:Integer read Get_downvoteCount write Set_downvoteCount;
end;


(*Comment*)
TComment=Class  (TCreativeWork,IComment)
private
  FupvoteCount:Integer;
  FparentItem:IQuestion;
protected
  function Get_upvoteCount:Integer;virtual;
  procedure Set_upvoteCount(v:Integer);virtual;
  function Get_parentItem:IQuestion;virtual;
  procedure Set_parentItem(v:IQuestion);virtual;
public
  property parentItem:IQuestion read Get_parentItem write Set_parentItem;
published
  property upvoteCount:Integer read Get_upvoteCount write Set_upvoteCount;
end;


(*Answer*)
TAnswer=Class  (TComment,IAnswer)
 (*No atribs*)
end;


(*GiveAction*)
TGiveAction=Class  (TTransferAction,IGiveAction)
 (*No atribs*)
end;


(*URL*)
TURL=Class  (TBaseSchema,IURL)
 (*No atribs*)
end;


(*House*)
THouse=Class  (TAccommodation,IHouse)
 (*No atribs*)
end;


(*BedType*)
TBedType=Class  (TQualitativeValue,IBedType)
  function TangBedType:TangibleValue;virtual;
end;

TTrainStation=Class; //forward


(*TrainTrip*)
TTrainTrip=Class  (TIntangible,ITrainTrip)
private
  FtrainNumber:String;
  FdeparturePlatform:String;
  FarrivalStation:ITrainStation;
  FarrivalTime:TDateTime;
  FarrivalPlatform:String;
  FdepartureStation:ITrainStation;
  FtrainName:String;
protected
  function Get_trainNumber:String;virtual;
  procedure Set_trainNumber(v:String);virtual;
  function Get_departurePlatform:String;virtual;
  procedure Set_departurePlatform(v:String);virtual;
  function Get_arrivalStation:ITrainStation;virtual;
  procedure Set_arrivalStation(v:ITrainStation);virtual;
  function Get_arrivalTime:TDateTime;virtual;
  procedure Set_arrivalTime(v:TDateTime);virtual;
  function Get_arrivalPlatform:String;virtual;
  procedure Set_arrivalPlatform(v:String);virtual;
  function Get_departureStation:ITrainStation;virtual;
  procedure Set_departureStation(v:ITrainStation);virtual;
  function Get_trainName:String;virtual;
  procedure Set_trainName(v:String);virtual;
public
  property arrivalStation:ITrainStation read Get_arrivalStation write Set_arrivalStation;
  property departureStation:ITrainStation read Get_departureStation write Set_departureStation;
published
  property trainNumber:String read Get_trainNumber write Set_trainNumber;
  property departurePlatform:String read Get_departurePlatform write Set_departurePlatform;
  property arrivalTime:TDateTime read Get_arrivalTime write Set_arrivalTime;
  property arrivalPlatform:String read Get_arrivalPlatform write Set_arrivalPlatform;
  property trainName:String read Get_trainName write Set_trainName;
end;


(*TrainStation*)
TTrainStation=Class  (TCivicStructure,ITrainStation)
 (*No atribs*)
end;


(*SportsOrganization*)
TSportsOrganization=Class  (TOrganization,ISportsOrganization)
private
  Fsport:String;
protected
  function Get_sport:String;virtual;
  procedure Set_sport(v:String);virtual;
public
published
  property sport:String read Get_sport write Set_sport;
end;


(*SportsTeam*)
TSportsTeam=Class  (TSportsOrganization,ISportsTeam)
private
  Fathlete:IPerson;
  Fcoach:IPerson;
protected
  function Get_athlete:IPerson;virtual;
  procedure Set_athlete(v:IPerson);virtual;
  function Get_coach:IPerson;virtual;
  procedure Set_coach(v:IPerson);virtual;
public
  property athlete:IPerson read Get_athlete write Set_athlete;
  property coach:IPerson read Get_coach write Set_coach;
published
end;


(*Joint*)
TJoint=Class  (TAnatomicalStructure,IJoint)
private
  FfunctionalClass:String;
  FstructuralClass:String;
  FbiomechnicalClass:String;
protected
  function Get_functionalClass:String;virtual;
  procedure Set_functionalClass(v:String);virtual;
  function Get_structuralClass:String;virtual;
  procedure Set_structuralClass(v:String);virtual;
  function Get_biomechnicalClass:String;virtual;
  procedure Set_biomechnicalClass(v:String);virtual;
public
published
  property functionalClass:String read Get_functionalClass write Set_functionalClass;
  property structuralClass:String read Get_structuralClass write Set_structuralClass;
  property biomechnicalClass:String read Get_biomechnicalClass write Set_biomechnicalClass;
end;


(*SingleFamilyResidence*)
TSingleFamilyResidence=Class  (THouse,ISingleFamilyResidence)
 (*No atribs*)
end;


(*TravelAction*)
TTravelAction=Class  (TMoveAction,ITravelAction)
 (*No atribs*)
end;


(*ReplyAction*)
TReplyAction=Class  (TCommunicateAction,IReplyAction)
 (*No atribs*)
end;


(*SomeProducts*)
TSomeProducts=Class  (TProduct,ISomeProducts)
 (*No atribs*)
end;


(*DiagnosticLab*)
TDiagnosticLab=Class  (TMedicalOrganization,IDiagnosticLab)
private
  FavailableTest:IMedicalTest;
protected
  function Get_availableTest:IMedicalTest;virtual;
  procedure Set_availableTest(v:IMedicalTest);virtual;
public
  property availableTest:IMedicalTest read Get_availableTest write Set_availableTest;
published
end;

TCourseInstance=Class; //forward

TCourse=Class; //forward


(*Course*)
TCourse=Class  (TCreativeWork,ICourse)
private
  FhasCourseInstance:ICourseInstance;
  FcourseCode:String;
  FeducationalCredentialAwarded:String;
  FcoursePrerequisites:ICourse;
protected
  function Get_hasCourseInstance:ICourseInstance;virtual;
  procedure Set_hasCourseInstance(v:ICourseInstance);virtual;
  function Get_courseCode:String;virtual;
  procedure Set_courseCode(v:String);virtual;
  function Get_educationalCredentialAwarded:String;virtual;
  procedure Set_educationalCredentialAwarded(v:String);virtual;
  function Get_coursePrerequisites:ICourse;virtual;
  procedure Set_coursePrerequisites(v:ICourse);virtual;
public
  property hasCourseInstance:ICourseInstance read Get_hasCourseInstance write Set_hasCourseInstance;
  property coursePrerequisites:ICourse read Get_coursePrerequisites write Set_coursePrerequisites;
published
  property courseCode:String read Get_courseCode write Set_courseCode;
  property educationalCredentialAwarded:String read Get_educationalCredentialAwarded write Set_educationalCredentialAwarded;
end;


(*CourseInstance*)
TCourseInstance=Class  (TEvent,ICourseInstance)
private
  Finstructor:IPerson;
  FcourseMode:String;
protected
  function Get_instructor:IPerson;virtual;
  procedure Set_instructor(v:IPerson);virtual;
  function Get_courseMode:String;virtual;
  procedure Set_courseMode(v:String);virtual;
public
  property instructor:IPerson read Get_instructor write Set_instructor;
published
  property courseMode:String read Get_courseMode write Set_courseMode;
end;


(*Photograph*)
TPhotograph=Class  (TCreativeWork,IPhotograph)
 (*No atribs*)
end;


(*ReplaceAction*)
TReplaceAction=Class  (TUpdateAction,IReplaceAction)
private
  Freplacee:IThing;
  Freplacer:IThing;
protected
  function Get_replacee:IThing;virtual;
  procedure Set_replacee(v:IThing);virtual;
  function Get_replacer:IThing;virtual;
  procedure Set_replacer(v:IThing);virtual;
public
  property replacee:IThing read Get_replacee write Set_replacee;
  property replacer:IThing read Get_replacer write Set_replacer;
published
end;


(*PublicationVolume*)
TPublicationVolume=Class  (TCreativeWork,IPublicationVolume)
private
  FvolumeNumber:String;
protected
  function Get_volumeNumber:String;virtual;
  procedure Set_volumeNumber(v:String);virtual;
public
published
  property volumeNumber:String read Get_volumeNumber write Set_volumeNumber;
end;


(*RestrictedDiet*)
TRestrictedDiet=Class  (TEnumeration,IRestrictedDiet)
  function TangRestrictedDiet:TangibleValue;virtual;
end;


(*InviteAction*)
TInviteAction=Class  (TCommunicateAction,IInviteAction)
 (*No atribs*)
end;


(*LoseAction*)
TLoseAction=Class  (TAchieveAction,ILoseAction)
private
  Fwinner:IPerson;
protected
  function Get_winner:IPerson;virtual;
  procedure Set_winner(v:IPerson);virtual;
public
  property winner:IPerson read Get_winner write Set_winner;
published
end;


(*Physician*)
TPhysician=Class  (TMedicalBusiness,IPhysician)
private
  FhospitalAffiliation:IHospital;
  FavailableService:IMedicalTest;
protected
  function Get_hospitalAffiliation:IHospital;virtual;
  procedure Set_hospitalAffiliation(v:IHospital);virtual;
  function Get_availableService:IMedicalTest;virtual;
  procedure Set_availableService(v:IMedicalTest);virtual;
public
  property hospitalAffiliation:IHospital read Get_hospitalAffiliation write Set_hospitalAffiliation;
  property availableService:IMedicalTest read Get_availableService write Set_availableService;
published
end;


(*ExercisePlan*)
TExercisePlan=Class  (TCreativeWork,IExercisePlan)
private
  Fworkload:IQualitativeValue;
  FactivityDuration:IQualitativeValue;
  FrestPeriods:String;
  Frepetitions:IQualitativeValue;
  Fintensity:String;
  FadditionalVariable:String;
  FactivityFrequency:IQualitativeValue;
protected
  function Get_workload:IQualitativeValue;virtual;
  procedure Set_workload(v:IQualitativeValue);virtual;
  function Get_activityDuration:IQualitativeValue;virtual;
  procedure Set_activityDuration(v:IQualitativeValue);virtual;
  function Get_restPeriods:String;virtual;
  procedure Set_restPeriods(v:String);virtual;
  function Get_repetitions:IQualitativeValue;virtual;
  procedure Set_repetitions(v:IQualitativeValue);virtual;
  function Get_intensity:String;virtual;
  procedure Set_intensity(v:String);virtual;
  function Get_additionalVariable:String;virtual;
  procedure Set_additionalVariable(v:String);virtual;
  function Get_activityFrequency:IQualitativeValue;virtual;
  procedure Set_activityFrequency(v:IQualitativeValue);virtual;
public
  property workload:IQualitativeValue read Get_workload write Set_workload;
  property activityDuration:IQualitativeValue read Get_activityDuration write Set_activityDuration;
  property repetitions:IQualitativeValue read Get_repetitions write Set_repetitions;
  property activityFrequency:IQualitativeValue read Get_activityFrequency write Set_activityFrequency;
published
  property restPeriods:String read Get_restPeriods write Set_restPeriods;
  property intensity:String read Get_intensity write Set_intensity;
  property additionalVariable:String read Get_additionalVariable write Set_additionalVariable;
end;


(*MusicReleaseFormatType*)
TMusicReleaseFormatType=Class  (TEnumeration,IMusicReleaseFormatType)
  function TangMusicReleaseFormatType:TangibleValue;virtual;
end;


(*Airline*)
TAirline=Class  (TOrganization,IAirline)
private
  FiataCode:String;
protected
  function Get_iataCode:String;virtual;
  procedure Set_iataCode(v:String);virtual;
public
published
  property iataCode:String read Get_iataCode write Set_iataCode;
end;

TInvoice=Class; //forward

TOrderStatus=Class; //forward

TOrderItem=Class; //forward

TParcelDelivery=Class; //forward


(*Order*)
TOrder=Class  (TIntangible,IOrder)
private
  FpartOfInvoice:IInvoice;
  Fdiscount:INumber;
  FdiscountCurrency:String;
  ForderStatus:IOrderStatus;
  Fmerchant:IPerson;
  FacceptedOffer:IOffer;
  FdiscountCode:String;
  FpaymentUrl:String;
  ForderDate:TDateTime;
  FbillingAddress:IPostalAddress;
  ForderedItem:IOrderItem;
  ForderDelivery:IParcelDelivery;
  FconfirmationNumber:String;
  FisGift:Boolean;
  ForderNumber:String;
protected
  function Get_partOfInvoice:IInvoice;virtual;
  procedure Set_partOfInvoice(v:IInvoice);virtual;
  function Get_discount:INumber;virtual;
  procedure Set_discount(v:INumber);virtual;
  function Get_discountCurrency:String;virtual;
  procedure Set_discountCurrency(v:String);virtual;
  function Get_orderStatus:IOrderStatus;virtual;
  procedure Set_orderStatus(v:IOrderStatus);virtual;
  function Get_merchant:IPerson;virtual;
  procedure Set_merchant(v:IPerson);virtual;
  function Get_acceptedOffer:IOffer;virtual;
  procedure Set_acceptedOffer(v:IOffer);virtual;
  function Get_discountCode:String;virtual;
  procedure Set_discountCode(v:String);virtual;
  function Get_paymentUrl:String;virtual;
  procedure Set_paymentUrl(v:String);virtual;
  function Get_orderDate:TDateTime;virtual;
  procedure Set_orderDate(v:TDateTime);virtual;
  function Get_billingAddress:IPostalAddress;virtual;
  procedure Set_billingAddress(v:IPostalAddress);virtual;
  function Get_orderedItem:IOrderItem;virtual;
  procedure Set_orderedItem(v:IOrderItem);virtual;
  function Get_orderDelivery:IParcelDelivery;virtual;
  procedure Set_orderDelivery(v:IParcelDelivery);virtual;
  function Get_confirmationNumber:String;virtual;
  procedure Set_confirmationNumber(v:String);virtual;
  function Get_isGift:Boolean;virtual;
  procedure Set_isGift(v:Boolean);virtual;
  function Get_orderNumber:String;virtual;
  procedure Set_orderNumber(v:String);virtual;
public
  property partOfInvoice:IInvoice read Get_partOfInvoice write Set_partOfInvoice;
  property discount:INumber read Get_discount write Set_discount;
  property orderStatus:IOrderStatus read Get_orderStatus write Set_orderStatus;
  property merchant:IPerson read Get_merchant write Set_merchant;
  property acceptedOffer:IOffer read Get_acceptedOffer write Set_acceptedOffer;
  property billingAddress:IPostalAddress read Get_billingAddress write Set_billingAddress;
  property orderedItem:IOrderItem read Get_orderedItem write Set_orderedItem;
  property orderDelivery:IParcelDelivery read Get_orderDelivery write Set_orderDelivery;
published
  property discountCurrency:String read Get_discountCurrency write Set_discountCurrency;
  property discountCode:String read Get_discountCode write Set_discountCode;
  property paymentUrl:String read Get_paymentUrl write Set_paymentUrl;
  property orderDate:TDateTime read Get_orderDate write Set_orderDate;
  property confirmationNumber:String read Get_confirmationNumber write Set_confirmationNumber;
  property isGift:Boolean read Get_isGift write Set_isGift;
  property orderNumber:String read Get_orderNumber write Set_orderNumber;
end;

TPaymentStatusType=Class; //forward

TMonetaryAmount=Class; //forward


(*Invoice*)
TInvoice=Class  (TIntangible,IInvoice)
private
  FpaymentDue:TDateTime;
  FpaymentMethod:IPaymentMethod;
  FminimumPaymentDue:IPriceSpecification;
  FpaymentMethodId:String;
  FscheduledPaymentDate:TDateTime;
  FaccountId:String;
  FreferencesOrder:IOrder;
  FpaymentStatus:IPaymentStatusType;
  Fcustomer:IOrganization;
  FtotalPaymentDue:IMonetaryAmount;
  FbillingPeriod:IDuration;
protected
  function Get_paymentDue:TDateTime;virtual;
  procedure Set_paymentDue(v:TDateTime);virtual;
  function Get_paymentMethod:IPaymentMethod;virtual;
  procedure Set_paymentMethod(v:IPaymentMethod);virtual;
  function Get_minimumPaymentDue:IPriceSpecification;virtual;
  procedure Set_minimumPaymentDue(v:IPriceSpecification);virtual;
  function Get_paymentMethodId:String;virtual;
  procedure Set_paymentMethodId(v:String);virtual;
  function Get_scheduledPaymentDate:TDateTime;virtual;
  procedure Set_scheduledPaymentDate(v:TDateTime);virtual;
  function Get_accountId:String;virtual;
  procedure Set_accountId(v:String);virtual;
  function Get_referencesOrder:IOrder;virtual;
  procedure Set_referencesOrder(v:IOrder);virtual;
  function Get_paymentStatus:IPaymentStatusType;virtual;
  procedure Set_paymentStatus(v:IPaymentStatusType);virtual;
  function Get_customer:IOrganization;virtual;
  procedure Set_customer(v:IOrganization);virtual;
  function Get_totalPaymentDue:IMonetaryAmount;virtual;
  procedure Set_totalPaymentDue(v:IMonetaryAmount);virtual;
  function Get_billingPeriod:IDuration;virtual;
  procedure Set_billingPeriod(v:IDuration);virtual;
public
  property paymentMethod:IPaymentMethod read Get_paymentMethod write Set_paymentMethod;
  property minimumPaymentDue:IPriceSpecification read Get_minimumPaymentDue write Set_minimumPaymentDue;
  property referencesOrder:IOrder read Get_referencesOrder write Set_referencesOrder;
  property paymentStatus:IPaymentStatusType read Get_paymentStatus write Set_paymentStatus;
  property customer:IOrganization read Get_customer write Set_customer;
  property totalPaymentDue:IMonetaryAmount read Get_totalPaymentDue write Set_totalPaymentDue;
  property billingPeriod:IDuration read Get_billingPeriod write Set_billingPeriod;
published
  property paymentDue:TDateTime read Get_paymentDue write Set_paymentDue;
  property paymentMethodId:String read Get_paymentMethodId write Set_paymentMethodId;
  property scheduledPaymentDate:TDateTime read Get_scheduledPaymentDate write Set_scheduledPaymentDate;
  property accountId:String read Get_accountId write Set_accountId;
end;


(*PaymentStatusType*)
TPaymentStatusType=Class  (TEnumeration,IPaymentStatusType)
  function TangPaymentStatusType:TangibleValue;virtual;
end;


(*MonetaryAmount*)
TMonetaryAmount=Class  (TStructuredValue,IMonetaryAmount)
private
  Fvalue:IStructuredValue;
protected
  function Get_value:IStructuredValue;virtual;
  procedure Set_value(v:IStructuredValue);virtual;
public
  property value:IStructuredValue read Get_value write Set_value;
published
end;


(*OrderStatus*)
TOrderStatus=Class  (TEnumeration,IOrderStatus)
  function TangOrderStatus:TangibleValue;virtual;
end;


(*OrderItem*)
TOrderItem=Class  (TIntangible,IOrderItem)
private
  ForderQuantity:INumber;
  ForderItemStatus:IOrderStatus;
  ForderItemNumber:String;
protected
  function Get_orderQuantity:INumber;virtual;
  procedure Set_orderQuantity(v:INumber);virtual;
  function Get_orderItemStatus:IOrderStatus;virtual;
  procedure Set_orderItemStatus(v:IOrderStatus);virtual;
  function Get_orderItemNumber:String;virtual;
  procedure Set_orderItemNumber(v:String);virtual;
public
  property orderQuantity:INumber read Get_orderQuantity write Set_orderQuantity;
  property orderItemStatus:IOrderStatus read Get_orderItemStatus write Set_orderItemStatus;
published
  property orderItemNumber:String read Get_orderItemNumber write Set_orderItemNumber;
end;

TDeliveryEvent=Class; //forward


(*ParcelDelivery*)
TParcelDelivery=Class  (TIntangible,IParcelDelivery)
private
  FtrackingNumber:String;
  FpartOfOrder:IOrder;
  FexpectedArrivalFrom:TDateTime;
  FhasDeliveryMethod:IDeliveryMethod;
  FitemShipped:IProduct;
  FdeliveryAddress:IPostalAddress;
  FdeliveryStatus:IDeliveryEvent;
  ForiginAddress:IPostalAddress;
  FtrackingUrl:String;
  FexpectedArrivalUntil:TDateTime;
protected
  function Get_trackingNumber:String;virtual;
  procedure Set_trackingNumber(v:String);virtual;
  function Get_partOfOrder:IOrder;virtual;
  procedure Set_partOfOrder(v:IOrder);virtual;
  function Get_expectedArrivalFrom:TDateTime;virtual;
  procedure Set_expectedArrivalFrom(v:TDateTime);virtual;
  function Get_hasDeliveryMethod:IDeliveryMethod;virtual;
  procedure Set_hasDeliveryMethod(v:IDeliveryMethod);virtual;
  function Get_itemShipped:IProduct;virtual;
  procedure Set_itemShipped(v:IProduct);virtual;
  function Get_deliveryAddress:IPostalAddress;virtual;
  procedure Set_deliveryAddress(v:IPostalAddress);virtual;
  function Get_deliveryStatus:IDeliveryEvent;virtual;
  procedure Set_deliveryStatus(v:IDeliveryEvent);virtual;
  function Get_originAddress:IPostalAddress;virtual;
  procedure Set_originAddress(v:IPostalAddress);virtual;
  function Get_trackingUrl:String;virtual;
  procedure Set_trackingUrl(v:String);virtual;
  function Get_expectedArrivalUntil:TDateTime;virtual;
  procedure Set_expectedArrivalUntil(v:TDateTime);virtual;
public
  property partOfOrder:IOrder read Get_partOfOrder write Set_partOfOrder;
  property hasDeliveryMethod:IDeliveryMethod read Get_hasDeliveryMethod write Set_hasDeliveryMethod;
  property itemShipped:IProduct read Get_itemShipped write Set_itemShipped;
  property deliveryAddress:IPostalAddress read Get_deliveryAddress write Set_deliveryAddress;
  property deliveryStatus:IDeliveryEvent read Get_deliveryStatus write Set_deliveryStatus;
  property originAddress:IPostalAddress read Get_originAddress write Set_originAddress;
published
  property trackingNumber:String read Get_trackingNumber write Set_trackingNumber;
  property expectedArrivalFrom:TDateTime read Get_expectedArrivalFrom write Set_expectedArrivalFrom;
  property trackingUrl:String read Get_trackingUrl write Set_trackingUrl;
  property expectedArrivalUntil:TDateTime read Get_expectedArrivalUntil write Set_expectedArrivalUntil;
end;


(*DeliveryEvent*)
TDeliveryEvent=Class  (TEvent,IDeliveryEvent)
private
  FaccessCode:String;
  FavailableFrom:TDateTime;
  FavailableThrough:TDateTime;
protected
  function Get_accessCode:String;virtual;
  procedure Set_accessCode(v:String);virtual;
  function Get_availableFrom:TDateTime;virtual;
  procedure Set_availableFrom(v:TDateTime);virtual;
  function Get_availableThrough:TDateTime;virtual;
  procedure Set_availableThrough(v:TDateTime);virtual;
public
published
  property accessCode:String read Get_accessCode write Set_accessCode;
  property availableFrom:TDateTime read Get_availableFrom write Set_availableFrom;
  property availableThrough:TDateTime read Get_availableThrough write Set_availableThrough;
end;


(*PlayAction*)
TPlayAction=Class  (TAction,IPlayAction)
 (*No atribs*)
end;


(*EndorseAction*)
TEndorseAction=Class  (TReactAction,IEndorseAction)
private
  Fendorsee:IOrganization;
protected
  function Get_endorsee:IOrganization;virtual;
  procedure Set_endorsee(v:IOrganization);virtual;
public
  property endorsee:IOrganization read Get_endorsee write Set_endorsee;
published
end;


(*DatedMoneySpecification*)
TDatedMoneySpecification=Class  (TStructuredValue,IDatedMoneySpecification)
private
  Fcurrency:String;
protected
  function Get_currency:String;virtual;
  procedure Set_currency(v:String);virtual;
public
published
  property currency:String read Get_currency write Set_currency;
end;


(*Quotation*)
TQuotation=Class  (TCreativeWork,IQuotation)
private
  FspokenByCharacter:IOrganization;
protected
  function Get_spokenByCharacter:IOrganization;virtual;
  procedure Set_spokenByCharacter(v:IOrganization);virtual;
public
  property spokenByCharacter:IOrganization read Get_spokenByCharacter write Set_spokenByCharacter;
published
end;


(*MedicalWebPage*)
TMedicalWebPage=Class  (TWebPage,IMedicalWebPage)
private
  Faspect:String;
protected
  function Get_aspect:String;virtual;
  procedure Set_aspect(v:String);virtual;
public
published
  property aspect:String read Get_aspect write Set_aspect;
end;


(*OrderAction*)
TOrderAction=Class  (TTradeAction,IOrderAction)
 (*No atribs*)
end;


(*MedicalTestPanel*)
TMedicalTestPanel=Class  (TMedicalTest,IMedicalTestPanel)
private
  FsubTest:IMedicalTest;
protected
  function Get_subTest:IMedicalTest;virtual;
  procedure Set_subTest(v:IMedicalTest);virtual;
public
  property subTest:IMedicalTest read Get_subTest write Set_subTest;
published
end;

TNerve=Class; //forward

TMuscle=Class; //forward


(*Muscle*)
TMuscle=Class  (TAnatomicalStructure,IMuscle)
private
  Fnerve:INerve;
  Forigin:IAnatomicalStructure;
  Faction:String;
  FbloodSupply:IVessel;
  Finsertion:IAnatomicalStructure;
  Fantagonist:IMuscle;
  FmuscleAction:String;
protected
  function Get_nerve:INerve;virtual;
  procedure Set_nerve(v:INerve);virtual;
  function Get_origin:IAnatomicalStructure;virtual;
  procedure Set_origin(v:IAnatomicalStructure);virtual;
  function Get_action:String;virtual;
  procedure Set_action(v:String);virtual;
  function Get_bloodSupply:IVessel;virtual;
  procedure Set_bloodSupply(v:IVessel);virtual;
  function Get_insertion:IAnatomicalStructure;virtual;
  procedure Set_insertion(v:IAnatomicalStructure);virtual;
  function Get_antagonist:IMuscle;virtual;
  procedure Set_antagonist(v:IMuscle);virtual;
  function Get_muscleAction:String;virtual;
  procedure Set_muscleAction(v:String);virtual;
public
  property nerve:INerve read Get_nerve write Set_nerve;
  property origin:IAnatomicalStructure read Get_origin write Set_origin;
  property bloodSupply:IVessel read Get_bloodSupply write Set_bloodSupply;
  property insertion:IAnatomicalStructure read Get_insertion write Set_insertion;
  property antagonist:IMuscle read Get_antagonist write Set_antagonist;
published
  property action:String read Get_action write Set_action;
  property muscleAction:String read Get_muscleAction write Set_muscleAction;
end;

TBrainStructure=Class; //forward


(*Nerve*)
TNerve=Class  (TAnatomicalStructure,INerve)
private
  FsourcedFrom:IBrainStructure;
  Fbranch:IAnatomicalStructure;
  FnerveMotor:IMuscle;
  FsensoryUnit:IAnatomicalStructure;
protected
  function Get_sourcedFrom:IBrainStructure;virtual;
  procedure Set_sourcedFrom(v:IBrainStructure);virtual;
  function Get_branch:IAnatomicalStructure;virtual;
  procedure Set_branch(v:IAnatomicalStructure);virtual;
  function Get_nerveMotor:IMuscle;virtual;
  procedure Set_nerveMotor(v:IMuscle);virtual;
  function Get_sensoryUnit:IAnatomicalStructure;virtual;
  procedure Set_sensoryUnit(v:IAnatomicalStructure);virtual;
public
  property sourcedFrom:IBrainStructure read Get_sourcedFrom write Set_sourcedFrom;
  property branch:IAnatomicalStructure read Get_branch write Set_branch;
  property nerveMotor:IMuscle read Get_nerveMotor write Set_nerveMotor;
  property sensoryUnit:IAnatomicalStructure read Get_sensoryUnit write Set_sensoryUnit;
published
end;


(*BrainStructure*)
TBrainStructure=Class  (TAnatomicalStructure,IBrainStructure)
 (*No atribs*)
end;


(*SendAction*)
TSendAction=Class  (TTransferAction,ISendAction)
private
  FdeliveryMethod:IDeliveryMethod;
protected
  function Get_deliveryMethod:IDeliveryMethod;virtual;
  procedure Set_deliveryMethod(v:IDeliveryMethod);virtual;
public
  property deliveryMethod:IDeliveryMethod read Get_deliveryMethod write Set_deliveryMethod;
published
end;


(*PaymentChargeSpecification*)
TPaymentChargeSpecification=Class  (TPriceSpecification,IPaymentChargeSpecification)
private
  FappliesToDeliveryMethod:IDeliveryMethod;
  FappliesToPaymentMethod:IPaymentMethod;
protected
  function Get_appliesToDeliveryMethod:IDeliveryMethod;virtual;
  procedure Set_appliesToDeliveryMethod(v:IDeliveryMethod);virtual;
  function Get_appliesToPaymentMethod:IPaymentMethod;virtual;
  procedure Set_appliesToPaymentMethod(v:IPaymentMethod);virtual;
public
  property appliesToDeliveryMethod:IDeliveryMethod read Get_appliesToDeliveryMethod write Set_appliesToDeliveryMethod;
  property appliesToPaymentMethod:IPaymentMethod read Get_appliesToPaymentMethod write Set_appliesToPaymentMethod;
published
end;


(*InfectiousAgentClass*)
TInfectiousAgentClass=Class  (TMedicalEnumeration,IInfectiousAgentClass)
  function TangInfectiousAgentClass:TangibleValue;virtual;
end;


(*Artery*)
TArtery=Class  (TVessel,IArtery)
private
  FsupplyTo:IAnatomicalStructure;
  Fsource:IAnatomicalStructure;
protected
  function Get_supplyTo:IAnatomicalStructure;virtual;
  procedure Set_supplyTo(v:IAnatomicalStructure);virtual;
  function Get_source:IAnatomicalStructure;virtual;
  procedure Set_source(v:IAnatomicalStructure);virtual;
public
  property supplyTo:IAnatomicalStructure read Get_supplyTo write Set_supplyTo;
  property source:IAnatomicalStructure read Get_source write Set_source;
published
end;


(*LiveBlogPosting*)
TLiveBlogPosting=Class  (TBlogPosting,ILiveBlogPosting)
private
  FcoverageEndTime:TDateTime;
  FliveBlogUpdate:IBlogPosting;
  FcoverageStartTime:TDateTime;
protected
  function Get_coverageEndTime:TDateTime;virtual;
  procedure Set_coverageEndTime(v:TDateTime);virtual;
  function Get_liveBlogUpdate:IBlogPosting;virtual;
  procedure Set_liveBlogUpdate(v:IBlogPosting);virtual;
  function Get_coverageStartTime:TDateTime;virtual;
  procedure Set_coverageStartTime(v:TDateTime);virtual;
public
  property liveBlogUpdate:IBlogPosting read Get_liveBlogUpdate write Set_liveBlogUpdate;
published
  property coverageEndTime:TDateTime read Get_coverageEndTime write Set_coverageEndTime;
  property coverageStartTime:TDateTime read Get_coverageStartTime write Set_coverageStartTime;
end;

TMedicalObservationalStudyDesign=Class; //forward


(*MedicalObservationalStudy*)
TMedicalObservationalStudy=Class  (TMedicalStudy,IMedicalObservationalStudy)
private
  FstudyDesign:IMedicalObservationalStudyDesign;
protected
  function Get_studyDesign:IMedicalObservationalStudyDesign;virtual;
  procedure Set_studyDesign(v:IMedicalObservationalStudyDesign);virtual;
public
  property studyDesign:IMedicalObservationalStudyDesign read Get_studyDesign write Set_studyDesign;
published
end;


(*MedicalObservationalStudyDesign*)
TMedicalObservationalStudyDesign=Class  (TMedicalEnumeration,IMedicalObservationalStudyDesign)
  function TangMedicalObservationalStudyDesign:TangibleValue;virtual;
end;


(*Boolean*)
TBoolean=Class  (TBaseSchema,IBoolean)
 (*No atribs*)
end;


(*SearchAction*)
TSearchAction=Class  (TAction,ISearchAction)
private
  Fquery:String;
protected
  function Get_query:String;virtual;
  procedure Set_query(v:String);virtual;
public
published
  property query:String read Get_query write Set_query;
end;


(*Role*)
TRole=Class  (TIntangible,IRole)
private
  FnamedPosition:String;
  FendDate:TDateTime;
protected
  function Get_namedPosition:String;virtual;
  procedure Set_namedPosition(v:String);virtual;
  function Get_endDate:TDateTime;virtual;
  procedure Set_endDate(v:TDateTime);virtual;
public
published
  property namedPosition:String read Get_namedPosition write Set_namedPosition;
  property endDate:TDateTime read Get_endDate write Set_endDate;
end;


(*OrganizationRole*)
TOrganizationRole=Class  (TRole,IOrganizationRole)
private
  FnumberedPosition:INumber;
protected
  function Get_numberedPosition:INumber;virtual;
  procedure Set_numberedPosition(v:INumber);virtual;
public
  property numberedPosition:INumber read Get_numberedPosition write Set_numberedPosition;
published
end;


(*EmployeeRole*)
TEmployeeRole=Class  (TOrganizationRole,IEmployeeRole)
private
  FbaseSalary:INumber;
protected
  function Get_baseSalary:INumber;virtual;
  procedure Set_baseSalary(v:INumber);virtual;
public
  property baseSalary:INumber read Get_baseSalary write Set_baseSalary;
published
end;


(*LifestyleModification*)
TLifestyleModification=Class  (TMedicalEntity,ILifestyleModification)
 (*No atribs*)
end;

TMapCategoryType=Class; //forward


(*Map*)
TMap=Class  (TCreativeWork,IMap)
private
  FmapType:IMapCategoryType;
protected
  function Get_mapType:IMapCategoryType;virtual;
  procedure Set_mapType(v:IMapCategoryType);virtual;
public
  property mapType:IMapCategoryType read Get_mapType write Set_mapType;
published
end;


(*MapCategoryType*)
TMapCategoryType=Class  (TEnumeration,IMapCategoryType)
  function TangMapCategoryType:TangibleValue;virtual;
end;

TRsvpResponseType=Class; //forward


(*RsvpAction*)
TRsvpAction=Class  (TInformAction,IRsvpAction)
private
  FrsvpResponse:IRsvpResponseType;
  Fcomment:IComment;
  FadditionalNumberOfGuests:INumber;
protected
  function Get_rsvpResponse:IRsvpResponseType;virtual;
  procedure Set_rsvpResponse(v:IRsvpResponseType);virtual;
  function Get_comment:IComment;virtual;
  procedure Set_comment(v:IComment);virtual;
  function Get_additionalNumberOfGuests:INumber;virtual;
  procedure Set_additionalNumberOfGuests(v:INumber);virtual;
public
  property rsvpResponse:IRsvpResponseType read Get_rsvpResponse write Set_rsvpResponse;
  property comment:IComment read Get_comment write Set_comment;
  property additionalNumberOfGuests:INumber read Get_additionalNumberOfGuests write Set_additionalNumberOfGuests;
published
end;


(*RsvpResponseType*)
TRsvpResponseType=Class  (TEnumeration,IRsvpResponseType)
  function TangRsvpResponseType:TangibleValue;virtual;
end;


(*Energy*)
TEnergy=Class  (TQuantity,IEnergy)
  function TangEnergy:TangibleValue;virtual;
end;


(*WarrantyScope*)
TWarrantyScope=Class  (TEnumeration,IWarrantyScope)
  function TangWarrantyScope:TangibleValue;virtual;
end;


(*FoodEvent*)
TFoodEvent=Class  (TEvent,IFoodEvent)
 (*No atribs*)
end;


(*LendAction*)
TLendAction=Class  (TTransferAction,ILendAction)
private
  Fborrower:IPerson;
protected
  function Get_borrower:IPerson;virtual;
  procedure Set_borrower(v:IPerson);virtual;
public
  property borrower:IPerson read Get_borrower write Set_borrower;
published
end;


(*Game*)
TGame=Class  (TCreativeWork,IGame)
private
  FcharacterAttribute:IThing;
protected
  function Get_characterAttribute:IThing;virtual;
  procedure Set_characterAttribute(v:IThing);virtual;
public
  property characterAttribute:IThing read Get_characterAttribute write Set_characterAttribute;
published
end;


(*Corporation*)
TCorporation=Class  (TOrganization,ICorporation)
private
  FtickerSymbol:String;
protected
  function Get_tickerSymbol:String;virtual;
  procedure Set_tickerSymbol(v:String);virtual;
public
published
  property tickerSymbol:String read Get_tickerSymbol write Set_tickerSymbol;
end;

TProperty=Class; //forward

TClass=Class; //forward


(*Property*)
TProperty=Class  (TIntangible,IProperty)
private
  FsupersededBy:IEnumeration;
  FinverseOf:IProperty;
  FdomainIncludes:IClass;
  FrangeIncludes:IClass;
protected
  function Get_supersededBy:IEnumeration;virtual;
  procedure Set_supersededBy(v:IEnumeration);virtual;
  function Get_inverseOf:IProperty;virtual;
  procedure Set_inverseOf(v:IProperty);virtual;
  function Get_domainIncludes:IClass;virtual;
  procedure Set_domainIncludes(v:IClass);virtual;
  function Get_rangeIncludes:IClass;virtual;
  procedure Set_rangeIncludes(v:IClass);virtual;
public
  property supersededBy:IEnumeration read Get_supersededBy write Set_supersededBy;
  property inverseOf:IProperty read Get_inverseOf write Set_inverseOf;
  property domainIncludes:IClass read Get_domainIncludes write Set_domainIncludes;
  property rangeIncludes:IClass read Get_rangeIncludes write Set_rangeIncludes;
published
end;


(*Class*)
TClass=Class  (TIntangible,IClass)
  function TangClass:TangibleValue;virtual;
end;

TSportsEvent=Class; //forward

TDiet=Class; //forward


(*ExerciseAction*)
TExerciseAction=Class  (TPlayAction,IExerciseAction)
private
  FfromLocation:IPlace;
  Fcourse:IPlace;
  FsportsTeam:ISportsTeam;
  Fdistance:IDistance;
  FsportsActivityLocation:ISportsActivityLocation;
  Fopponent:IPerson;
  FsportsEvent:ISportsEvent;
  FexercisePlan:IExercisePlan;
  Fdiet:IDiet;
  FexerciseRelatedDiet:IDiet;
  FexerciseType:String;
protected
  function Get_fromLocation:IPlace;virtual;
  procedure Set_fromLocation(v:IPlace);virtual;
  function Get_course:IPlace;virtual;
  procedure Set_course(v:IPlace);virtual;
  function Get_sportsTeam:ISportsTeam;virtual;
  procedure Set_sportsTeam(v:ISportsTeam);virtual;
  function Get_distance:IDistance;virtual;
  procedure Set_distance(v:IDistance);virtual;
  function Get_sportsActivityLocation:ISportsActivityLocation;virtual;
  procedure Set_sportsActivityLocation(v:ISportsActivityLocation);virtual;
  function Get_opponent:IPerson;virtual;
  procedure Set_opponent(v:IPerson);virtual;
  function Get_sportsEvent:ISportsEvent;virtual;
  procedure Set_sportsEvent(v:ISportsEvent);virtual;
  function Get_exercisePlan:IExercisePlan;virtual;
  procedure Set_exercisePlan(v:IExercisePlan);virtual;
  function Get_diet:IDiet;virtual;
  procedure Set_diet(v:IDiet);virtual;
  function Get_exerciseRelatedDiet:IDiet;virtual;
  procedure Set_exerciseRelatedDiet(v:IDiet);virtual;
  function Get_exerciseType:String;virtual;
  procedure Set_exerciseType(v:String);virtual;
public
  property fromLocation:IPlace read Get_fromLocation write Set_fromLocation;
  property course:IPlace read Get_course write Set_course;
  property sportsTeam:ISportsTeam read Get_sportsTeam write Set_sportsTeam;
  property distance:IDistance read Get_distance write Set_distance;
  property sportsActivityLocation:ISportsActivityLocation read Get_sportsActivityLocation write Set_sportsActivityLocation;
  property opponent:IPerson read Get_opponent write Set_opponent;
  property sportsEvent:ISportsEvent read Get_sportsEvent write Set_sportsEvent;
  property exercisePlan:IExercisePlan read Get_exercisePlan write Set_exercisePlan;
  property diet:IDiet read Get_diet write Set_diet;
  property exerciseRelatedDiet:IDiet read Get_exerciseRelatedDiet write Set_exerciseRelatedDiet;
published
  property exerciseType:String read Get_exerciseType write Set_exerciseType;
end;


(*SportsEvent*)
TSportsEvent=Class  (TEvent,ISportsEvent)
private
  FhomeTeam:ISportsTeam;
  FawayTeam:IPerson;
protected
  function Get_homeTeam:ISportsTeam;virtual;
  procedure Set_homeTeam(v:ISportsTeam);virtual;
  function Get_awayTeam:IPerson;virtual;
  procedure Set_awayTeam(v:IPerson);virtual;
public
  property homeTeam:ISportsTeam read Get_homeTeam write Set_homeTeam;
  property awayTeam:IPerson read Get_awayTeam write Set_awayTeam;
published
end;


(*Diet*)
TDiet=Class  (TCreativeWork,IDiet)
private
  FdietFeatures:String;
  FexpertConsiderations:String;
  Foverview:String;
  Fendorsers:IOrganization;
  Frisks:String;
  FphysiologicalBenefits:String;
protected
  function Get_dietFeatures:String;virtual;
  procedure Set_dietFeatures(v:String);virtual;
  function Get_expertConsiderations:String;virtual;
  procedure Set_expertConsiderations(v:String);virtual;
  function Get_overview:String;virtual;
  procedure Set_overview(v:String);virtual;
  function Get_endorsers:IOrganization;virtual;
  procedure Set_endorsers(v:IOrganization);virtual;
  function Get_risks:String;virtual;
  procedure Set_risks(v:String);virtual;
  function Get_physiologicalBenefits:String;virtual;
  procedure Set_physiologicalBenefits(v:String);virtual;
public
  property endorsers:IOrganization read Get_endorsers write Set_endorsers;
published
  property dietFeatures:String read Get_dietFeatures write Set_dietFeatures;
  property expertConsiderations:String read Get_expertConsiderations write Set_expertConsiderations;
  property overview:String read Get_overview write Set_overview;
  property risks:String read Get_risks write Set_risks;
  property physiologicalBenefits:String read Get_physiologicalBenefits write Set_physiologicalBenefits;
end;


(*Audiobook*)
TAudiobook=Class  (TAudioObject,IAudiobook)
private
  FreadBy:IPerson;
protected
  function Get_readBy:IPerson;virtual;
  procedure Set_readBy(v:IPerson);virtual;
public
  property readBy:IPerson read Get_readBy write Set_readBy;
published
end;

TBookFormatType=Class; //forward


(*Book*)
TBook=Class  (TCreativeWork,IBook)
private
  Fabridged:Boolean;
  Fisbn:String;
  FbookFormat:IBookFormatType;
  FbookEdition:String;
  FnumberOfPages:Integer;
  Fillustrator:IPerson;
protected
  function Get_abridged:Boolean;virtual;
  procedure Set_abridged(v:Boolean);virtual;
  function Get_isbn:String;virtual;
  procedure Set_isbn(v:String);virtual;
  function Get_bookFormat:IBookFormatType;virtual;
  procedure Set_bookFormat(v:IBookFormatType);virtual;
  function Get_bookEdition:String;virtual;
  procedure Set_bookEdition(v:String);virtual;
  function Get_numberOfPages:Integer;virtual;
  procedure Set_numberOfPages(v:Integer);virtual;
  function Get_illustrator:IPerson;virtual;
  procedure Set_illustrator(v:IPerson);virtual;
public
  property bookFormat:IBookFormatType read Get_bookFormat write Set_bookFormat;
  property illustrator:IPerson read Get_illustrator write Set_illustrator;
published
  property abridged:Boolean read Get_abridged write Set_abridged;
  property isbn:String read Get_isbn write Set_isbn;
  property bookEdition:String read Get_bookEdition write Set_bookEdition;
  property numberOfPages:Integer read Get_numberOfPages write Set_numberOfPages;
end;


(*BookFormatType*)
TBookFormatType=Class  (TEnumeration,IBookFormatType)
  function TangBookFormatType:TangibleValue;virtual;
end;


(*BroadcastEvent*)
TBroadcastEvent=Class  (TPublicationEvent,IBroadcastEvent)
private
  FbroadcastOfEvent:IEvent;
  FisLiveBroadcast:Boolean;
protected
  function Get_broadcastOfEvent:IEvent;virtual;
  procedure Set_broadcastOfEvent(v:IEvent);virtual;
  function Get_isLiveBroadcast:Boolean;virtual;
  procedure Set_isLiveBroadcast(v:Boolean);virtual;
public
  property broadcastOfEvent:IEvent read Get_broadcastOfEvent write Set_broadcastOfEvent;
published
  property isLiveBroadcast:Boolean read Get_isLiveBroadcast write Set_isLiveBroadcast;
end;


(*WarrantyPromise*)
TWarrantyPromise=Class  (TStructuredValue,IWarrantyPromise)
private
  FwarrantyScope:IWarrantyScope;
  FdurationOfWarranty:IQuantitativeValue;
protected
  function Get_warrantyScope:IWarrantyScope;virtual;
  procedure Set_warrantyScope(v:IWarrantyScope);virtual;
  function Get_durationOfWarranty:IQuantitativeValue;virtual;
  procedure Set_durationOfWarranty(v:IQuantitativeValue);virtual;
public
  property warrantyScope:IWarrantyScope read Get_warrantyScope write Set_warrantyScope;
  property durationOfWarranty:IQuantitativeValue read Get_durationOfWarranty write Set_durationOfWarranty;
published
end;


(*DataFeedItem*)
TDataFeedItem=Class  (TIntangible,IDataFeedItem)
private
  FdateDeleted:TDateTime;
  FdateCreated:TDateTime;
  FdateModified:TDateTime;
protected
  function Get_dateDeleted:TDateTime;virtual;
  procedure Set_dateDeleted(v:TDateTime);virtual;
  function Get_dateCreated:TDateTime;virtual;
  procedure Set_dateCreated(v:TDateTime);virtual;
  function Get_dateModified:TDateTime;virtual;
  procedure Set_dateModified(v:TDateTime);virtual;
public
published
  property dateDeleted:TDateTime read Get_dateDeleted write Set_dateDeleted;
  property dateCreated:TDateTime read Get_dateCreated write Set_dateCreated;
  property dateModified:TDateTime read Get_dateModified write Set_dateModified;
end;


(*Chapter*)
TChapter=Class  (TCreativeWork,IChapter)
 (*No atribs*)
end;

TGameServerStatus=Class; //forward


(*GameServer*)
TGameServer=Class  (TIntangible,IGameServer)
private
  FplayersOnline:Integer;
  FserverStatus:IGameServerStatus;
protected
  function Get_playersOnline:Integer;virtual;
  procedure Set_playersOnline(v:Integer);virtual;
  function Get_serverStatus:IGameServerStatus;virtual;
  procedure Set_serverStatus(v:IGameServerStatus);virtual;
public
  property serverStatus:IGameServerStatus read Get_serverStatus write Set_serverStatus;
published
  property playersOnline:Integer read Get_playersOnline write Set_playersOnline;
end;


(*GameServerStatus*)
TGameServerStatus=Class  (TEnumeration,IGameServerStatus)
  function TangGameServerStatus:TangibleValue;virtual;
end;


(*OwnershipInfo*)
TOwnershipInfo=Class  (TStructuredValue,IOwnershipInfo)
private
  FownedThrough:TDateTime;
  FownedFrom:TDateTime;
  FacquiredFrom:IPerson;
protected
  function Get_ownedThrough:TDateTime;virtual;
  procedure Set_ownedThrough(v:TDateTime);virtual;
  function Get_ownedFrom:TDateTime;virtual;
  procedure Set_ownedFrom(v:TDateTime);virtual;
  function Get_acquiredFrom:IPerson;virtual;
  procedure Set_acquiredFrom(v:IPerson);virtual;
public
  property acquiredFrom:IPerson read Get_acquiredFrom write Set_acquiredFrom;
published
  property ownedThrough:TDateTime read Get_ownedThrough write Set_ownedThrough;
  property ownedFrom:TDateTime read Get_ownedFrom write Set_ownedFrom;
end;


(*TrackAction*)
TTrackAction=Class  (TFindAction,ITrackAction)
 (*No atribs*)
end;


(*TaxiReservation*)
TTaxiReservation=Class  (TReservation,ITaxiReservation)
private
  FpartySize:Integer;
  FpickupLocation:IPlace;
  FpickupTime:TDateTime;
protected
  function Get_partySize:Integer;virtual;
  procedure Set_partySize(v:Integer);virtual;
  function Get_pickupLocation:IPlace;virtual;
  procedure Set_pickupLocation(v:IPlace);virtual;
  function Get_pickupTime:TDateTime;virtual;
  procedure Set_pickupTime(v:TDateTime);virtual;
public
  property pickupLocation:IPlace read Get_pickupLocation write Set_pickupLocation;
published
  property partySize:Integer read Get_partySize write Set_partySize;
  property pickupTime:TDateTime read Get_pickupTime write Set_pickupTime;
end;


(*JoinAction*)
TJoinAction=Class  (TInteractAction,IJoinAction)
 (*No atribs*)
end;


(*HealthPlanCostSharingSpecification*)
THealthPlanCostSharingSpecification=Class  (TIntangible,IHealthPlanCostSharingSpecification)
private
  FhealthPlanCopay:IPriceSpecification;
  FhealthPlanPharmacyCategory:String;
  FhealthPlanCoinsuranceOption:String;
  FhealthPlanCoinsuranceRate:INumber;
  FhealthPlanCopayOption:String;
protected
  function Get_healthPlanCopay:IPriceSpecification;virtual;
  procedure Set_healthPlanCopay(v:IPriceSpecification);virtual;
  function Get_healthPlanPharmacyCategory:String;virtual;
  procedure Set_healthPlanPharmacyCategory(v:String);virtual;
  function Get_healthPlanCoinsuranceOption:String;virtual;
  procedure Set_healthPlanCoinsuranceOption(v:String);virtual;
  function Get_healthPlanCoinsuranceRate:INumber;virtual;
  procedure Set_healthPlanCoinsuranceRate(v:INumber);virtual;
  function Get_healthPlanCopayOption:String;virtual;
  procedure Set_healthPlanCopayOption(v:String);virtual;
public
  property healthPlanCopay:IPriceSpecification read Get_healthPlanCopay write Set_healthPlanCopay;
  property healthPlanCoinsuranceRate:INumber read Get_healthPlanCoinsuranceRate write Set_healthPlanCoinsuranceRate;
published
  property healthPlanPharmacyCategory:String read Get_healthPlanPharmacyCategory write Set_healthPlanPharmacyCategory;
  property healthPlanCoinsuranceOption:String read Get_healthPlanCoinsuranceOption write Set_healthPlanCoinsuranceOption;
  property healthPlanCopayOption:String read Get_healthPlanCopayOption write Set_healthPlanCopayOption;
end;


(*PerformAction*)
TPerformAction=Class  (TPlayAction,IPerformAction)
private
  FentertainmentBusiness:IEntertainmentBusiness;
protected
  function Get_entertainmentBusiness:IEntertainmentBusiness;virtual;
  procedure Set_entertainmentBusiness(v:IEntertainmentBusiness);virtual;
public
  property entertainmentBusiness:IEntertainmentBusiness read Get_entertainmentBusiness write Set_entertainmentBusiness;
published
end;


(*ClaimReview*)
TClaimReview=Class  (TReview,IClaimReview)
private
  FclaimReviewed:String;
protected
  function Get_claimReviewed:String;virtual;
  procedure Set_claimReviewed(v:String);virtual;
public
published
  property claimReviewed:String read Get_claimReviewed write Set_claimReviewed;
end;


(*CarUsageType*)
TCarUsageType=Class  (TQualitativeValue,ICarUsageType)
  function TangCarUsageType:TangibleValue;virtual;
end;

TTVSeries=Class; //forward


(*TVEpisode*)
TTVEpisode=Class  (TEpisode,ITVEpisode)
private
  FpartOfTVSeries:ITVSeries;
protected
  function Get_partOfTVSeries:ITVSeries;virtual;
  procedure Set_partOfTVSeries(v:ITVSeries);virtual;
public
  property partOfTVSeries:ITVSeries read Get_partOfTVSeries write Set_partOfTVSeries;
published
end;


(*TVSeries*)
TTVSeries=Class  (TCreativeWorkSeries,ITVSeries)
private
  Fseasons:ICreativeWorkSeason;
  Ftrailer:IVideoObject;
  FproductionCompany:IOrganization;
  FcontainsSeason:ICreativeWorkSeason;
protected
  function Get_seasons:ICreativeWorkSeason;virtual;
  procedure Set_seasons(v:ICreativeWorkSeason);virtual;
  function Get_trailer:IVideoObject;virtual;
  procedure Set_trailer(v:IVideoObject);virtual;
  function Get_productionCompany:IOrganization;virtual;
  procedure Set_productionCompany(v:IOrganization);virtual;
  function Get_containsSeason:ICreativeWorkSeason;virtual;
  procedure Set_containsSeason(v:ICreativeWorkSeason);virtual;
public
  property seasons:ICreativeWorkSeason read Get_seasons write Set_seasons;
  property trailer:IVideoObject read Get_trailer write Set_trailer;
  property productionCompany:IOrganization read Get_productionCompany write Set_productionCompany;
  property containsSeason:ICreativeWorkSeason read Get_containsSeason write Set_containsSeason;
published
end;


(*Thesis*)
TThesis=Class  (TCreativeWork,IThesis)
private
  FinSupportOf:String;
protected
  function Get_inSupportOf:String;virtual;
  procedure Set_inSupportOf(v:String);virtual;
public
published
  property inSupportOf:String read Get_inSupportOf write Set_inSupportOf;
end;


(*GovernmentService*)
TGovernmentService=Class  (TService,IGovernmentService)
private
  FserviceOperator:IOrganization;
protected
  function Get_serviceOperator:IOrganization;virtual;
  procedure Set_serviceOperator(v:IOrganization);virtual;
public
  property serviceOperator:IOrganization read Get_serviceOperator write Set_serviceOperator;
published
end;


(*BedDetails*)
TBedDetails=Class  (TIntangible,IBedDetails)
private
  FtypeOfBed:String;
  FnumberOfBeds:INumber;
protected
  function Get_typeOfBed:String;virtual;
  procedure Set_typeOfBed(v:String);virtual;
  function Get_numberOfBeds:INumber;virtual;
  procedure Set_numberOfBeds(v:INumber);virtual;
public
  property numberOfBeds:INumber read Get_numberOfBeds write Set_numberOfBeds;
published
  property typeOfBed:String read Get_typeOfBed write Set_typeOfBed;
end;


(*DeliveryChargeSpecification*)
TDeliveryChargeSpecification=Class  (TPriceSpecification,IDeliveryChargeSpecification)
private
  FeligibleRegion:IGeoShape;
protected
  function Get_eligibleRegion:IGeoShape;virtual;
  procedure Set_eligibleRegion(v:IGeoShape);virtual;
public
  property eligibleRegion:IGeoShape read Get_eligibleRegion write Set_eligibleRegion;
published
end;


(*MedicalAudience*)
TMedicalAudience=Class  (TAudience,IMedicalAudience)
  function TangMedicalAudience:TangibleValue;virtual;
end;


(*MedicalRiskScore*)
TMedicalRiskScore=Class  (TMedicalRiskEstimator,IMedicalRiskScore)
private
  Falgorithm:String;
protected
  function Get_algorithm:String;virtual;
  procedure Set_algorithm(v:String);virtual;
public
published
  property algorithm:String read Get_algorithm write Set_algorithm;
end;


(*PeopleAudience*)
TPeopleAudience=Class  (TAudience,IPeopleAudience)
private
  FrequiredMinAge:Integer;
  FrequiredMaxAge:Integer;
  FrequiredGender:String;
  FsuggestedGender:String;
  FsuggestedMinAge:INumber;
  FsuggestedMaxAge:INumber;
protected
  function Get_requiredMinAge:Integer;virtual;
  procedure Set_requiredMinAge(v:Integer);virtual;
  function Get_requiredMaxAge:Integer;virtual;
  procedure Set_requiredMaxAge(v:Integer);virtual;
  function Get_requiredGender:String;virtual;
  procedure Set_requiredGender(v:String);virtual;
  function Get_suggestedGender:String;virtual;
  procedure Set_suggestedGender(v:String);virtual;
  function Get_suggestedMinAge:INumber;virtual;
  procedure Set_suggestedMinAge(v:INumber);virtual;
  function Get_suggestedMaxAge:INumber;virtual;
  procedure Set_suggestedMaxAge(v:INumber);virtual;
public
  property suggestedMinAge:INumber read Get_suggestedMinAge write Set_suggestedMinAge;
  property suggestedMaxAge:INumber read Get_suggestedMaxAge write Set_suggestedMaxAge;
published
  property requiredMinAge:Integer read Get_requiredMinAge write Set_requiredMinAge;
  property requiredMaxAge:Integer read Get_requiredMaxAge write Set_requiredMaxAge;
  property requiredGender:String read Get_requiredGender write Set_requiredGender;
  property suggestedGender:String read Get_suggestedGender write Set_suggestedGender;
end;


(*ParentAudience*)
TParentAudience=Class  (TPeopleAudience,IParentAudience)
private
  FchildMaxAge:INumber;
  FchildMinAge:INumber;
protected
  function Get_childMaxAge:INumber;virtual;
  procedure Set_childMaxAge(v:INumber);virtual;
  function Get_childMinAge:INumber;virtual;
  procedure Set_childMinAge(v:INumber);virtual;
public
  property childMaxAge:INumber read Get_childMaxAge write Set_childMaxAge;
  property childMinAge:INumber read Get_childMinAge write Set_childMinAge;
published
end;


(*BorrowAction*)
TBorrowAction=Class  (TTransferAction,IBorrowAction)
private
  Flender:IPerson;
protected
  function Get_lender:IPerson;virtual;
  procedure Set_lender(v:IPerson);virtual;
public
  property lender:IPerson read Get_lender write Set_lender;
published
end;

TRecommendedDoseSchedule=Class; //forward


(*DietarySupplement*)
TDietarySupplement=Class  (TSubstance,IDietarySupplement)
private
  FnonProprietaryName:String;
  Fbackground:String;
  FisProprietary:Boolean;
  FrecommendedIntake:IRecommendedDoseSchedule;
  FmechanismOfAction:String;
  FtargetPopulation:String;
  FsafetyConsideration:String;
  Fmanufacturer:IOrganization;
protected
  function Get_nonProprietaryName:String;virtual;
  procedure Set_nonProprietaryName(v:String);virtual;
  function Get_background:String;virtual;
  procedure Set_background(v:String);virtual;
  function Get_isProprietary:Boolean;virtual;
  procedure Set_isProprietary(v:Boolean);virtual;
  function Get_recommendedIntake:IRecommendedDoseSchedule;virtual;
  procedure Set_recommendedIntake(v:IRecommendedDoseSchedule);virtual;
  function Get_mechanismOfAction:String;virtual;
  procedure Set_mechanismOfAction(v:String);virtual;
  function Get_targetPopulation:String;virtual;
  procedure Set_targetPopulation(v:String);virtual;
  function Get_safetyConsideration:String;virtual;
  procedure Set_safetyConsideration(v:String);virtual;
  function Get_manufacturer:IOrganization;virtual;
  procedure Set_manufacturer(v:IOrganization);virtual;
public
  property recommendedIntake:IRecommendedDoseSchedule read Get_recommendedIntake write Set_recommendedIntake;
  property manufacturer:IOrganization read Get_manufacturer write Set_manufacturer;
published
  property nonProprietaryName:String read Get_nonProprietaryName write Set_nonProprietaryName;
  property background:String read Get_background write Set_background;
  property isProprietary:Boolean read Get_isProprietary write Set_isProprietary;
  property mechanismOfAction:String read Get_mechanismOfAction write Set_mechanismOfAction;
  property targetPopulation:String read Get_targetPopulation write Set_targetPopulation;
  property safetyConsideration:String read Get_safetyConsideration write Set_safetyConsideration;
end;


(*RecommendedDoseSchedule*)
TRecommendedDoseSchedule=Class  (TDoseSchedule,IRecommendedDoseSchedule)
 (*No atribs*)
end;


(*BuyAction*)
TBuyAction=Class  (TTradeAction,IBuyAction)
private
  FwarrantyPromise:IWarrantyPromise;
  Fvendor:IOrganization;
protected
  function Get_warrantyPromise:IWarrantyPromise;virtual;
  procedure Set_warrantyPromise(v:IWarrantyPromise);virtual;
  function Get_vendor:IOrganization;virtual;
  procedure Set_vendor(v:IOrganization);virtual;
public
  property warrantyPromise:IWarrantyPromise read Get_warrantyPromise write Set_warrantyPromise;
  property vendor:IOrganization read Get_vendor write Set_vendor;
published
end;

TRealEstateAgent=Class; //forward


(*RentAction*)
TRentAction=Class  (TTradeAction,IRentAction)
private
  FrealEstateAgent:IRealEstateAgent;
  Flandlord:IPerson;
protected
  function Get_realEstateAgent:IRealEstateAgent;virtual;
  procedure Set_realEstateAgent(v:IRealEstateAgent);virtual;
  function Get_landlord:IPerson;virtual;
  procedure Set_landlord(v:IPerson);virtual;
public
  property realEstateAgent:IRealEstateAgent read Get_realEstateAgent write Set_realEstateAgent;
  property landlord:IPerson read Get_landlord write Set_landlord;
published
end;


(*RealEstateAgent*)
TRealEstateAgent=Class  (TLocalBusiness,IRealEstateAgent)
 (*No atribs*)
end;


(*MedicalDevicePurpose*)
TMedicalDevicePurpose=Class  (TMedicalEnumeration,IMedicalDevicePurpose)
  function TangMedicalDevicePurpose:TangibleValue;virtual;
end;


(*Report*)
TReport=Class  (TArticle,IReport)
private
  FreportNumber:String;
protected
  function Get_reportNumber:String;virtual;
  procedure Set_reportNumber(v:String);virtual;
public
published
  property reportNumber:String read Get_reportNumber write Set_reportNumber;
end;


(*TechArticle*)
TTechArticle=Class  (TArticle,ITechArticle)
private
  Fdependencies:String;
  FproficiencyLevel:String;
protected
  function Get_dependencies:String;virtual;
  procedure Set_dependencies(v:String);virtual;
  function Get_proficiencyLevel:String;virtual;
  procedure Set_proficiencyLevel(v:String);virtual;
public
published
  property dependencies:String read Get_dependencies write Set_dependencies;
  property proficiencyLevel:String read Get_proficiencyLevel write Set_proficiencyLevel;
end;


(*Integer*)
TInteger=Class  (TNumber,IInteger)
 (*No atribs*)
end;


(*MedicalGuidelineRecommendation*)
TMedicalGuidelineRecommendation=Class  (TMedicalGuideline,IMedicalGuidelineRecommendation)
private
  FrecommendationStrength:String;
protected
  function Get_recommendationStrength:String;virtual;
  procedure Set_recommendationStrength(v:String);virtual;
public
published
  property recommendationStrength:String read Get_recommendationStrength write Set_recommendationStrength;
end;


(*FollowAction*)
TFollowAction=Class  (TInteractAction,IFollowAction)
private
  Ffollowee:IOrganization;
protected
  function Get_followee:IOrganization;virtual;
  procedure Set_followee(v:IOrganization);virtual;
public
  property followee:IOrganization read Get_followee write Set_followee;
published
end;


(*TipAction*)
TTipAction=Class  (TTradeAction,ITipAction)
 (*No atribs*)
end;


(*BusinessAudience*)
TBusinessAudience=Class  (TAudience,IBusinessAudience)
private
  FyearsInOperation:IQuantitativeValue;
  FyearlyRevenue:IQuantitativeValue;
  FnumberOfEmployees:IQuantitativeValue;
protected
  function Get_yearsInOperation:IQuantitativeValue;virtual;
  procedure Set_yearsInOperation(v:IQuantitativeValue);virtual;
  function Get_yearlyRevenue:IQuantitativeValue;virtual;
  procedure Set_yearlyRevenue(v:IQuantitativeValue);virtual;
  function Get_numberOfEmployees:IQuantitativeValue;virtual;
  procedure Set_numberOfEmployees(v:IQuantitativeValue);virtual;
public
  property yearsInOperation:IQuantitativeValue read Get_yearsInOperation write Set_yearsInOperation;
  property yearlyRevenue:IQuantitativeValue read Get_yearlyRevenue write Set_yearlyRevenue;
  property numberOfEmployees:IQuantitativeValue read Get_numberOfEmployees write Set_numberOfEmployees;
published
end;

TListItem=Class; //forward


(*ListItem*)
TListItem=Class  (TIntangible,IListItem)
private
  Fitem:IThing;
  FpreviousItem:IListItem;
  FnextItem:IListItem;
protected
  function Get_item:IThing;virtual;
  procedure Set_item(v:IThing);virtual;
  function Get_previousItem:IListItem;virtual;
  procedure Set_previousItem(v:IListItem);virtual;
  function Get_nextItem:IListItem;virtual;
  procedure Set_nextItem(v:IListItem);virtual;
public
  property item:IThing read Get_item write Set_item;
  property previousItem:IListItem read Get_previousItem write Set_previousItem;
  property nextItem:IListItem read Get_nextItem write Set_nextItem;
published
end;


(*PhysicalActivity*)
TPhysicalActivity=Class  (TLifestyleModification,IPhysicalActivity)
private
  Fepidemiology:String;
protected
  function Get_epidemiology:String;virtual;
  procedure Set_epidemiology(v:String);virtual;
public
published
  property epidemiology:String read Get_epidemiology write Set_epidemiology;
end;


(*APIReference*)
TAPIReference=Class  (TTechArticle,IAPIReference)
private
  FassemblyVersion:String;
  FprogrammingModel:String;
  FtargetPlatform:String;
  Fassembly:String;
protected
  function Get_assemblyVersion:String;virtual;
  procedure Set_assemblyVersion(v:String);virtual;
  function Get_programmingModel:String;virtual;
  procedure Set_programmingModel(v:String);virtual;
  function Get_targetPlatform:String;virtual;
  procedure Set_targetPlatform(v:String);virtual;
  function Get_assembly:String;virtual;
  procedure Set_assembly(v:String);virtual;
public
published
  property assemblyVersion:String read Get_assemblyVersion write Set_assemblyVersion;
  property programmingModel:String read Get_programmingModel write Set_programmingModel;
  property targetPlatform:String read Get_targetPlatform write Set_targetPlatform;
  property assembly:String read Get_assembly write Set_assembly;
end;


(*Car*)
TCar=Class  (TVehicle,ICar)
private
  FroofLoad:IQuantitativeValue;
protected
  function Get_roofLoad:IQuantitativeValue;virtual;
  procedure Set_roofLoad(v:IQuantitativeValue);virtual;
public
  property roofLoad:IQuantitativeValue read Get_roofLoad write Set_roofLoad;
published
end;


(*RentalCarReservation*)
TRentalCarReservation=Class  (TReservation,IRentalCarReservation)
private
  FdropoffLocation:IPlace;
  FdropoffTime:TDateTime;
protected
  function Get_dropoffLocation:IPlace;virtual;
  procedure Set_dropoffLocation(v:IPlace);virtual;
  function Get_dropoffTime:TDateTime;virtual;
  procedure Set_dropoffTime(v:TDateTime);virtual;
public
  property dropoffLocation:IPlace read Get_dropoffLocation write Set_dropoffLocation;
published
  property dropoffTime:TDateTime read Get_dropoffTime write Set_dropoffTime;
end;


(*WebApplication*)
TWebApplication=Class  (TSoftwareApplication,IWebApplication)
private
  FbrowserRequirements:String;
protected
  function Get_browserRequirements:String;virtual;
  procedure Set_browserRequirements(v:String);virtual;
public
published
  property browserRequirements:String read Get_browserRequirements write Set_browserRequirements;
end;


(*GamePlayMode*)
TGamePlayMode=Class  (TEnumeration,IGamePlayMode)
  function TangGamePlayMode:TangibleValue;virtual;
end;


(*AggregateOffer*)
TAggregateOffer=Class  (TOffer,IAggregateOffer)
private
  FhighPrice:INumber;
  FofferCount:Integer;
  FlowPrice:INumber;
protected
  function Get_highPrice:INumber;virtual;
  procedure Set_highPrice(v:INumber);virtual;
  function Get_offerCount:Integer;virtual;
  procedure Set_offerCount(v:Integer);virtual;
  function Get_lowPrice:INumber;virtual;
  procedure Set_lowPrice(v:INumber);virtual;
public
  property highPrice:INumber read Get_highPrice write Set_highPrice;
  property lowPrice:INumber read Get_lowPrice write Set_lowPrice;
published
  property offerCount:Integer read Get_offerCount write Set_offerCount;
end;


(*Brand*)
TBrand=Class  (TIntangible,IBrand)
  function TangBrand:TangibleValue;virtual;
end;


(*PropertyValueSpecification*)
TPropertyValueSpecification=Class  (TIntangible,IPropertyValueSpecification)
private
  FmultipleValues:Boolean;
  FreadonlyValue:Boolean;
  FvalueMaxLength:INumber;
  FvalueMinLength:INumber;
  FdefaultValue:String;
  FvaluePattern:String;
  FvalueRequired:Boolean;
  FvalueName:String;
  FstepValue:INumber;
protected
  function Get_multipleValues:Boolean;virtual;
  procedure Set_multipleValues(v:Boolean);virtual;
  function Get_readonlyValue:Boolean;virtual;
  procedure Set_readonlyValue(v:Boolean);virtual;
  function Get_valueMaxLength:INumber;virtual;
  procedure Set_valueMaxLength(v:INumber);virtual;
  function Get_valueMinLength:INumber;virtual;
  procedure Set_valueMinLength(v:INumber);virtual;
  function Get_defaultValue:String;virtual;
  procedure Set_defaultValue(v:String);virtual;
  function Get_valuePattern:String;virtual;
  procedure Set_valuePattern(v:String);virtual;
  function Get_valueRequired:Boolean;virtual;
  procedure Set_valueRequired(v:Boolean);virtual;
  function Get_valueName:String;virtual;
  procedure Set_valueName(v:String);virtual;
  function Get_stepValue:INumber;virtual;
  procedure Set_stepValue(v:INumber);virtual;
public
  property valueMaxLength:INumber read Get_valueMaxLength write Set_valueMaxLength;
  property valueMinLength:INumber read Get_valueMinLength write Set_valueMinLength;
  property stepValue:INumber read Get_stepValue write Set_stepValue;
published
  property multipleValues:Boolean read Get_multipleValues write Set_multipleValues;
  property readonlyValue:Boolean read Get_readonlyValue write Set_readonlyValue;
  property defaultValue:String read Get_defaultValue write Set_defaultValue;
  property valuePattern:String read Get_valuePattern write Set_valuePattern;
  property valueRequired:Boolean read Get_valueRequired write Set_valueRequired;
  property valueName:String read Get_valueName write Set_valueName;
end;


(*MobileApplication*)
TMobileApplication=Class  (TSoftwareApplication,IMobileApplication)
private
  FcarrierRequirements:String;
protected
  function Get_carrierRequirements:String;virtual;
  procedure Set_carrierRequirements(v:String);virtual;
public
published
  property carrierRequirements:String read Get_carrierRequirements write Set_carrierRequirements;
end;


(*ReceiveAction*)
TReceiveAction=Class  (TTransferAction,IReceiveAction)
private
  Fsender:IOrganization;
protected
  function Get_sender:IOrganization;virtual;
  procedure Set_sender(v:IOrganization);virtual;
public
  property sender:IOrganization read Get_sender write Set_sender;
published
end;

TMedicalTrialDesign=Class; //forward


(*MedicalTrial*)
TMedicalTrial=Class  (TMedicalStudy,IMedicalTrial)
private
  FtrialDesign:IMedicalTrialDesign;
  Fphase:String;
protected
  function Get_trialDesign:IMedicalTrialDesign;virtual;
  procedure Set_trialDesign(v:IMedicalTrialDesign);virtual;
  function Get_phase:String;virtual;
  procedure Set_phase(v:String);virtual;
public
  property trialDesign:IMedicalTrialDesign read Get_trialDesign write Set_trialDesign;
published
  property phase:String read Get_phase write Set_phase;
end;


(*MedicalTrialDesign*)
TMedicalTrialDesign=Class  (TEnumeration,IMedicalTrialDesign)
  function TangMedicalTrialDesign:TangibleValue;virtual;
end;

TMass=Class; //forward


(*NutritionInformation*)
TNutritionInformation=Class  (TStructuredValue,INutritionInformation)
private
  FproteinContent:IMass;
  FfatContent:IMass;
  FtransFatContent:IMass;
  Fcalories:IEnergy;
  FcarbohydrateContent:IMass;
  FsodiumContent:IMass;
  FcholesterolContent:IMass;
  FservingSize:String;
  FfiberContent:IMass;
  FsaturatedFatContent:IMass;
  FsugarContent:IMass;
  FunsaturatedFatContent:IMass;
protected
  function Get_proteinContent:IMass;virtual;
  procedure Set_proteinContent(v:IMass);virtual;
  function Get_fatContent:IMass;virtual;
  procedure Set_fatContent(v:IMass);virtual;
  function Get_transFatContent:IMass;virtual;
  procedure Set_transFatContent(v:IMass);virtual;
  function Get_calories:IEnergy;virtual;
  procedure Set_calories(v:IEnergy);virtual;
  function Get_carbohydrateContent:IMass;virtual;
  procedure Set_carbohydrateContent(v:IMass);virtual;
  function Get_sodiumContent:IMass;virtual;
  procedure Set_sodiumContent(v:IMass);virtual;
  function Get_cholesterolContent:IMass;virtual;
  procedure Set_cholesterolContent(v:IMass);virtual;
  function Get_servingSize:String;virtual;
  procedure Set_servingSize(v:String);virtual;
  function Get_fiberContent:IMass;virtual;
  procedure Set_fiberContent(v:IMass);virtual;
  function Get_saturatedFatContent:IMass;virtual;
  procedure Set_saturatedFatContent(v:IMass);virtual;
  function Get_sugarContent:IMass;virtual;
  procedure Set_sugarContent(v:IMass);virtual;
  function Get_unsaturatedFatContent:IMass;virtual;
  procedure Set_unsaturatedFatContent(v:IMass);virtual;
public
  property proteinContent:IMass read Get_proteinContent write Set_proteinContent;
  property fatContent:IMass read Get_fatContent write Set_fatContent;
  property transFatContent:IMass read Get_transFatContent write Set_transFatContent;
  property calories:IEnergy read Get_calories write Set_calories;
  property carbohydrateContent:IMass read Get_carbohydrateContent write Set_carbohydrateContent;
  property sodiumContent:IMass read Get_sodiumContent write Set_sodiumContent;
  property cholesterolContent:IMass read Get_cholesterolContent write Set_cholesterolContent;
  property fiberContent:IMass read Get_fiberContent write Set_fiberContent;
  property saturatedFatContent:IMass read Get_saturatedFatContent write Set_saturatedFatContent;
  property sugarContent:IMass read Get_sugarContent write Set_sugarContent;
  property unsaturatedFatContent:IMass read Get_unsaturatedFatContent write Set_unsaturatedFatContent;
published
  property servingSize:String read Get_servingSize write Set_servingSize;
end;


(*Mass*)
TMass=Class  (TQuantity,IMass)
  function TangMass:TangibleValue;virtual;
end;


(*PerformanceRole*)
TPerformanceRole=Class  (TRole,IPerformanceRole)
private
  FcharacterName:String;
protected
  function Get_characterName:String;virtual;
  procedure Set_characterName(v:String);virtual;
public
published
  property characterName:String read Get_characterName write Set_characterName;
end;


(*LymphaticVessel*)
TLymphaticVessel=Class  (TVessel,ILymphaticVessel)
private
  ForiginatesFrom:IVessel;
  FrunsTo:IVessel;
protected
  function Get_originatesFrom:IVessel;virtual;
  procedure Set_originatesFrom(v:IVessel);virtual;
  function Get_runsTo:IVessel;virtual;
  procedure Set_runsTo(v:IVessel);virtual;
public
  property originatesFrom:IVessel read Get_originatesFrom write Set_originatesFrom;
  property runsTo:IVessel read Get_runsTo write Set_runsTo;
published
end;


(*Apartment*)
TApartment=Class  (TAccommodation,IApartment)
 (*No atribs*)
end;


(*Patient*)
TPatient=Class  (TMedicalAudience,IPatient)
  function TangPatient:TangibleValue;virtual;
end;


(*EnumerationValue*)
TEnumerationValue=Class  (TEnumeration,IEnumerationValue)
private
  FpartOfEnumerationValueSet:String;
  FenumerationValueCode:String;
protected
  function Get_partOfEnumerationValueSet:String;virtual;
  procedure Set_partOfEnumerationValueSet(v:String);virtual;
  function Get_enumerationValueCode:String;virtual;
  procedure Set_enumerationValueCode(v:String);virtual;
public
published
  property partOfEnumerationValueSet:String read Get_partOfEnumerationValueSet write Set_partOfEnumerationValueSet;
  property enumerationValueCode:String read Get_enumerationValueCode write Set_enumerationValueCode;
end;

TGeoCoordinates=Class; //forward


(*GeoCircle*)
TGeoCircle=Class  (TGeoShape,IGeoCircle)
private
  FgeoRadius:IDistance;
  FgeoMidpoint:IGeoCoordinates;
protected
  function Get_geoRadius:IDistance;virtual;
  procedure Set_geoRadius(v:IDistance);virtual;
  function Get_geoMidpoint:IGeoCoordinates;virtual;
  procedure Set_geoMidpoint(v:IGeoCoordinates);virtual;
public
  property geoRadius:IDistance read Get_geoRadius write Set_geoRadius;
  property geoMidpoint:IGeoCoordinates read Get_geoMidpoint write Set_geoMidpoint;
published
end;


(*GeoCoordinates*)
TGeoCoordinates=Class  (TStructuredValue,IGeoCoordinates)
private
  Flatitude:INumber;
  Flongitude:INumber;
  FpostalCode:String;
protected
  function Get_latitude:INumber;virtual;
  procedure Set_latitude(v:INumber);virtual;
  function Get_longitude:INumber;virtual;
  procedure Set_longitude(v:INumber);virtual;
  function Get_postalCode:String;virtual;
  procedure Set_postalCode(v:String);virtual;
public
  property latitude:INumber read Get_latitude write Set_latitude;
  property longitude:INumber read Get_longitude write Set_longitude;
published
  property postalCode:String read Get_postalCode write Set_postalCode;
end;


(*EducationalAudience*)
TEducationalAudience=Class  (TAudience,IEducationalAudience)
private
  FeducationalRole:String;
protected
  function Get_educationalRole:String;virtual;
  procedure Set_educationalRole(v:String);virtual;
public
published
  property educationalRole:String read Get_educationalRole write Set_educationalRole;
end;


(*RadioSeries*)
TRadioSeries=Class  (TCreativeWorkSeries,IRadioSeries)
 (*No atribs*)
end;


(*ChooseAction*)
TChooseAction=Class  (TAssessAction,IChooseAction)
private
  Foption:IThing;
protected
  function Get_option:IThing;virtual;
  procedure Set_option(v:IThing);virtual;
public
  property option:IThing read Get_option write Set_option;
published
end;


(*VoteAction*)
TVoteAction=Class  (TChooseAction,IVoteAction)
private
  Fcandidate:IPerson;
protected
  function Get_candidate:IPerson;virtual;
  procedure Set_candidate(v:IPerson);virtual;
public
  property candidate:IPerson read Get_candidate write Set_candidate;
published
end;


(*LinkRole*)
TLinkRole=Class  (TRole,ILinkRole)
private
  FlinkRelationship:String;
protected
  function Get_linkRelationship:String;virtual;
  procedure Set_linkRelationship(v:String);virtual;
public
published
  property linkRelationship:String read Get_linkRelationship write Set_linkRelationship;
end;


(*LoanOrCredit*)
TLoanOrCredit=Class  (TFinancialProduct,ILoanOrCredit)
private
  FloanTerm:IQuantitativeValue;
  FrequiredCollateral:String;
  Famount:IMonetaryAmount;
protected
  function Get_loanTerm:IQuantitativeValue;virtual;
  procedure Set_loanTerm(v:IQuantitativeValue);virtual;
  function Get_requiredCollateral:String;virtual;
  procedure Set_requiredCollateral(v:String);virtual;
  function Get_amount:IMonetaryAmount;virtual;
  procedure Set_amount(v:IMonetaryAmount);virtual;
public
  property loanTerm:IQuantitativeValue read Get_loanTerm write Set_loanTerm;
  property amount:IMonetaryAmount read Get_amount write Set_amount;
published
  property requiredCollateral:String read Get_requiredCollateral write Set_requiredCollateral;
end;


(*MedicalImagingTechnique*)
TMedicalImagingTechnique=Class  (TMedicalEnumeration,IMedicalImagingTechnique)
  function TangMedicalImagingTechnique:TangibleValue;virtual;
end;


(*WebSite*)
TWebSite=Class  (TCreativeWork,IWebSite)
 (*No atribs*)
end;


(*BusOrCoach*)
TBusOrCoach=Class  (TVehicle,IBusOrCoach)
private
  FacrissCode:String;
protected
  function Get_acrissCode:String;virtual;
  procedure Set_acrissCode(v:String);virtual;
public
published
  property acrissCode:String read Get_acrissCode write Set_acrissCode;
end;


(*BroadcastFrequencySpecification*)
TBroadcastFrequencySpecification=Class  (TIntangible,IBroadcastFrequencySpecification)
private
  FbroadcastFrequencyValue:IQuantitativeValue;
protected
  function Get_broadcastFrequencyValue:IQuantitativeValue;virtual;
  procedure Set_broadcastFrequencyValue(v:IQuantitativeValue);virtual;
public
  property broadcastFrequencyValue:IQuantitativeValue read Get_broadcastFrequencyValue write Set_broadcastFrequencyValue;
published
end;


(*ReturnAction*)
TReturnAction=Class  (TTransferAction,IReturnAction)
 (*No atribs*)
end;


(*ImagingTest*)
TImagingTest=Class  (TMedicalTest,IImagingTest)
private
  FimagingTechnique:IMedicalImagingTechnique;
protected
  function Get_imagingTechnique:IMedicalImagingTechnique;virtual;
  procedure Set_imagingTechnique(v:IMedicalImagingTechnique);virtual;
public
  property imagingTechnique:IMedicalImagingTechnique read Get_imagingTechnique write Set_imagingTechnique;
published
end;


(*LeaveAction*)
TLeaveAction=Class  (TInteractAction,ILeaveAction)
 (*No atribs*)
end;


(*InfectiousDisease*)
TInfectiousDisease=Class  (TMedicalCondition,IInfectiousDisease)
private
  FinfectiousAgentClass:IInfectiousAgentClass;
  FtransmissionMethod:String;
  FinfectiousAgent:String;
protected
  function Get_infectiousAgentClass:IInfectiousAgentClass;virtual;
  procedure Set_infectiousAgentClass(v:IInfectiousAgentClass);virtual;
  function Get_transmissionMethod:String;virtual;
  procedure Set_transmissionMethod(v:String);virtual;
  function Get_infectiousAgent:String;virtual;
  procedure Set_infectiousAgent(v:String);virtual;
public
  property infectiousAgentClass:IInfectiousAgentClass read Get_infectiousAgentClass write Set_infectiousAgentClass;
published
  property transmissionMethod:String read Get_transmissionMethod write Set_transmissionMethod;
  property infectiousAgent:String read Get_infectiousAgent write Set_infectiousAgent;
end;


(*BusStop*)
TBusStop=Class  (TCivicStructure,IBusStop)
 (*No atribs*)
end;


(*MusicRelease*)
TMusicRelease=Class  (TMusicPlaylist,IMusicRelease)
private
  FcreditedTo:IOrganization;
  FmusicReleaseFormat:IMusicReleaseFormatType;
  FrecordLabel:IOrganization;
  FcatalogNumber:String;
  FreleaseOf:IMusicAlbum;
protected
  function Get_creditedTo:IOrganization;virtual;
  procedure Set_creditedTo(v:IOrganization);virtual;
  function Get_musicReleaseFormat:IMusicReleaseFormatType;virtual;
  procedure Set_musicReleaseFormat(v:IMusicReleaseFormatType);virtual;
  function Get_recordLabel:IOrganization;virtual;
  procedure Set_recordLabel(v:IOrganization);virtual;
  function Get_catalogNumber:String;virtual;
  procedure Set_catalogNumber(v:String);virtual;
  function Get_releaseOf:IMusicAlbum;virtual;
  procedure Set_releaseOf(v:IMusicAlbum);virtual;
public
  property creditedTo:IOrganization read Get_creditedTo write Set_creditedTo;
  property musicReleaseFormat:IMusicReleaseFormatType read Get_musicReleaseFormat write Set_musicReleaseFormat;
  property recordLabel:IOrganization read Get_recordLabel write Set_recordLabel;
  property releaseOf:IMusicAlbum read Get_releaseOf write Set_releaseOf;
published
  property catalogNumber:String read Get_catalogNumber write Set_catalogNumber;
end;


(*FoodEstablishmentReservation*)
TFoodEstablishmentReservation=Class  (TReservation,IFoodEstablishmentReservation)
private
  FstartTime:TDateTime;
  FendTime:TDateTime;
protected
  function Get_startTime:TDateTime;virtual;
  procedure Set_startTime(v:TDateTime);virtual;
  function Get_endTime:TDateTime;virtual;
  procedure Set_endTime(v:TDateTime);virtual;
public
published
  property startTime:TDateTime read Get_startTime write Set_startTime;
  property endTime:TDateTime read Get_endTime write Set_endTime;
end;


(*HotelRoom*)
THotelRoom=Class  (TRoom,IHotelRoom)
private
  Fbed:IBedType;
  Foccupancy:IQuantitativeValue;
protected
  function Get_bed:IBedType;virtual;
  procedure Set_bed(v:IBedType);virtual;
  function Get_occupancy:IQuantitativeValue;virtual;
  procedure Set_occupancy(v:IQuantitativeValue);virtual;
public
  property bed:IBedType read Get_bed write Set_bed;
  property occupancy:IQuantitativeValue read Get_occupancy write Set_occupancy;
published
end;


(*MedicalClinic*)
TMedicalClinic=Class  (TMedicalBusiness,IMedicalClinic)
 (*No atribs*)
end;


(*InteractionCounter*)
TInteractionCounter=Class  (TStructuredValue,IInteractionCounter)
private
  FinteractionService:ISoftwareApplication;
  FinteractionType:IAction;
  FuserInteractionCount:Integer;
protected
  function Get_interactionService:ISoftwareApplication;virtual;
  procedure Set_interactionService(v:ISoftwareApplication);virtual;
  function Get_interactionType:IAction;virtual;
  procedure Set_interactionType(v:IAction);virtual;
  function Get_userInteractionCount:Integer;virtual;
  procedure Set_userInteractionCount(v:Integer);virtual;
public
  property interactionService:ISoftwareApplication read Get_interactionService write Set_interactionService;
  property interactionType:IAction read Get_interactionType write Set_interactionType;
published
  property userInteractionCount:Integer read Get_userInteractionCount write Set_userInteractionCount;
end;


(*Recipe*)
TRecipe=Class  (TCreativeWork,IRecipe)
private
  FrecipeInstructions:IItemList;
  FrecipeYield:String;
  FrecipeCuisine:String;
  Fnutrition:INutritionInformation;
  FsuitableForDiet:IRestrictedDiet;
  Fingredients:String;
  FcookingMethod:String;
  FrecipeCategory:String;
  FtotalTime:IDuration;
  FcookTime:IDuration;
  FprepTime:IDuration;
protected
  function Get_recipeInstructions:IItemList;virtual;
  procedure Set_recipeInstructions(v:IItemList);virtual;
  function Get_recipeYield:String;virtual;
  procedure Set_recipeYield(v:String);virtual;
  function Get_recipeCuisine:String;virtual;
  procedure Set_recipeCuisine(v:String);virtual;
  function Get_nutrition:INutritionInformation;virtual;
  procedure Set_nutrition(v:INutritionInformation);virtual;
  function Get_suitableForDiet:IRestrictedDiet;virtual;
  procedure Set_suitableForDiet(v:IRestrictedDiet);virtual;
  function Get_ingredients:String;virtual;
  procedure Set_ingredients(v:String);virtual;
  function Get_cookingMethod:String;virtual;
  procedure Set_cookingMethod(v:String);virtual;
  function Get_recipeCategory:String;virtual;
  procedure Set_recipeCategory(v:String);virtual;
  function Get_totalTime:IDuration;virtual;
  procedure Set_totalTime(v:IDuration);virtual;
  function Get_cookTime:IDuration;virtual;
  procedure Set_cookTime(v:IDuration);virtual;
  function Get_prepTime:IDuration;virtual;
  procedure Set_prepTime(v:IDuration);virtual;
public
  property recipeInstructions:IItemList read Get_recipeInstructions write Set_recipeInstructions;
  property nutrition:INutritionInformation read Get_nutrition write Set_nutrition;
  property suitableForDiet:IRestrictedDiet read Get_suitableForDiet write Set_suitableForDiet;
  property totalTime:IDuration read Get_totalTime write Set_totalTime;
  property cookTime:IDuration read Get_cookTime write Set_cookTime;
  property prepTime:IDuration read Get_prepTime write Set_prepTime;
published
  property recipeYield:String read Get_recipeYield write Set_recipeYield;
  property recipeCuisine:String read Get_recipeCuisine write Set_recipeCuisine;
  property ingredients:String read Get_ingredients write Set_ingredients;
  property cookingMethod:String read Get_cookingMethod write Set_cookingMethod;
  property recipeCategory:String read Get_recipeCategory write Set_recipeCategory;
end;


(*ReviewAction*)
TReviewAction=Class  (TAssessAction,IReviewAction)
private
  FresultReview:IReview;
protected
  function Get_resultReview:IReview;virtual;
  procedure Set_resultReview(v:IReview);virtual;
public
  property resultReview:IReview read Get_resultReview write Set_resultReview;
published
end;


(*WinAction*)
TWinAction=Class  (TAchieveAction,IWinAction)
private
  Floser:IPerson;
protected
  function Get_loser:IPerson;virtual;
  procedure Set_loser(v:IPerson);virtual;
public
  property loser:IPerson read Get_loser write Set_loser;
published
end;


(*ScholarlyArticle*)
TScholarlyArticle=Class  (TArticle,IScholarlyArticle)
 (*No atribs*)
end;


(*MedicalScholarlyArticle*)
TMedicalScholarlyArticle=Class  (TScholarlyArticle,IMedicalScholarlyArticle)
private
  FpublicationType:String;
protected
  function Get_publicationType:String;virtual;
  procedure Set_publicationType(v:String);virtual;
public
published
  property publicationType:String read Get_publicationType write Set_publicationType;
end;


(*Blog*)
TBlog=Class  (TCreativeWork,IBlog)
private
  FblogPosts:IBlogPosting;
protected
  function Get_blogPosts:IBlogPosting;virtual;
  procedure Set_blogPosts(v:IBlogPosting);virtual;
public
  property blogPosts:IBlogPosting read Get_blogPosts write Set_blogPosts;
published
end;


(*CookAction*)
TCookAction=Class  (TCreateAction,ICookAction)
private
  Frecipe:IRecipe;
  FfoodEstablishment:IFoodEstablishment;
  FfoodEvent:IFoodEvent;
protected
  function Get_recipe:IRecipe;virtual;
  procedure Set_recipe(v:IRecipe);virtual;
  function Get_foodEstablishment:IFoodEstablishment;virtual;
  procedure Set_foodEstablishment(v:IFoodEstablishment);virtual;
  function Get_foodEvent:IFoodEvent;virtual;
  procedure Set_foodEvent(v:IFoodEvent);virtual;
public
  property recipe:IRecipe read Get_recipe write Set_recipe;
  property foodEstablishment:IFoodEstablishment read Get_foodEstablishment write Set_foodEstablishment;
  property foodEvent:IFoodEvent read Get_foodEvent write Set_foodEvent;
published
end;


(*PathologyTest*)
TPathologyTest=Class  (TMedicalTest,IPathologyTest)
private
  FtissueSample:String;
protected
  function Get_tissueSample:String;virtual;
  procedure Set_tissueSample(v:String);virtual;
public
published
  property tissueSample:String read Get_tissueSample write Set_tissueSample;
end;


(*ReservationPackage*)
TReservationPackage=Class  (TReservation,IReservationPackage)
private
  FsubReservation:IReservation;
protected
  function Get_subReservation:IReservation;virtual;
  procedure Set_subReservation(v:IReservation);virtual;
public
  property subReservation:IReservation read Get_subReservation write Set_subReservation;
published
end;


(*UserComments*)
TUserComments=Class  (TUserInteraction,IUserComments)
private
  Fcreator:IPerson;
  Fdiscusses:ICreativeWork;
  FcommentText:String;
  FreplyToUrl:String;
  FcommentTime:TDateTime;
protected
  function Get_creator:IPerson;virtual;
  procedure Set_creator(v:IPerson);virtual;
  function Get_discusses:ICreativeWork;virtual;
  procedure Set_discusses(v:ICreativeWork);virtual;
  function Get_commentText:String;virtual;
  procedure Set_commentText(v:String);virtual;
  function Get_replyToUrl:String;virtual;
  procedure Set_replyToUrl(v:String);virtual;
  function Get_commentTime:TDateTime;virtual;
  procedure Set_commentTime(v:TDateTime);virtual;
public
  property creator:IPerson read Get_creator write Set_creator;
  property discusses:ICreativeWork read Get_discusses write Set_discusses;
published
  property commentText:String read Get_commentText write Set_commentText;
  property replyToUrl:String read Get_replyToUrl write Set_replyToUrl;
  property commentTime:TDateTime read Get_commentTime write Set_commentTime;
end;

TBusStation=Class; //forward


(*BusTrip*)
TBusTrip=Class  (TIntangible,IBusTrip)
private
  FarrivalBusStop:IBusStation;
  FbusName:String;
  FbusNumber:String;
  FdepartureBusStop:IBusStop;
protected
  function Get_arrivalBusStop:IBusStation;virtual;
  procedure Set_arrivalBusStop(v:IBusStation);virtual;
  function Get_busName:String;virtual;
  procedure Set_busName(v:String);virtual;
  function Get_busNumber:String;virtual;
  procedure Set_busNumber(v:String);virtual;
  function Get_departureBusStop:IBusStop;virtual;
  procedure Set_departureBusStop(v:IBusStop);virtual;
public
  property arrivalBusStop:IBusStation read Get_arrivalBusStop write Set_arrivalBusStop;
  property departureBusStop:IBusStop read Get_departureBusStop write Set_departureBusStop;
published
  property busName:String read Get_busName write Set_busName;
  property busNumber:String read Get_busNumber write Set_busNumber;
end;


(*BusStation*)
TBusStation=Class  (TCivicStructure,IBusStation)
 (*No atribs*)
end;


(*GenderType*)
TGenderType=Class  (TEnumeration,IGenderType)
  function TangGenderType:TangibleValue;virtual;
end;


(*DataType*)
TDataType=Class  (TBaseSchema,IDataType)
 (*No atribs*)
end;


(*AuthorizeAction*)
TAuthorizeAction=Class  (TAllocateAction,IAuthorizeAction)
 (*No atribs*)
end;


(*TVClip*)
TTVClip=Class  (TClip,ITVClip)
 (*No atribs*)
end;


(*AskAction*)
TAskAction=Class  (TCommunicateAction,IAskAction)
private
  Fquestion:IQuestion;
protected
  function Get_question:IQuestion;virtual;
  procedure Set_question(v:IQuestion);virtual;
public
  property question:IQuestion read Get_question write Set_question;
published
end;


(*PayAction*)
TPayAction=Class  (TTradeAction,IPayAction)
private
  Frecipient:IPerson;
protected
  function Get_recipient:IPerson;virtual;
  procedure Set_recipient(v:IPerson);virtual;
public
  property recipient:IPerson read Get_recipient write Set_recipient;
published
end;


(*VideoGameSeries*)
TVideoGameSeries=Class  (TCreativeWorkSeries,IVideoGameSeries)
private
  FnumberOfPlayers:IQuantitativeValue;
  FgameLocation:String;
  Factors:IPerson;
  Fquest:IThing;
  FnumberOfSeasons:Integer;
  FgamePlatform:String;
  FgameItem:IThing;
  FnumberOfEpisodes:Integer;
  FplayMode:IGamePlayMode;
protected
  function Get_numberOfPlayers:IQuantitativeValue;virtual;
  procedure Set_numberOfPlayers(v:IQuantitativeValue);virtual;
  function Get_gameLocation:String;virtual;
  procedure Set_gameLocation(v:String);virtual;
  function Get_actors:IPerson;virtual;
  procedure Set_actors(v:IPerson);virtual;
  function Get_quest:IThing;virtual;
  procedure Set_quest(v:IThing);virtual;
  function Get_numberOfSeasons:Integer;virtual;
  procedure Set_numberOfSeasons(v:Integer);virtual;
  function Get_gamePlatform:String;virtual;
  procedure Set_gamePlatform(v:String);virtual;
  function Get_gameItem:IThing;virtual;
  procedure Set_gameItem(v:IThing);virtual;
  function Get_numberOfEpisodes:Integer;virtual;
  procedure Set_numberOfEpisodes(v:Integer);virtual;
  function Get_playMode:IGamePlayMode;virtual;
  procedure Set_playMode(v:IGamePlayMode);virtual;
public
  property numberOfPlayers:IQuantitativeValue read Get_numberOfPlayers write Set_numberOfPlayers;
  property actors:IPerson read Get_actors write Set_actors;
  property quest:IThing read Get_quest write Set_quest;
  property gameItem:IThing read Get_gameItem write Set_gameItem;
  property playMode:IGamePlayMode read Get_playMode write Set_playMode;
published
  property gameLocation:String read Get_gameLocation write Set_gameLocation;
  property numberOfSeasons:Integer read Get_numberOfSeasons write Set_numberOfSeasons;
  property gamePlatform:String read Get_gamePlatform write Set_gamePlatform;
  property numberOfEpisodes:Integer read Get_numberOfEpisodes write Set_numberOfEpisodes;
end;


(*VideoGame*)
TVideoGame=Class  (TGame,IVideoGame)
private
  FcheatCode:ICreativeWork;
  FgameTip:ICreativeWork;
  FgameServer:IGameServer;
protected
  function Get_cheatCode:ICreativeWork;virtual;
  procedure Set_cheatCode(v:ICreativeWork);virtual;
  function Get_gameTip:ICreativeWork;virtual;
  procedure Set_gameTip(v:ICreativeWork);virtual;
  function Get_gameServer:IGameServer;virtual;
  procedure Set_gameServer(v:IGameServer);virtual;
public
  property cheatCode:ICreativeWork read Get_cheatCode write Set_cheatCode;
  property gameTip:ICreativeWork read Get_gameTip write Set_gameTip;
  property gameServer:IGameServer read Get_gameServer write Set_gameServer;
published
end;


(*MovieTheater*)
TMovieTheater=Class  (TEntertainmentBusiness,IMovieTheater)
private
  FscreenCount:INumber;
protected
  function Get_screenCount:INumber;virtual;
  procedure Set_screenCount(v:INumber);virtual;
public
  property screenCount:INumber read Get_screenCount write Set_screenCount;
published
end;


(*TaxiService*)
TTaxiService=Class  (TService,ITaxiService)
  function TangTaxiService:TangibleValue;virtual;
end;


(*LodgingReservation*)
TLodgingReservation=Class  (TReservation,ILodgingReservation)
private
  FnumChildren:IQuantitativeValue;
  FnumAdults:Integer;
  FlodgingUnitDescription:String;
  FlodgingUnitType:String;
protected
  function Get_numChildren:IQuantitativeValue;virtual;
  procedure Set_numChildren(v:IQuantitativeValue);virtual;
  function Get_numAdults:Integer;virtual;
  procedure Set_numAdults(v:Integer);virtual;
  function Get_lodgingUnitDescription:String;virtual;
  procedure Set_lodgingUnitDescription(v:String);virtual;
  function Get_lodgingUnitType:String;virtual;
  procedure Set_lodgingUnitType(v:String);virtual;
public
  property numChildren:IQuantitativeValue read Get_numChildren write Set_numChildren;
published
  property numAdults:Integer read Get_numAdults write Set_numAdults;
  property lodgingUnitDescription:String read Get_lodgingUnitDescription write Set_lodgingUnitDescription;
  property lodgingUnitType:String read Get_lodgingUnitType write Set_lodgingUnitType;
end;


(*CommentAction*)
TCommentAction=Class  (TCommunicateAction,ICommentAction)
private
  FresultComment:IComment;
protected
  function Get_resultComment:IComment;virtual;
  procedure Set_resultComment(v:IComment);virtual;
public
  property resultComment:IComment read Get_resultComment write Set_resultComment;
published
end;


(*DrugLegalStatus*)
TDrugLegalStatus=Class  (TMedicalIntangible,IDrugLegalStatus)
 (*No atribs*)
end;


(*SuperficialAnatomy*)
TSuperficialAnatomy=Class  (TMedicalEntity,ISuperficialAnatomy)
private
  Fsignificance:String;
  FrelatedAnatomy:IAnatomicalSystem;
protected
  function Get_significance:String;virtual;
  procedure Set_significance(v:String);virtual;
  function Get_relatedAnatomy:IAnatomicalSystem;virtual;
  procedure Set_relatedAnatomy(v:IAnatomicalSystem);virtual;
public
  property relatedAnatomy:IAnatomicalSystem read Get_relatedAnatomy write Set_relatedAnatomy;
published
  property significance:String read Get_significance write Set_significance;
end;


(*ComicIssue*)
TComicIssue=Class  (TPublicationIssue,IComicIssue)
private
  Fpenciler:IPerson;
  Finker:IPerson;
  FvariantCover:String;
protected
  function Get_penciler:IPerson;virtual;
  procedure Set_penciler(v:IPerson);virtual;
  function Get_inker:IPerson;virtual;
  procedure Set_inker(v:IPerson);virtual;
  function Get_variantCover:String;virtual;
  procedure Set_variantCover(v:String);virtual;
public
  property penciler:IPerson read Get_penciler write Set_penciler;
  property inker:IPerson read Get_inker write Set_inker;
published
  property variantCover:String read Get_variantCover write Set_variantCover;
end;



Implementation

// Implementation



{*** TThing ***}

function TThing.Get_sameAs:String;
Begin
   result:=FsameAs;
End;

procedure TThing.Set_sameAs(v:String);
Begin
  FsameAs:=v;
End;

function TThing.Get_additionalType:String;
Begin
   result:=FadditionalType;
End;

procedure TThing.Set_additionalType(v:String);
Begin
  FadditionalType:=v;
End;

function TThing.Get_disambiguatingDescription:String;
Begin
   result:=FdisambiguatingDescription;
End;

procedure TThing.Set_disambiguatingDescription(v:String);
Begin
  FdisambiguatingDescription:=v;
End;

function TThing.Get_potentialAction:IAction;
Begin
   result:=FpotentialAction;
End;

procedure TThing.Set_potentialAction(v:IAction);
Begin
  FpotentialAction:=v;
End;

function TThing.Get_url:String;
Begin
   result:=Furl;
End;

procedure TThing.Set_url(v:String);
Begin
  Furl:=v;
End;

function TThing.Get_alternateName:String;
Begin
   result:=FalternateName;
End;

procedure TThing.Set_alternateName(v:String);
Begin
  FalternateName:=v;
End;

function TThing.Get_name:String;
Begin
   result:=Fname;
End;

procedure TThing.Set_name(v:String);
Begin
  Fname:=v;
End;

function TThing.Get_mainEntityOfPage:ICreativeWork;
Begin
   result:=FmainEntityOfPage;
End;

procedure TThing.Set_mainEntityOfPage(v:ICreativeWork);
Begin
  FmainEntityOfPage:=v;
End;



{*** TAction ***}

function TAction.Get_target:IEntryPoint;
Begin
   result:=Ftarget;
End;

procedure TAction.Set_target(v:IEntryPoint);
Begin
  Ftarget:=v;
End;

function TAction.Get_actionStatus:IActionStatusType;
Begin
   result:=FactionStatus;
End;

procedure TAction.Set_actionStatus(v:IActionStatusType);
Begin
  FactionStatus:=v;
End;

function TAction.Get_agent:IOrganization;
Begin
   result:=Fagent;
End;

procedure TAction.Set_agent(v:IOrganization);
Begin
  Fagent:=v;
End;

function TAction.Get_error:IThing;
Begin
   result:=Ferror;
End;

procedure TAction.Set_error(v:IThing);
Begin
  Ferror:=v;
End;



{*** TIntangible ***}

  function TIntangible.TangIntangible:TangibleValue;
Begin
  result:=''
End;



{*** TEntryPoint ***}

function TEntryPoint.Get_application:ISoftwareApplication;
Begin
   result:=Fapplication;
End;

procedure TEntryPoint.Set_application(v:ISoftwareApplication);
Begin
  Fapplication:=v;
End;

function TEntryPoint.Get_actionPlatform:String;
Begin
   result:=FactionPlatform;
End;

procedure TEntryPoint.Set_actionPlatform(v:String);
Begin
  FactionPlatform:=v;
End;

function TEntryPoint.Get_httpMethod:String;
Begin
   result:=FhttpMethod;
End;

procedure TEntryPoint.Set_httpMethod(v:String);
Begin
  FhttpMethod:=v;
End;

function TEntryPoint.Get_encodingType:String;
Begin
   result:=FencodingType;
End;

procedure TEntryPoint.Set_encodingType(v:String);
Begin
  FencodingType:=v;
End;

function TEntryPoint.Get_urlTemplate:String;
Begin
   result:=FurlTemplate;
End;

procedure TEntryPoint.Set_urlTemplate(v:String);
Begin
  FurlTemplate:=v;
End;

function TEntryPoint.Get_contentType:String;
Begin
   result:=FcontentType;
End;

procedure TEntryPoint.Set_contentType(v:String);
Begin
  FcontentType:=v;
End;



{*** TCreativeWork ***}

function TCreativeWork.Get_commentCount:Integer;
Begin
   result:=FcommentCount;
End;

procedure TCreativeWork.Set_commentCount(v:Integer);
Begin
  FcommentCount:=v;
End;

function TCreativeWork.Get_reviews:IReview;
Begin
   result:=Freviews;
End;

procedure TCreativeWork.Set_reviews(v:IReview);
Begin
  Freviews:=v;
End;

function TCreativeWork.Get_headline:String;
Begin
   result:=Fheadline;
End;

procedure TCreativeWork.Set_headline(v:String);
Begin
  Fheadline:=v;
End;

function TCreativeWork.Get_editor:IPerson;
Begin
   result:=Feditor;
End;

procedure TCreativeWork.Set_editor(v:IPerson);
Begin
  Feditor:=v;
End;

function TCreativeWork.Get_associatedMedia:IMediaObject;
Begin
   result:=FassociatedMedia;
End;

procedure TCreativeWork.Set_associatedMedia(v:IMediaObject);
Begin
  FassociatedMedia:=v;
End;

function TCreativeWork.Get_thumbnailUrl:String;
Begin
   result:=FthumbnailUrl;
End;

procedure TCreativeWork.Set_thumbnailUrl(v:String);
Begin
  FthumbnailUrl:=v;
End;

function TCreativeWork.Get_mentions:IThing;
Begin
   result:=Fmentions;
End;

procedure TCreativeWork.Set_mentions(v:IThing);
Begin
  Fmentions:=v;
End;

function TCreativeWork.Get_contentRating:String;
Begin
   result:=FcontentRating;
End;

procedure TCreativeWork.Set_contentRating(v:String);
Begin
  FcontentRating:=v;
End;

function TCreativeWork.Get_accessibilityHazard:String;
Begin
   result:=FaccessibilityHazard;
End;

procedure TCreativeWork.Set_accessibilityHazard(v:String);
Begin
  FaccessibilityHazard:=v;
End;

function TCreativeWork.Get_accessibilityAPI:String;
Begin
   result:=FaccessibilityAPI;
End;

procedure TCreativeWork.Set_accessibilityAPI(v:String);
Begin
  FaccessibilityAPI:=v;
End;

function TCreativeWork.Get_locationCreated:IPlace;
Begin
   result:=FlocationCreated;
End;

procedure TCreativeWork.Set_locationCreated(v:IPlace);
Begin
  FlocationCreated:=v;
End;

function TCreativeWork.Get_alternativeHeadline:String;
Begin
   result:=FalternativeHeadline;
End;

procedure TCreativeWork.Set_alternativeHeadline(v:String);
Begin
  FalternativeHeadline:=v;
End;

function TCreativeWork.Get_awards:String;
Begin
   result:=Fawards;
End;

procedure TCreativeWork.Set_awards(v:String);
Begin
  Fawards:=v;
End;

function TCreativeWork.Get_encodings:IMediaObject;
Begin
   result:=Fencodings;
End;

procedure TCreativeWork.Set_encodings(v:IMediaObject);
Begin
  Fencodings:=v;
End;

function TCreativeWork.Get_producer:IPerson;
Begin
   result:=Fproducer;
End;

procedure TCreativeWork.Set_producer(v:IPerson);
Begin
  Fproducer:=v;
End;

function TCreativeWork.Get_accessibilityFeature:String;
Begin
   result:=FaccessibilityFeature;
End;

procedure TCreativeWork.Set_accessibilityFeature(v:String);
Begin
  FaccessibilityFeature:=v;
End;

function TCreativeWork.Get_video:IVideoObject;
Begin
   result:=Fvideo;
End;

procedure TCreativeWork.Set_video(v:IVideoObject);
Begin
  Fvideo:=v;
End;

function TCreativeWork.Get_releasedEvent:IPublicationEvent;
Begin
   result:=FreleasedEvent;
End;

procedure TCreativeWork.Set_releasedEvent(v:IPublicationEvent);
Begin
  FreleasedEvent:=v;
End;

function TCreativeWork.Get_educationalUse:String;
Begin
   result:=FeducationalUse;
End;

procedure TCreativeWork.Set_educationalUse(v:String);
Begin
  FeducationalUse:=v;
End;

function TCreativeWork.Get_isBasedOnUrl:IProduct;
Begin
   result:=FisBasedOnUrl;
End;

procedure TCreativeWork.Set_isBasedOnUrl(v:IProduct);
Begin
  FisBasedOnUrl:=v;
End;

function TCreativeWork.Get_copyrightHolder:IOrganization;
Begin
   result:=FcopyrightHolder;
End;

procedure TCreativeWork.Set_copyrightHolder(v:IOrganization);
Begin
  FcopyrightHolder:=v;
End;

function TCreativeWork.Get_discussionUrl:String;
Begin
   result:=FdiscussionUrl;
End;

procedure TCreativeWork.Set_discussionUrl(v:String);
Begin
  FdiscussionUrl:=v;
End;

function TCreativeWork.Get_publisherImprint:IOrganization;
Begin
   result:=FpublisherImprint;
End;

procedure TCreativeWork.Set_publisherImprint(v:IOrganization);
Begin
  FpublisherImprint:=v;
End;

function TCreativeWork.Get_fileFormat:String;
Begin
   result:=FfileFormat;
End;

procedure TCreativeWork.Set_fileFormat(v:String);
Begin
  FfileFormat:=v;
End;

function TCreativeWork.Get_text:String;
Begin
   result:=Ftext;
End;

procedure TCreativeWork.Set_text(v:String);
Begin
  Ftext:=v;
End;

function TCreativeWork.Get_publication:IPublicationEvent;
Begin
   result:=Fpublication;
End;

procedure TCreativeWork.Set_publication(v:IPublicationEvent);
Begin
  Fpublication:=v;
End;

function TCreativeWork.Get_license:String;
Begin
   result:=Flicense;
End;

procedure TCreativeWork.Set_license(v:String);
Begin
  Flicense:=v;
End;

function TCreativeWork.Get_accessModeSufficient:String;
Begin
   result:=FaccessModeSufficient;
End;

procedure TCreativeWork.Set_accessModeSufficient(v:String);
Begin
  FaccessModeSufficient:=v;
End;

function TCreativeWork.Get_keywords:String;
Begin
   result:=Fkeywords;
End;

procedure TCreativeWork.Set_keywords(v:String);
Begin
  Fkeywords:=v;
End;

function TCreativeWork.Get_contentReferenceTime:TDateTime;
Begin
   result:=FcontentReferenceTime;
End;

procedure TCreativeWork.Set_contentReferenceTime(v:TDateTime);
Begin
  FcontentReferenceTime:=v;
End;

function TCreativeWork.Get_accessibilitySummary:String;
Begin
   result:=FaccessibilitySummary;
End;

procedure TCreativeWork.Set_accessibilitySummary(v:String);
Begin
  FaccessibilitySummary:=v;
End;

function TCreativeWork.Get_version:INumber;
Begin
   result:=Fversion;
End;

procedure TCreativeWork.Set_version(v:INumber);
Begin
  Fversion:=v;
End;

function TCreativeWork.Get_datePublished:TDateTime;
Begin
   result:=FdatePublished;
End;

procedure TCreativeWork.Set_datePublished(v:TDateTime);
Begin
  FdatePublished:=v;
End;

function TCreativeWork.Get_timeRequired:IDuration;
Begin
   result:=FtimeRequired;
End;

procedure TCreativeWork.Set_timeRequired(v:IDuration);
Begin
  FtimeRequired:=v;
End;

function TCreativeWork.Get_audio:IAudioObject;
Begin
   result:=Faudio;
End;

procedure TCreativeWork.Set_audio(v:IAudioObject);
Begin
  Faudio:=v;
End;

function TCreativeWork.Get_isFamilyFriendly:Boolean;
Begin
   result:=FisFamilyFriendly;
End;

procedure TCreativeWork.Set_isFamilyFriendly(v:Boolean);
Begin
  FisFamilyFriendly:=v;
End;

function TCreativeWork.Get_interactivityType:String;
Begin
   result:=FinteractivityType;
End;

procedure TCreativeWork.Set_interactivityType(v:String);
Begin
  FinteractivityType:=v;
End;

function TCreativeWork.Get_educationalAlignment:IAlignmentObject;
Begin
   result:=FeducationalAlignment;
End;

procedure TCreativeWork.Set_educationalAlignment(v:IAlignmentObject);
Begin
  FeducationalAlignment:=v;
End;

function TCreativeWork.Get_publishingPrinciples:String;
Begin
   result:=FpublishingPrinciples;
End;

procedure TCreativeWork.Set_publishingPrinciples(v:String);
Begin
  FpublishingPrinciples:=v;
End;

function TCreativeWork.Get_accessibilityControl:String;
Begin
   result:=FaccessibilityControl;
End;

procedure TCreativeWork.Set_accessibilityControl(v:String);
Begin
  FaccessibilityControl:=v;
End;

function TCreativeWork.Get_accountablePerson:IPerson;
Begin
   result:=FaccountablePerson;
End;

procedure TCreativeWork.Set_accountablePerson(v:IPerson);
Begin
  FaccountablePerson:=v;
End;

function TCreativeWork.Get_accessMode:String;
Begin
   result:=FaccessMode;
End;

procedure TCreativeWork.Set_accessMode(v:String);
Begin
  FaccessMode:=v;
End;

function TCreativeWork.Get_about:IThing;
Begin
   result:=Fabout;
End;

procedure TCreativeWork.Set_about(v:IThing);
Begin
  Fabout:=v;
End;

function TCreativeWork.Get_sourceOrganization:IOrganization;
Begin
   result:=FsourceOrganization;
End;

procedure TCreativeWork.Set_sourceOrganization(v:IOrganization);
Begin
  FsourceOrganization:=v;
End;

function TCreativeWork.Get_citation:ICreativeWork;
Begin
   result:=Fcitation;
End;

procedure TCreativeWork.Set_citation(v:ICreativeWork);
Begin
  Fcitation:=v;
End;

function TCreativeWork.Get_schemaVersion:String;
Begin
   result:=FschemaVersion;
End;

procedure TCreativeWork.Set_schemaVersion(v:String);
Begin
  FschemaVersion:=v;
End;

function TCreativeWork.Get_copyrightYear:INumber;
Begin
   result:=FcopyrightYear;
End;

procedure TCreativeWork.Set_copyrightYear(v:INumber);
Begin
  FcopyrightYear:=v;
End;

function TCreativeWork.Get_publisher:IPerson;
Begin
   result:=Fpublisher;
End;

procedure TCreativeWork.Set_publisher(v:IPerson);
Begin
  Fpublisher:=v;
End;

function TCreativeWork.Get_learningResourceType:String;
Begin
   result:=FlearningResourceType;
End;

procedure TCreativeWork.Set_learningResourceType(v:String);
Begin
  FlearningResourceType:=v;
End;

function TCreativeWork.Get_character:IPerson;
Begin
   result:=Fcharacter;
End;

procedure TCreativeWork.Set_character(v:IPerson);
Begin
  Fcharacter:=v;
End;

function TCreativeWork.Get_exampleOfWork:ICreativeWork;
Begin
   result:=FexampleOfWork;
End;

procedure TCreativeWork.Set_exampleOfWork(v:ICreativeWork);
Begin
  FexampleOfWork:=v;
End;

function TCreativeWork.Get_workTranslation:ICreativeWork;
Begin
   result:=FworkTranslation;
End;

procedure TCreativeWork.Set_workTranslation(v:ICreativeWork);
Begin
  FworkTranslation:=v;
End;

function TCreativeWork.Get_contentLocation:IPlace;
Begin
   result:=FcontentLocation;
End;

procedure TCreativeWork.Set_contentLocation(v:IPlace);
Begin
  FcontentLocation:=v;
End;



{*** TReview ***}

function TReview.Get_reviewRating:IRating;
Begin
   result:=FreviewRating;
End;

procedure TReview.Set_reviewRating(v:IRating);
Begin
  FreviewRating:=v;
End;

function TReview.Get_itemReviewed:IThing;
Begin
   result:=FitemReviewed;
End;

procedure TReview.Set_itemReviewed(v:IThing);
Begin
  FitemReviewed:=v;
End;

function TReview.Get_reviewBody:String;
Begin
   result:=FreviewBody;
End;

procedure TReview.Set_reviewBody(v:String);
Begin
  FreviewBody:=v;
End;



{*** TRating ***}

function TRating.Get_author:IPerson;
Begin
   result:=Fauthor;
End;

procedure TRating.Set_author(v:IPerson);
Begin
  Fauthor:=v;
End;

function TRating.Get_ratingValue:String;
Begin
   result:=FratingValue;
End;

procedure TRating.Set_ratingValue(v:String);
Begin
  FratingValue:=v;
End;

function TRating.Get_worstRating:String;
Begin
   result:=FworstRating;
End;

procedure TRating.Set_worstRating(v:String);
Begin
  FworstRating:=v;
End;

function TRating.Get_bestRating:INumber;
Begin
   result:=FbestRating;
End;

procedure TRating.Set_bestRating(v:INumber);
Begin
  FbestRating:=v;
End;



{*** TPerson ***}

function TPerson.Get_vatID:String;
Begin
   result:=FvatID;
End;

procedure TPerson.Set_vatID(v:String);
Begin
  FvatID:=v;
End;

function TPerson.Get_naics:String;
Begin
   result:=Fnaics;
End;

procedure TPerson.Set_naics(v:String);
Begin
  Fnaics:=v;
End;

function TPerson.Get_workLocation:IContactPoint;
Begin
   result:=FworkLocation;
End;

procedure TPerson.Set_workLocation(v:IContactPoint);
Begin
  FworkLocation:=v;
End;

function TPerson.Get_givenName:String;
Begin
   result:=FgivenName;
End;

procedure TPerson.Set_givenName(v:String);
Begin
  FgivenName:=v;
End;

function TPerson.Get_birthPlace:IPlace;
Begin
   result:=FbirthPlace;
End;

procedure TPerson.Set_birthPlace(v:IPlace);
Begin
  FbirthPlace:=v;
End;

function TPerson.Get_deathDate:TDateTime;
Begin
   result:=FdeathDate;
End;

procedure TPerson.Set_deathDate(v:TDateTime);
Begin
  FdeathDate:=v;
End;

function TPerson.Get_relatedTo:IPerson;
Begin
   result:=FrelatedTo;
End;

procedure TPerson.Set_relatedTo(v:IPerson);
Begin
  FrelatedTo:=v;
End;

function TPerson.Get_honorificSuffix:String;
Begin
   result:=FhonorificSuffix;
End;

procedure TPerson.Set_honorificSuffix(v:String);
Begin
  FhonorificSuffix:=v;
End;

function TPerson.Get_isicV4:String;
Begin
   result:=FisicV4;
End;

procedure TPerson.Set_isicV4(v:String);
Begin
  FisicV4:=v;
End;

function TPerson.Get_deathPlace:IPlace;
Begin
   result:=FdeathPlace;
End;

procedure TPerson.Set_deathPlace(v:IPlace);
Begin
  FdeathPlace:=v;
End;

function TPerson.Get_colleagues:IPerson;
Begin
   result:=Fcolleagues;
End;

procedure TPerson.Set_colleagues(v:IPerson);
Begin
  Fcolleagues:=v;
End;

function TPerson.Get_worksFor:IOrganization;
Begin
   result:=FworksFor;
End;

procedure TPerson.Set_worksFor(v:IOrganization);
Begin
  FworksFor:=v;
End;

function TPerson.Get_additionalName:String;
Begin
   result:=FadditionalName;
End;

procedure TPerson.Set_additionalName(v:String);
Begin
  FadditionalName:=v;
End;

function TPerson.Get_follows:IPerson;
Begin
   result:=Ffollows;
End;

procedure TPerson.Set_follows(v:IPerson);
Begin
  Ffollows:=v;
End;

function TPerson.Get_spouse:IPerson;
Begin
   result:=Fspouse;
End;

procedure TPerson.Set_spouse(v:IPerson);
Begin
  Fspouse:=v;
End;

function TPerson.Get_knows:IPerson;
Begin
   result:=Fknows;
End;

procedure TPerson.Set_knows(v:IPerson);
Begin
  Fknows:=v;
End;

function TPerson.Get_birthDate:TDateTime;
Begin
   result:=FbirthDate;
End;

procedure TPerson.Set_birthDate(v:TDateTime);
Begin
  FbirthDate:=v;
End;

function TPerson.Get_gender:String;
Begin
   result:=Fgender;
End;

procedure TPerson.Set_gender(v:String);
Begin
  Fgender:=v;
End;

function TPerson.Get_siblings:IPerson;
Begin
   result:=Fsiblings;
End;

procedure TPerson.Set_siblings(v:IPerson);
Begin
  Fsiblings:=v;
End;

function TPerson.Get_children:IPerson;
Begin
   result:=Fchildren;
End;

procedure TPerson.Set_children(v:IPerson);
Begin
  Fchildren:=v;
End;

function TPerson.Get_funder:IPerson;
Begin
   result:=Ffunder;
End;

procedure TPerson.Set_funder(v:IPerson);
Begin
  Ffunder:=v;
End;

function TPerson.Get_affiliation:IOrganization;
Begin
   result:=Faffiliation;
End;

procedure TPerson.Set_affiliation(v:IOrganization);
Begin
  Faffiliation:=v;
End;

function TPerson.Get_honorificPrefix:String;
Begin
   result:=FhonorificPrefix;
End;

procedure TPerson.Set_honorificPrefix(v:String);
Begin
  FhonorificPrefix:=v;
End;

function TPerson.Get_netWorth:IPriceSpecification;
Begin
   result:=FnetWorth;
End;

procedure TPerson.Set_netWorth(v:IPriceSpecification);
Begin
  FnetWorth:=v;
End;

function TPerson.Get_familyName:String;
Begin
   result:=FfamilyName;
End;

procedure TPerson.Set_familyName(v:String);
Begin
  FfamilyName:=v;
End;

function TPerson.Get_parents:IPerson;
Begin
   result:=Fparents;
End;

procedure TPerson.Set_parents(v:IPerson);
Begin
  Fparents:=v;
End;

function TPerson.Get_homeLocation:IPlace;
Begin
   result:=FhomeLocation;
End;

procedure TPerson.Set_homeLocation(v:IPlace);
Begin
  FhomeLocation:=v;
End;

function TPerson.Get_nationality:ICountry;
Begin
   result:=Fnationality;
End;

procedure TPerson.Set_nationality(v:ICountry);
Begin
  Fnationality:=v;
End;

function TPerson.Get_jobTitle:String;
Begin
   result:=FjobTitle;
End;

procedure TPerson.Set_jobTitle(v:String);
Begin
  FjobTitle:=v;
End;

function TPerson.Get_performerIn:IEvent;
Begin
   result:=FperformerIn;
End;

procedure TPerson.Set_performerIn(v:IEvent);
Begin
  FperformerIn:=v;
End;

function TPerson.Get_alumniOf:IEducationalOrganization;
Begin
   result:=FalumniOf;
End;

procedure TPerson.Set_alumniOf(v:IEducationalOrganization);
Begin
  FalumniOf:=v;
End;



{*** TStructuredValue ***}

  function TStructuredValue.TangStructuredValue:TangibleValue;
Begin
  result:=''
End;



{*** TContactPoint ***}

function TContactPoint.Get_availableLanguage:String;
Begin
   result:=FavailableLanguage;
End;

procedure TContactPoint.Set_availableLanguage(v:String);
Begin
  FavailableLanguage:=v;
End;

function TContactPoint.Get_contactType:String;
Begin
   result:=FcontactType;
End;

procedure TContactPoint.Set_contactType(v:String);
Begin
  FcontactType:=v;
End;

function TContactPoint.Get_productSupported:String;
Begin
   result:=FproductSupported;
End;

procedure TContactPoint.Set_productSupported(v:String);
Begin
  FproductSupported:=v;
End;

function TContactPoint.Get_contactOption:IContactPointOption;
Begin
   result:=FcontactOption;
End;

procedure TContactPoint.Set_contactOption(v:IContactPointOption);
Begin
  FcontactOption:=v;
End;

function TContactPoint.Get_hoursAvailable:IOpeningHoursSpecification;
Begin
   result:=FhoursAvailable;
End;

procedure TContactPoint.Set_hoursAvailable(v:IOpeningHoursSpecification);
Begin
  FhoursAvailable:=v;
End;



{*** TEnumeration ***}

  function TEnumeration.TangEnumeration:TangibleValue;
Begin
  result:=''
End;



{*** TContactPointOption ***}

  function TContactPointOption.TangContactPointOption:TangibleValue;
Begin
  result:=''
End;



{*** TOpeningHoursSpecification ***}

function TOpeningHoursSpecification.Get_opens:TDateTime;
Begin
   result:=Fopens;
End;

procedure TOpeningHoursSpecification.Set_opens(v:TDateTime);
Begin
  Fopens:=v;
End;

function TOpeningHoursSpecification.Get_dayOfWeek:IDayOfWeek;
Begin
   result:=FdayOfWeek;
End;

procedure TOpeningHoursSpecification.Set_dayOfWeek(v:IDayOfWeek);
Begin
  FdayOfWeek:=v;
End;

function TOpeningHoursSpecification.Get_closes:TDateTime;
Begin
   result:=Fcloses;
End;

procedure TOpeningHoursSpecification.Set_closes(v:TDateTime);
Begin
  Fcloses:=v;
End;



{*** TDayOfWeek ***}

  function TDayOfWeek.TangDayOfWeek:TangibleValue;
Begin
  result:=''
End;



{*** TPlace ***}

function TPlace.Get_map:String;
Begin
   result:=Fmap;
End;

procedure TPlace.Set_map(v:String);
Begin
  Fmap:=v;
End;

function TPlace.Get_maps:String;
Begin
   result:=Fmaps;
End;

procedure TPlace.Set_maps(v:String);
Begin
  Fmaps:=v;
End;

function TPlace.Get_openingHoursSpecification:IOpeningHoursSpecification;
Begin
   result:=FopeningHoursSpecification;
End;

procedure TPlace.Set_openingHoursSpecification(v:IOpeningHoursSpecification);
Begin
  FopeningHoursSpecification:=v;
End;

function TPlace.Get_geo:IGeoShape;
Begin
   result:=Fgeo;
End;

procedure TPlace.Set_geo(v:IGeoShape);
Begin
  Fgeo:=v;
End;

function TPlace.Get_faxNumber:String;
Begin
   result:=FfaxNumber;
End;

procedure TPlace.Set_faxNumber(v:String);
Begin
  FfaxNumber:=v;
End;

function TPlace.Get_specialOpeningHoursSpecification:IOpeningHoursSpecification;
Begin
   result:=FspecialOpeningHoursSpecification;
End;

procedure TPlace.Set_specialOpeningHoursSpecification(v:IOpeningHoursSpecification);
Begin
  FspecialOpeningHoursSpecification:=v;
End;

function TPlace.Get_telephone:String;
Begin
   result:=Ftelephone;
End;

procedure TPlace.Set_telephone(v:String);
Begin
  Ftelephone:=v;
End;

function TPlace.Get_branchCode:String;
Begin
   result:=FbranchCode;
End;

procedure TPlace.Set_branchCode(v:String);
Begin
  FbranchCode:=v;
End;

function TPlace.Get_maximumAttendeeCapacity:Integer;
Begin
   result:=FmaximumAttendeeCapacity;
End;

procedure TPlace.Set_maximumAttendeeCapacity(v:Integer);
Begin
  FmaximumAttendeeCapacity:=v;
End;

function TPlace.Get_photos:IImageObject;
Begin
   result:=Fphotos;
End;

procedure TPlace.Set_photos(v:IImageObject);
Begin
  Fphotos:=v;
End;

function TPlace.Get_smokingAllowed:Boolean;
Begin
   result:=FsmokingAllowed;
End;

procedure TPlace.Set_smokingAllowed(v:Boolean);
Begin
  FsmokingAllowed:=v;
End;

function TPlace.Get_containedIn:IPlace;
Begin
   result:=FcontainedIn;
End;

procedure TPlace.Set_containedIn(v:IPlace);
Begin
  FcontainedIn:=v;
End;

function TPlace.Get_containsPlace:IPlace;
Begin
   result:=FcontainsPlace;
End;

procedure TPlace.Set_containsPlace(v:IPlace);
Begin
  FcontainsPlace:=v;
End;



{*** TGeoShape ***}

function TGeoShape.Get_addressCountry:ICountry;
Begin
   result:=FaddressCountry;
End;

procedure TGeoShape.Set_addressCountry(v:ICountry);
Begin
  FaddressCountry:=v;
End;

function TGeoShape.Get_polygon:String;
Begin
   result:=Fpolygon;
End;

procedure TGeoShape.Set_polygon(v:String);
Begin
  Fpolygon:=v;
End;

function TGeoShape.Get_address:IPostalAddress;
Begin
   result:=Faddress;
End;

procedure TGeoShape.Set_address(v:IPostalAddress);
Begin
  Faddress:=v;
End;

function TGeoShape.Get_line:String;
Begin
   result:=Fline;
End;

procedure TGeoShape.Set_line(v:String);
Begin
  Fline:=v;
End;

function TGeoShape.Get_circle:String;
Begin
   result:=Fcircle;
End;

procedure TGeoShape.Set_circle(v:String);
Begin
  Fcircle:=v;
End;

function TGeoShape.Get_elevation:INumber;
Begin
   result:=Felevation;
End;

procedure TGeoShape.Set_elevation(v:INumber);
Begin
  Felevation:=v;
End;

function TGeoShape.Get_box:String;
Begin
   result:=Fbox;
End;

procedure TGeoShape.Set_box(v:String);
Begin
  Fbox:=v;
End;



{*** TPostalAddress ***}

function TPostalAddress.Get_addressRegion:String;
Begin
   result:=FaddressRegion;
End;

procedure TPostalAddress.Set_addressRegion(v:String);
Begin
  FaddressRegion:=v;
End;

function TPostalAddress.Get_streetAddress:String;
Begin
   result:=FstreetAddress;
End;

procedure TPostalAddress.Set_streetAddress(v:String);
Begin
  FstreetAddress:=v;
End;

function TPostalAddress.Get_postOfficeBoxNumber:String;
Begin
   result:=FpostOfficeBoxNumber;
End;

procedure TPostalAddress.Set_postOfficeBoxNumber(v:String);
Begin
  FpostOfficeBoxNumber:=v;
End;

function TPostalAddress.Get_addressLocality:String;
Begin
   result:=FaddressLocality;
End;

procedure TPostalAddress.Set_addressLocality(v:String);
Begin
  FaddressLocality:=v;
End;



{*** TMediaObject ***}

function TMediaObject.Get_encodingFormat:String;
Begin
   result:=FencodingFormat;
End;

procedure TMediaObject.Set_encodingFormat(v:String);
Begin
  FencodingFormat:=v;
End;

function TMediaObject.Get_bitrate:String;
Begin
   result:=Fbitrate;
End;

procedure TMediaObject.Set_bitrate(v:String);
Begin
  Fbitrate:=v;
End;

function TMediaObject.Get_regionsAllowed:IPlace;
Begin
   result:=FregionsAllowed;
End;

procedure TMediaObject.Set_regionsAllowed(v:IPlace);
Begin
  FregionsAllowed:=v;
End;

function TMediaObject.Get_expires:TDateTime;
Begin
   result:=Fexpires;
End;

procedure TMediaObject.Set_expires(v:TDateTime);
Begin
  Fexpires:=v;
End;

function TMediaObject.Get_requiresSubscription:Boolean;
Begin
   result:=FrequiresSubscription;
End;

procedure TMediaObject.Set_requiresSubscription(v:Boolean);
Begin
  FrequiresSubscription:=v;
End;

function TMediaObject.Get_uploadDate:TDateTime;
Begin
   result:=FuploadDate;
End;

procedure TMediaObject.Set_uploadDate(v:TDateTime);
Begin
  FuploadDate:=v;
End;

function TMediaObject.Get_associatedArticle:INewsArticle;
Begin
   result:=FassociatedArticle;
End;

procedure TMediaObject.Set_associatedArticle(v:INewsArticle);
Begin
  FassociatedArticle:=v;
End;

function TMediaObject.Get_encodesCreativeWork:ICreativeWork;
Begin
   result:=FencodesCreativeWork;
End;

procedure TMediaObject.Set_encodesCreativeWork(v:ICreativeWork);
Begin
  FencodesCreativeWork:=v;
End;

function TMediaObject.Get_contentUrl:String;
Begin
   result:=FcontentUrl;
End;

procedure TMediaObject.Set_contentUrl(v:String);
Begin
  FcontentUrl:=v;
End;

function TMediaObject.Get_embedUrl:String;
Begin
   result:=FembedUrl;
End;

procedure TMediaObject.Set_embedUrl(v:String);
Begin
  FembedUrl:=v;
End;

function TMediaObject.Get_playerType:String;
Begin
   result:=FplayerType;
End;

procedure TMediaObject.Set_playerType(v:String);
Begin
  FplayerType:=v;
End;

function TMediaObject.Get_contentSize:String;
Begin
   result:=FcontentSize;
End;

procedure TMediaObject.Set_contentSize(v:String);
Begin
  FcontentSize:=v;
End;



{*** TArticle ***}

function TArticle.Get_wordCount:Integer;
Begin
   result:=FwordCount;
End;

procedure TArticle.Set_wordCount(v:Integer);
Begin
  FwordCount:=v;
End;

function TArticle.Get_pageEnd:String;
Begin
   result:=FpageEnd;
End;

procedure TArticle.Set_pageEnd(v:String);
Begin
  FpageEnd:=v;
End;

function TArticle.Get_articleSection:String;
Begin
   result:=FarticleSection;
End;

procedure TArticle.Set_articleSection(v:String);
Begin
  FarticleSection:=v;
End;

function TArticle.Get_articleBody:String;
Begin
   result:=FarticleBody;
End;

procedure TArticle.Set_articleBody(v:String);
Begin
  FarticleBody:=v;
End;



{*** TNewsArticle ***}

function TNewsArticle.Get_printEdition:String;
Begin
   result:=FprintEdition;
End;

procedure TNewsArticle.Set_printEdition(v:String);
Begin
  FprintEdition:=v;
End;

function TNewsArticle.Get_printColumn:String;
Begin
   result:=FprintColumn;
End;

procedure TNewsArticle.Set_printColumn(v:String);
Begin
  FprintColumn:=v;
End;

function TNewsArticle.Get_printPage:String;
Begin
   result:=FprintPage;
End;

procedure TNewsArticle.Set_printPage(v:String);
Begin
  FprintPage:=v;
End;

function TNewsArticle.Get_printSection:String;
Begin
   result:=FprintSection;
End;

procedure TNewsArticle.Set_printSection(v:String);
Begin
  FprintSection:=v;
End;

function TNewsArticle.Get_dateline:String;
Begin
   result:=Fdateline;
End;

procedure TNewsArticle.Set_dateline(v:String);
Begin
  Fdateline:=v;
End;



{*** TImageObject ***}

function TImageObject.Get_caption:String;
Begin
   result:=Fcaption;
End;

procedure TImageObject.Set_caption(v:String);
Begin
  Fcaption:=v;
End;

function TImageObject.Get_exifData:String;
Begin
   result:=FexifData;
End;

procedure TImageObject.Set_exifData(v:String);
Begin
  FexifData:=v;
End;

function TImageObject.Get_representativeOfPage:Boolean;
Begin
   result:=FrepresentativeOfPage;
End;

procedure TImageObject.Set_representativeOfPage(v:Boolean);
Begin
  FrepresentativeOfPage:=v;
End;



{*** TOrganization ***}

function TOrganization.Get_email:String;
Begin
   result:=Femail;
End;

procedure TOrganization.Set_email(v:String);
Begin
  Femail:=v;
End;

function TOrganization.Get_hasOfferCatalog:IOfferCatalog;
Begin
   result:=FhasOfferCatalog;
End;

procedure TOrganization.Set_hasOfferCatalog(v:IOfferCatalog);
Begin
  FhasOfferCatalog:=v;
End;

function TOrganization.Get_leiCode:String;
Begin
   result:=FleiCode;
End;

procedure TOrganization.Set_leiCode(v:String);
Begin
  FleiCode:=v;
End;

function TOrganization.Get_owns:IProduct;
Begin
   result:=Fowns;
End;

procedure TOrganization.Set_owns(v:IProduct);
Begin
  Fowns:=v;
End;

function TOrganization.Get_founders:IPerson;
Begin
   result:=Ffounders;
End;

procedure TOrganization.Set_founders(v:IPerson);
Begin
  Ffounders:=v;
End;

function TOrganization.Get_members:IOrganization;
Begin
   result:=Fmembers;
End;

procedure TOrganization.Set_members(v:IOrganization);
Begin
  Fmembers:=v;
End;

function TOrganization.Get_hasPOS:IPlace;
Begin
   result:=FhasPOS;
End;

procedure TOrganization.Set_hasPOS(v:IPlace);
Begin
  FhasPOS:=v;
End;

function TOrganization.Get_dissolutionDate:TDateTime;
Begin
   result:=FdissolutionDate;
End;

procedure TOrganization.Set_dissolutionDate(v:TDateTime);
Begin
  FdissolutionDate:=v;
End;

function TOrganization.Get_logo:IImageObject;
Begin
   result:=Flogo;
End;

procedure TOrganization.Set_logo(v:IImageObject);
Begin
  Flogo:=v;
End;

function TOrganization.Get_taxID:String;
Begin
   result:=FtaxID;
End;

procedure TOrganization.Set_taxID(v:String);
Begin
  FtaxID:=v;
End;

function TOrganization.Get_brand:IOrganization;
Begin
   result:=Fbrand;
End;

procedure TOrganization.Set_brand(v:IOrganization);
Begin
  Fbrand:=v;
End;

function TOrganization.Get_globalLocationNumber:String;
Begin
   result:=FglobalLocationNumber;
End;

procedure TOrganization.Set_globalLocationNumber(v:String);
Begin
  FglobalLocationNumber:=v;
End;

function TOrganization.Get_duns:String;
Begin
   result:=Fduns;
End;

procedure TOrganization.Set_duns(v:String);
Begin
  Fduns:=v;
End;

function TOrganization.Get_foundingDate:TDateTime;
Begin
   result:=FfoundingDate;
End;

procedure TOrganization.Set_foundingDate(v:TDateTime);
Begin
  FfoundingDate:=v;
End;

function TOrganization.Get_events:IEvent;
Begin
   result:=Fevents;
End;

procedure TOrganization.Set_events(v:IEvent);
Begin
  Fevents:=v;
End;

function TOrganization.Get_employees:IPerson;
Begin
   result:=Femployees;
End;

procedure TOrganization.Set_employees(v:IPerson);
Begin
  Femployees:=v;
End;

function TOrganization.Get_legalName:String;
Begin
   result:=FlegalName;
End;

procedure TOrganization.Set_legalName(v:String);
Begin
  FlegalName:=v;
End;

function TOrganization.Get_department:IOrganization;
Begin
   result:=Fdepartment;
End;

procedure TOrganization.Set_department(v:IOrganization);
Begin
  Fdepartment:=v;
End;

function TOrganization.Get_seeks:IDemand;
Begin
   result:=Fseeks;
End;

procedure TOrganization.Set_seeks(v:IDemand);
Begin
  Fseeks:=v;
End;

function TOrganization.Get_contactPoints:IContactPoint;
Begin
   result:=FcontactPoints;
End;

procedure TOrganization.Set_contactPoints(v:IContactPoint);
Begin
  FcontactPoints:=v;
End;

function TOrganization.Get_foundingLocation:IPlace;
Begin
   result:=FfoundingLocation;
End;

procedure TOrganization.Set_foundingLocation(v:IPlace);
Begin
  FfoundingLocation:=v;
End;

function TOrganization.Get_subOrganization:IOrganization;
Begin
   result:=FsubOrganization;
End;

procedure TOrganization.Set_subOrganization(v:IOrganization);
Begin
  FsubOrganization:=v;
End;

function TOrganization.Get_makesOffer:IOffer;
Begin
   result:=FmakesOffer;
End;

procedure TOrganization.Set_makesOffer(v:IOffer);
Begin
  FmakesOffer:=v;
End;



{*** TItemList ***}

function TItemList.Get_numberOfItems:Integer;
Begin
   result:=FnumberOfItems;
End;

procedure TItemList.Set_numberOfItems(v:Integer);
Begin
  FnumberOfItems:=v;
End;

function TItemList.Get_itemListOrder:String;
Begin
   result:=FitemListOrder;
End;

procedure TItemList.Set_itemListOrder(v:String);
Begin
  FitemListOrder:=v;
End;

function TItemList.Get_itemListElement:IThing;
Begin
   result:=FitemListElement;
End;

procedure TItemList.Set_itemListElement(v:IThing);
Begin
  FitemListElement:=v;
End;



{*** TOfferCatalog ***}

  function TOfferCatalog.TangOfferCatalog:TangibleValue;
Begin
  result:=''
End;



{*** TProduct ***}

function TProduct.Get_color:String;
Begin
   result:=Fcolor;
End;

procedure TProduct.Set_color(v:String);
Begin
  Fcolor:=v;
End;

function TProduct.Get_releaseDate:TDateTime;
Begin
   result:=FreleaseDate;
End;

procedure TProduct.Set_releaseDate(v:TDateTime);
Begin
  FreleaseDate:=v;
End;

function TProduct.Get_model:IProductModel;
Begin
   result:=Fmodel;
End;

procedure TProduct.Set_model(v:IProductModel);
Begin
  Fmodel:=v;
End;

function TProduct.Get_category:IThing;
Begin
   result:=Fcategory;
End;

procedure TProduct.Set_category(v:IThing);
Begin
  Fcategory:=v;
End;

function TProduct.Get_isAccessoryOrSparePartFor:IProduct;
Begin
   result:=FisAccessoryOrSparePartFor;
End;

procedure TProduct.Set_isAccessoryOrSparePartFor(v:IProduct);
Begin
  FisAccessoryOrSparePartFor:=v;
End;

function TProduct.Get_gtin8:String;
Begin
   result:=Fgtin8;
End;

procedure TProduct.Set_gtin8(v:String);
Begin
  Fgtin8:=v;
End;

function TProduct.Get_isSimilarTo:IService;
Begin
   result:=FisSimilarTo;
End;

procedure TProduct.Set_isSimilarTo(v:IService);
Begin
  FisSimilarTo:=v;
End;

function TProduct.Get_weight:IQuantitativeValue;
Begin
   result:=Fweight;
End;

procedure TProduct.Set_weight(v:IQuantitativeValue);
Begin
  Fweight:=v;
End;

function TProduct.Get_isConsumableFor:IProduct;
Begin
   result:=FisConsumableFor;
End;

procedure TProduct.Set_isConsumableFor(v:IProduct);
Begin
  FisConsumableFor:=v;
End;

function TProduct.Get_gtin12:String;
Begin
   result:=Fgtin12;
End;

procedure TProduct.Set_gtin12(v:String);
Begin
  Fgtin12:=v;
End;

function TProduct.Get_productID:String;
Begin
   result:=FproductID;
End;

procedure TProduct.Set_productID(v:String);
Begin
  FproductID:=v;
End;



{*** TProductModel ***}

function TProductModel.Get_predecessorOf:IProductModel;
Begin
   result:=FpredecessorOf;
End;

procedure TProductModel.Set_predecessorOf(v:IProductModel);
Begin
  FpredecessorOf:=v;
End;

function TProductModel.Get_isVariantOf:IProductModel;
Begin
   result:=FisVariantOf;
End;

procedure TProductModel.Set_isVariantOf(v:IProductModel);
Begin
  FisVariantOf:=v;
End;

function TProductModel.Get_successorOf:IProductModel;
Begin
   result:=FsuccessorOf;
End;

procedure TProductModel.Set_successorOf(v:IProductModel);
Begin
  FsuccessorOf:=v;
End;



{*** TService ***}

function TService.Get_isRelatedTo:IService;
Begin
   result:=FisRelatedTo;
End;

procedure TService.Set_isRelatedTo(v:IService);
Begin
  FisRelatedTo:=v;
End;

function TService.Get_produces:IThing;
Begin
   result:=Fproduces;
End;

procedure TService.Set_produces(v:IThing);
Begin
  Fproduces:=v;
End;

function TService.Get_serviceAudience:IAudience;
Begin
   result:=FserviceAudience;
End;

procedure TService.Set_serviceAudience(v:IAudience);
Begin
  FserviceAudience:=v;
End;

function TService.Get_providerMobility:String;
Begin
   result:=FproviderMobility;
End;

procedure TService.Set_providerMobility(v:String);
Begin
  FproviderMobility:=v;
End;

function TService.Get_availableChannel:IServiceChannel;
Begin
   result:=FavailableChannel;
End;

procedure TService.Set_availableChannel(v:IServiceChannel);
Begin
  FavailableChannel:=v;
End;

function TService.Get_serviceType:String;
Begin
   result:=FserviceType;
End;

procedure TService.Set_serviceType(v:String);
Begin
  FserviceType:=v;
End;



{*** TAudience ***}

function TAudience.Get_audienceType:String;
Begin
   result:=FaudienceType;
End;

procedure TAudience.Set_audienceType(v:String);
Begin
  FaudienceType:=v;
End;

function TAudience.Get_geographicArea:IAdministrativeArea;
Begin
   result:=FgeographicArea;
End;

procedure TAudience.Set_geographicArea(v:IAdministrativeArea);
Begin
  FgeographicArea:=v;
End;



{*** TServiceChannel ***}

function TServiceChannel.Get_servicePhone:IContactPoint;
Begin
   result:=FservicePhone;
End;

procedure TServiceChannel.Set_servicePhone(v:IContactPoint);
Begin
  FservicePhone:=v;
End;

function TServiceChannel.Get_serviceLocation:IPlace;
Begin
   result:=FserviceLocation;
End;

procedure TServiceChannel.Set_serviceLocation(v:IPlace);
Begin
  FserviceLocation:=v;
End;

function TServiceChannel.Get_serviceSmsNumber:IContactPoint;
Begin
   result:=FserviceSmsNumber;
End;

procedure TServiceChannel.Set_serviceSmsNumber(v:IContactPoint);
Begin
  FserviceSmsNumber:=v;
End;

function TServiceChannel.Get_serviceUrl:String;
Begin
   result:=FserviceUrl;
End;

procedure TServiceChannel.Set_serviceUrl(v:String);
Begin
  FserviceUrl:=v;
End;

function TServiceChannel.Get_servicePostalAddress:IPostalAddress;
Begin
   result:=FservicePostalAddress;
End;

procedure TServiceChannel.Set_servicePostalAddress(v:IPostalAddress);
Begin
  FservicePostalAddress:=v;
End;

function TServiceChannel.Get_providesService:IService;
Begin
   result:=FprovidesService;
End;

procedure TServiceChannel.Set_providesService(v:IService);
Begin
  FprovidesService:=v;
End;

function TServiceChannel.Get_processingTime:IDuration;
Begin
   result:=FprocessingTime;
End;

procedure TServiceChannel.Set_processingTime(v:IDuration);
Begin
  FprocessingTime:=v;
End;



{*** TQuantity ***}

  function TQuantity.TangQuantity:TangibleValue;
Begin
  result:=''
End;



{*** TDuration ***}

  function TDuration.TangDuration:TangibleValue;
Begin
  result:=''
End;



{*** TQuantitativeValue ***}

function TQuantitativeValue.Get_maxValue:INumber;
Begin
   result:=FmaxValue;
End;

procedure TQuantitativeValue.Set_maxValue(v:INumber);
Begin
  FmaxValue:=v;
End;

function TQuantitativeValue.Get_valueReference:IQuantitativeValue;
Begin
   result:=FvalueReference;
End;

procedure TQuantitativeValue.Set_valueReference(v:IQuantitativeValue);
Begin
  FvalueReference:=v;
End;

function TQuantitativeValue.Get_unitText:String;
Begin
   result:=FunitText;
End;

procedure TQuantitativeValue.Set_unitText(v:String);
Begin
  FunitText:=v;
End;



{*** TEvent ***}

function TEvent.Get_eventStatus:IEventStatusType;
Begin
   result:=FeventStatus;
End;

procedure TEvent.Set_eventStatus(v:IEventStatusType);
Begin
  FeventStatus:=v;
End;

function TEvent.Get_attendees:IOrganization;
Begin
   result:=Fattendees;
End;

procedure TEvent.Set_attendees(v:IOrganization);
Begin
  Fattendees:=v;
End;

function TEvent.Get_composer:IOrganization;
Begin
   result:=Fcomposer;
End;

procedure TEvent.Set_composer(v:IOrganization);
Begin
  Fcomposer:=v;
End;

function TEvent.Get_startDate:TDateTime;
Begin
   result:=FstartDate;
End;

procedure TEvent.Set_startDate(v:TDateTime);
Begin
  FstartDate:=v;
End;

function TEvent.Get_previousStartDate:TDateTime;
Begin
   result:=FpreviousStartDate;
End;

procedure TEvent.Set_previousStartDate(v:TDateTime);
Begin
  FpreviousStartDate:=v;
End;

function TEvent.Get_performers:IPerson;
Begin
   result:=Fperformers;
End;

procedure TEvent.Set_performers(v:IPerson);
Begin
  Fperformers:=v;
End;

function TEvent.Get_subEvents:IEvent;
Begin
   result:=FsubEvents;
End;

procedure TEvent.Set_subEvents(v:IEvent);
Begin
  FsubEvents:=v;
End;

function TEvent.Get_contributor:IOrganization;
Begin
   result:=Fcontributor;
End;

procedure TEvent.Set_contributor(v:IOrganization);
Begin
  Fcontributor:=v;
End;

function TEvent.Get_organizer:IOrganization;
Begin
   result:=Forganizer;
End;

procedure TEvent.Set_organizer(v:IOrganization);
Begin
  Forganizer:=v;
End;

function TEvent.Get_typicalAgeRange:String;
Begin
   result:=FtypicalAgeRange;
End;

procedure TEvent.Set_typicalAgeRange(v:String);
Begin
  FtypicalAgeRange:=v;
End;

function TEvent.Get_offers:IOffer;
Begin
   result:=Foffers;
End;

procedure TEvent.Set_offers(v:IOffer);
Begin
  Foffers:=v;
End;

function TEvent.Get_remainingAttendeeCapacity:Integer;
Begin
   result:=FremainingAttendeeCapacity;
End;

procedure TEvent.Set_remainingAttendeeCapacity(v:Integer);
Begin
  FremainingAttendeeCapacity:=v;
End;

function TEvent.Get_workPerformed:ICreativeWork;
Begin
   result:=FworkPerformed;
End;

procedure TEvent.Set_workPerformed(v:ICreativeWork);
Begin
  FworkPerformed:=v;
End;

function TEvent.Get_doorTime:TDateTime;
Begin
   result:=FdoorTime;
End;

procedure TEvent.Set_doorTime(v:TDateTime);
Begin
  FdoorTime:=v;
End;

function TEvent.Get_superEvent:IEvent;
Begin
   result:=FsuperEvent;
End;

procedure TEvent.Set_superEvent(v:IEvent);
Begin
  FsuperEvent:=v;
End;

function TEvent.Get_recordedIn:ICreativeWork;
Begin
   result:=FrecordedIn;
End;

procedure TEvent.Set_recordedIn(v:ICreativeWork);
Begin
  FrecordedIn:=v;
End;



{*** TEventStatusType ***}

  function TEventStatusType.TangEventStatusType:TangibleValue;
Begin
  result:=''
End;



{*** TOffer ***}

function TOffer.Get_aggregateRating:IAggregateRating;
Begin
   result:=FaggregateRating;
End;

procedure TOffer.Set_aggregateRating(v:IAggregateRating);
Begin
  FaggregateRating:=v;
End;

function TOffer.Get_availabilityStarts:TDateTime;
Begin
   result:=FavailabilityStarts;
End;

procedure TOffer.Set_availabilityStarts(v:TDateTime);
Begin
  FavailabilityStarts:=v;
End;

function TOffer.Get_sku:String;
Begin
   result:=Fsku;
End;

procedure TOffer.Set_sku(v:String);
Begin
  Fsku:=v;
End;

function TOffer.Get_itemOffered:IProduct;
Begin
   result:=FitemOffered;
End;

procedure TOffer.Set_itemOffered(v:IProduct);
Begin
  FitemOffered:=v;
End;

function TOffer.Get_availableAtOrFrom:IPlace;
Begin
   result:=FavailableAtOrFrom;
End;

procedure TOffer.Set_availableAtOrFrom(v:IPlace);
Begin
  FavailableAtOrFrom:=v;
End;

function TOffer.Get_addOn:IOffer;
Begin
   result:=FaddOn;
End;

procedure TOffer.Set_addOn(v:IOffer);
Begin
  FaddOn:=v;
End;

function TOffer.Get_eligibleQuantity:IQuantitativeValue;
Begin
   result:=FeligibleQuantity;
End;

procedure TOffer.Set_eligibleQuantity(v:IQuantitativeValue);
Begin
  FeligibleQuantity:=v;
End;

function TOffer.Get_availableDeliveryMethod:IDeliveryMethod;
Begin
   result:=FavailableDeliveryMethod;
End;

procedure TOffer.Set_availableDeliveryMethod(v:IDeliveryMethod);
Begin
  FavailableDeliveryMethod:=v;
End;

function TOffer.Get_deliveryLeadTime:IQuantitativeValue;
Begin
   result:=FdeliveryLeadTime;
End;

procedure TOffer.Set_deliveryLeadTime(v:IQuantitativeValue);
Begin
  FdeliveryLeadTime:=v;
End;

function TOffer.Get_acceptedPaymentMethod:IPaymentMethod;
Begin
   result:=FacceptedPaymentMethod;
End;

procedure TOffer.Set_acceptedPaymentMethod(v:IPaymentMethod);
Begin
  FacceptedPaymentMethod:=v;
End;

function TOffer.Get_advanceBookingRequirement:IQuantitativeValue;
Begin
   result:=FadvanceBookingRequirement;
End;

procedure TOffer.Set_advanceBookingRequirement(v:IQuantitativeValue);
Begin
  FadvanceBookingRequirement:=v;
End;

function TOffer.Get_priceValidUntil:TDateTime;
Begin
   result:=FpriceValidUntil;
End;

procedure TOffer.Set_priceValidUntil(v:TDateTime);
Begin
  FpriceValidUntil:=v;
End;



{*** TAggregateRating ***}

function TAggregateRating.Get_ratingCount:Integer;
Begin
   result:=FratingCount;
End;

procedure TAggregateRating.Set_ratingCount(v:Integer);
Begin
  FratingCount:=v;
End;

function TAggregateRating.Get_reviewCount:Integer;
Begin
   result:=FreviewCount;
End;

procedure TAggregateRating.Set_reviewCount(v:Integer);
Begin
  FreviewCount:=v;
End;



{*** TDeliveryMethod ***}

  function TDeliveryMethod.TangDeliveryMethod:TangibleValue;
Begin
  result:=''
End;



{*** TPaymentMethod ***}

  function TPaymentMethod.TangPaymentMethod:TangibleValue;
Begin
  result:=''
End;



{*** TDemand ***}

function TDemand.Get_availabilityEnds:TDateTime;
Begin
   result:=FavailabilityEnds;
End;

procedure TDemand.Set_availabilityEnds(v:TDateTime);
Begin
  FavailabilityEnds:=v;
End;

function TDemand.Get_itemCondition:IOfferItemCondition;
Begin
   result:=FitemCondition;
End;

procedure TDemand.Set_itemCondition(v:IOfferItemCondition);
Begin
  FitemCondition:=v;
End;

function TDemand.Get_eligibleDuration:IQuantitativeValue;
Begin
   result:=FeligibleDuration;
End;

procedure TDemand.Set_eligibleDuration(v:IQuantitativeValue);
Begin
  FeligibleDuration:=v;
End;

function TDemand.Get_mpn:String;
Begin
   result:=Fmpn;
End;

procedure TDemand.Set_mpn(v:String);
Begin
  Fmpn:=v;
End;

function TDemand.Get_gtin13:String;
Begin
   result:=Fgtin13;
End;

procedure TDemand.Set_gtin13(v:String);
Begin
  Fgtin13:=v;
End;

function TDemand.Get_gtin14:String;
Begin
   result:=Fgtin14;
End;

procedure TDemand.Set_gtin14(v:String);
Begin
  Fgtin14:=v;
End;

function TDemand.Get_validFrom:TDateTime;
Begin
   result:=FvalidFrom;
End;

procedure TDemand.Set_validFrom(v:TDateTime);
Begin
  FvalidFrom:=v;
End;

function TDemand.Get_ineligibleRegion:IPlace;
Begin
   result:=FineligibleRegion;
End;

procedure TDemand.Set_ineligibleRegion(v:IPlace);
Begin
  FineligibleRegion:=v;
End;

function TDemand.Get_availability:IItemAvailability;
Begin
   result:=Favailability;
End;

procedure TDemand.Set_availability(v:IItemAvailability);
Begin
  Favailability:=v;
End;

function TDemand.Get_eligibleTransactionVolume:IPriceSpecification;
Begin
   result:=FeligibleTransactionVolume;
End;

procedure TDemand.Set_eligibleTransactionVolume(v:IPriceSpecification);
Begin
  FeligibleTransactionVolume:=v;
End;

function TDemand.Get_includesObject:ITypeAndQuantityNode;
Begin
   result:=FincludesObject;
End;

procedure TDemand.Set_includesObject(v:ITypeAndQuantityNode);
Begin
  FincludesObject:=v;
End;

function TDemand.Get_eligibleCustomerType:IBusinessEntityType;
Begin
   result:=FeligibleCustomerType;
End;

procedure TDemand.Set_eligibleCustomerType(v:IBusinessEntityType);
Begin
  FeligibleCustomerType:=v;
End;

function TDemand.Get_inventoryLevel:IQuantitativeValue;
Begin
   result:=FinventoryLevel;
End;

procedure TDemand.Set_inventoryLevel(v:IQuantitativeValue);
Begin
  FinventoryLevel:=v;
End;



{*** TOfferItemCondition ***}

  function TOfferItemCondition.TangOfferItemCondition:TangibleValue;
Begin
  result:=''
End;



{*** TItemAvailability ***}

  function TItemAvailability.TangItemAvailability:TangibleValue;
Begin
  result:=''
End;



{*** TPriceSpecification ***}

function TPriceSpecification.Get_priceCurrency:String;
Begin
   result:=FpriceCurrency;
End;

procedure TPriceSpecification.Set_priceCurrency(v:String);
Begin
  FpriceCurrency:=v;
End;

function TPriceSpecification.Get_validThrough:TDateTime;
Begin
   result:=FvalidThrough;
End;

procedure TPriceSpecification.Set_validThrough(v:TDateTime);
Begin
  FvalidThrough:=v;
End;

function TPriceSpecification.Get_valueAddedTaxIncluded:Boolean;
Begin
   result:=FvalueAddedTaxIncluded;
End;

procedure TPriceSpecification.Set_valueAddedTaxIncluded(v:Boolean);
Begin
  FvalueAddedTaxIncluded:=v;
End;

function TPriceSpecification.Get_minPrice:INumber;
Begin
   result:=FminPrice;
End;

procedure TPriceSpecification.Set_minPrice(v:INumber);
Begin
  FminPrice:=v;
End;

function TPriceSpecification.Get_maxPrice:INumber;
Begin
   result:=FmaxPrice;
End;

procedure TPriceSpecification.Set_maxPrice(v:INumber);
Begin
  FmaxPrice:=v;
End;



{*** TTypeAndQuantityNode ***}

function TTypeAndQuantityNode.Get_typeOfGood:IService;
Begin
   result:=FtypeOfGood;
End;

procedure TTypeAndQuantityNode.Set_typeOfGood(v:IService);
Begin
  FtypeOfGood:=v;
End;

function TTypeAndQuantityNode.Get_unitCode:String;
Begin
   result:=FunitCode;
End;

procedure TTypeAndQuantityNode.Set_unitCode(v:String);
Begin
  FunitCode:=v;
End;

function TTypeAndQuantityNode.Get_businessFunction:IBusinessFunction;
Begin
   result:=FbusinessFunction;
End;

procedure TTypeAndQuantityNode.Set_businessFunction(v:IBusinessFunction);
Begin
  FbusinessFunction:=v;
End;

function TTypeAndQuantityNode.Get_amountOfThisGood:INumber;
Begin
   result:=FamountOfThisGood;
End;

procedure TTypeAndQuantityNode.Set_amountOfThisGood(v:INumber);
Begin
  FamountOfThisGood:=v;
End;



{*** TBusinessFunction ***}

  function TBusinessFunction.TangBusinessFunction:TangibleValue;
Begin
  result:=''
End;



{*** TBusinessEntityType ***}

  function TBusinessEntityType.TangBusinessEntityType:TangibleValue;
Begin
  result:=''
End;



{*** TVideoObject ***}

function TVideoObject.Get_thumbnail:IImageObject;
Begin
   result:=Fthumbnail;
End;

procedure TVideoObject.Set_thumbnail(v:IImageObject);
Begin
  Fthumbnail:=v;
End;

function TVideoObject.Get_videoFrameSize:String;
Begin
   result:=FvideoFrameSize;
End;

procedure TVideoObject.Set_videoFrameSize(v:String);
Begin
  FvideoFrameSize:=v;
End;

function TVideoObject.Get_videoQuality:String;
Begin
   result:=FvideoQuality;
End;

procedure TVideoObject.Set_videoQuality(v:String);
Begin
  FvideoQuality:=v;
End;



{*** TPublicationEvent ***}

function TPublicationEvent.Get_free:Boolean;
Begin
   result:=Ffree;
End;

procedure TPublicationEvent.Set_free(v:Boolean);
Begin
  Ffree:=v;
End;

function TPublicationEvent.Get_publishedOn:IBroadcastService;
Begin
   result:=FpublishedOn;
End;

procedure TPublicationEvent.Set_publishedOn(v:IBroadcastService);
Begin
  FpublishedOn:=v;
End;

function TPublicationEvent.Get_publishedBy:IOrganization;
Begin
   result:=FpublishedBy;
End;

procedure TPublicationEvent.Set_publishedBy(v:IOrganization);
Begin
  FpublishedBy:=v;
End;



{*** TBroadcastService ***}

function TBroadcastService.Get_broadcastTimezone:String;
Begin
   result:=FbroadcastTimezone;
End;

procedure TBroadcastService.Set_broadcastTimezone(v:String);
Begin
  FbroadcastTimezone:=v;
End;

function TBroadcastService.Get_parentService:IBroadcastService;
Begin
   result:=FparentService;
End;

procedure TBroadcastService.Set_parentService(v:IBroadcastService);
Begin
  FparentService:=v;
End;

function TBroadcastService.Get_broadcastFrequency:String;
Begin
   result:=FbroadcastFrequency;
End;

procedure TBroadcastService.Set_broadcastFrequency(v:String);
Begin
  FbroadcastFrequency:=v;
End;

function TBroadcastService.Get_broadcastAffiliateOf:IOrganization;
Begin
   result:=FbroadcastAffiliateOf;
End;

procedure TBroadcastService.Set_broadcastAffiliateOf(v:IOrganization);
Begin
  FbroadcastAffiliateOf:=v;
End;

function TBroadcastService.Get_broadcastDisplayName:String;
Begin
   result:=FbroadcastDisplayName;
End;

procedure TBroadcastService.Set_broadcastDisplayName(v:String);
Begin
  FbroadcastDisplayName:=v;
End;

function TBroadcastService.Get_area:IPlace;
Begin
   result:=Farea;
End;

procedure TBroadcastService.Set_area(v:IPlace);
Begin
  Farea:=v;
End;

function TBroadcastService.Get_broadcaster:IOrganization;
Begin
   result:=Fbroadcaster;
End;

procedure TBroadcastService.Set_broadcaster(v:IOrganization);
Begin
  Fbroadcaster:=v;
End;



{*** TAudioObject ***}

function TAudioObject.Get_transcript:String;
Begin
   result:=Ftranscript;
End;

procedure TAudioObject.Set_transcript(v:String);
Begin
  Ftranscript:=v;
End;



{*** TAlignmentObject ***}

function TAlignmentObject.Get_targetName:String;
Begin
   result:=FtargetName;
End;

procedure TAlignmentObject.Set_targetName(v:String);
Begin
  FtargetName:=v;
End;

function TAlignmentObject.Get_targetUrl:String;
Begin
   result:=FtargetUrl;
End;

procedure TAlignmentObject.Set_targetUrl(v:String);
Begin
  FtargetUrl:=v;
End;

function TAlignmentObject.Get_targetDescription:String;
Begin
   result:=FtargetDescription;
End;

procedure TAlignmentObject.Set_targetDescription(v:String);
Begin
  FtargetDescription:=v;
End;

function TAlignmentObject.Get_educationalFramework:String;
Begin
   result:=FeducationalFramework;
End;

procedure TAlignmentObject.Set_educationalFramework(v:String);
Begin
  FeducationalFramework:=v;
End;

function TAlignmentObject.Get_alignmentType:String;
Begin
   result:=FalignmentType;
End;

procedure TAlignmentObject.Set_alignmentType(v:String);
Begin
  FalignmentType:=v;
End;



{*** TSoftwareApplication ***}

function TSoftwareApplication.Get_storageRequirements:String;
Begin
   result:=FstorageRequirements;
End;

procedure TSoftwareApplication.Set_storageRequirements(v:String);
Begin
  FstorageRequirements:=v;
End;

function TSoftwareApplication.Get_releaseNotes:String;
Begin
   result:=FreleaseNotes;
End;

procedure TSoftwareApplication.Set_releaseNotes(v:String);
Begin
  FreleaseNotes:=v;
End;

function TSoftwareApplication.Get_operatingSystem:String;
Begin
   result:=FoperatingSystem;
End;

procedure TSoftwareApplication.Set_operatingSystem(v:String);
Begin
  FoperatingSystem:=v;
End;

function TSoftwareApplication.Get_countriesSupported:String;
Begin
   result:=FcountriesSupported;
End;

procedure TSoftwareApplication.Set_countriesSupported(v:String);
Begin
  FcountriesSupported:=v;
End;

function TSoftwareApplication.Get_permissions:String;
Begin
   result:=Fpermissions;
End;

procedure TSoftwareApplication.Set_permissions(v:String);
Begin
  Fpermissions:=v;
End;

function TSoftwareApplication.Get_screenshot:String;
Begin
   result:=Fscreenshot;
End;

procedure TSoftwareApplication.Set_screenshot(v:String);
Begin
  Fscreenshot:=v;
End;

function TSoftwareApplication.Get_softwareHelp:ICreativeWork;
Begin
   result:=FsoftwareHelp;
End;

procedure TSoftwareApplication.Set_softwareHelp(v:ICreativeWork);
Begin
  FsoftwareHelp:=v;
End;

function TSoftwareApplication.Get_softwareVersion:String;
Begin
   result:=FsoftwareVersion;
End;

procedure TSoftwareApplication.Set_softwareVersion(v:String);
Begin
  FsoftwareVersion:=v;
End;

function TSoftwareApplication.Get_downloadUrl:String;
Begin
   result:=FdownloadUrl;
End;

procedure TSoftwareApplication.Set_downloadUrl(v:String);
Begin
  FdownloadUrl:=v;
End;

function TSoftwareApplication.Get_device:String;
Begin
   result:=Fdevice;
End;

procedure TSoftwareApplication.Set_device(v:String);
Begin
  Fdevice:=v;
End;

function TSoftwareApplication.Get_applicationSuite:String;
Begin
   result:=FapplicationSuite;
End;

procedure TSoftwareApplication.Set_applicationSuite(v:String);
Begin
  FapplicationSuite:=v;
End;

function TSoftwareApplication.Get_featureList:String;
Begin
   result:=FfeatureList;
End;

procedure TSoftwareApplication.Set_featureList(v:String);
Begin
  FfeatureList:=v;
End;

function TSoftwareApplication.Get_supportingData:IDataFeed;
Begin
   result:=FsupportingData;
End;

procedure TSoftwareApplication.Set_supportingData(v:IDataFeed);
Begin
  FsupportingData:=v;
End;

function TSoftwareApplication.Get_applicationCategory:String;
Begin
   result:=FapplicationCategory;
End;

procedure TSoftwareApplication.Set_applicationCategory(v:String);
Begin
  FapplicationCategory:=v;
End;

function TSoftwareApplication.Get_installUrl:String;
Begin
   result:=FinstallUrl;
End;

procedure TSoftwareApplication.Set_installUrl(v:String);
Begin
  FinstallUrl:=v;
End;

function TSoftwareApplication.Get_processorRequirements:String;
Begin
   result:=FprocessorRequirements;
End;

procedure TSoftwareApplication.Set_processorRequirements(v:String);
Begin
  FprocessorRequirements:=v;
End;

function TSoftwareApplication.Get_fileSize:String;
Begin
   result:=FfileSize;
End;

procedure TSoftwareApplication.Set_fileSize(v:String);
Begin
  FfileSize:=v;
End;

function TSoftwareApplication.Get_applicationSubCategory:String;
Begin
   result:=FapplicationSubCategory;
End;

procedure TSoftwareApplication.Set_applicationSubCategory(v:String);
Begin
  FapplicationSubCategory:=v;
End;

function TSoftwareApplication.Get_countriesNotSupported:String;
Begin
   result:=FcountriesNotSupported;
End;

procedure TSoftwareApplication.Set_countriesNotSupported(v:String);
Begin
  FcountriesNotSupported:=v;
End;

function TSoftwareApplication.Get_requirements:String;
Begin
   result:=Frequirements;
End;

procedure TSoftwareApplication.Set_requirements(v:String);
Begin
  Frequirements:=v;
End;

function TSoftwareApplication.Get_memoryRequirements:String;
Begin
   result:=FmemoryRequirements;
End;

procedure TSoftwareApplication.Set_memoryRequirements(v:String);
Begin
  FmemoryRequirements:=v;
End;

function TSoftwareApplication.Get_softwareAddOn:ISoftwareApplication;
Begin
   result:=FsoftwareAddOn;
End;

procedure TSoftwareApplication.Set_softwareAddOn(v:ISoftwareApplication);
Begin
  FsoftwareAddOn:=v;
End;



{*** TDataset ***}

function TDataset.Get_temporal:TDateTime;
Begin
   result:=Ftemporal;
End;

procedure TDataset.Set_temporal(v:TDateTime);
Begin
  Ftemporal:=v;
End;

function TDataset.Get_variablesMeasured:String;
Begin
   result:=FvariablesMeasured;
End;

procedure TDataset.Set_variablesMeasured(v:String);
Begin
  FvariablesMeasured:=v;
End;

function TDataset.Get_spatial:IPlace;
Begin
   result:=Fspatial;
End;

procedure TDataset.Set_spatial(v:IPlace);
Begin
  Fspatial:=v;
End;

function TDataset.Get_includedDataCatalog:IDataCatalog;
Begin
   result:=FincludedDataCatalog;
End;

procedure TDataset.Set_includedDataCatalog(v:IDataCatalog);
Begin
  FincludedDataCatalog:=v;
End;

function TDataset.Get_datasetTimeInterval:TDateTime;
Begin
   result:=FdatasetTimeInterval;
End;

procedure TDataset.Set_datasetTimeInterval(v:TDateTime);
Begin
  FdatasetTimeInterval:=v;
End;

function TDataset.Get_catalog:IDataCatalog;
Begin
   result:=Fcatalog;
End;

procedure TDataset.Set_catalog(v:IDataCatalog);
Begin
  Fcatalog:=v;
End;

function TDataset.Get_distribution:IDataDownload;
Begin
   result:=Fdistribution;
End;

procedure TDataset.Set_distribution(v:IDataDownload);
Begin
  Fdistribution:=v;
End;



{*** TDataCatalog ***}

function TDataCatalog.Get_dataset:IDataset;
Begin
   result:=Fdataset;
End;

procedure TDataCatalog.Set_dataset(v:IDataset);
Begin
  Fdataset:=v;
End;



{*** TDataFeed ***}

function TDataFeed.Get_dataFeedElement:IThing;
Begin
   result:=FdataFeedElement;
End;

procedure TDataFeed.Set_dataFeedElement(v:IThing);
Begin
  FdataFeedElement:=v;
End;



{*** TActionStatusType ***}

  function TActionStatusType.TangActionStatusType:TangibleValue;
Begin
  result:=''
End;



{*** TPeriodical ***}

function TPeriodical.Get_issn:String;
Begin
   result:=Fissn;
End;

procedure TPeriodical.Set_issn(v:String);
Begin
  Fissn:=v;
End;



{*** TPermit ***}

function TPermit.Get_validFor:IDuration;
Begin
   result:=FvalidFor;
End;

procedure TPermit.Set_validFor(v:IDuration);
Begin
  FvalidFor:=v;
End;

function TPermit.Get_issuedThrough:IService;
Begin
   result:=FissuedThrough;
End;

procedure TPermit.Set_issuedThrough(v:IService);
Begin
  FissuedThrough:=v;
End;

function TPermit.Get_validUntil:TDateTime;
Begin
   result:=FvalidUntil;
End;

procedure TPermit.Set_validUntil(v:TDateTime);
Begin
  FvalidUntil:=v;
End;

function TPermit.Get_validIn:IAdministrativeArea;
Begin
   result:=FvalidIn;
End;

procedure TPermit.Set_validIn(v:IAdministrativeArea);
Begin
  FvalidIn:=v;
End;

function TPermit.Get_permitAudience:IAudience;
Begin
   result:=FpermitAudience;
End;

procedure TPermit.Set_permitAudience(v:IAudience);
Begin
  FpermitAudience:=v;
End;

function TPermit.Get_issuedBy:IOrganization;
Begin
   result:=FissuedBy;
End;

procedure TPermit.Set_issuedBy(v:IOrganization);
Begin
  FissuedBy:=v;
End;



{*** TGovernmentPermit ***}

  function TGovernmentPermit.TangGovernmentPermit:TangibleValue;
Begin
  result:=''
End;



{*** TUpdateAction ***}

function TUpdateAction.Get_collection:IThing;
Begin
   result:=Fcollection;
End;

procedure TUpdateAction.Set_collection(v:IThing);
Begin
  Fcollection:=v;
End;



{*** TEpisode ***}

function TEpisode.Get_episodeNumber:String;
Begin
   result:=FepisodeNumber;
End;

procedure TEpisode.Set_episodeNumber(v:String);
Begin
  FepisodeNumber:=v;
End;



{*** TLocalBusiness ***}

function TLocalBusiness.Get_priceRange:String;
Begin
   result:=FpriceRange;
End;

procedure TLocalBusiness.Set_priceRange(v:String);
Begin
  FpriceRange:=v;
End;

function TLocalBusiness.Get_branchOf:IOrganization;
Begin
   result:=FbranchOf;
End;

procedure TLocalBusiness.Set_branchOf(v:IOrganization);
Begin
  FbranchOf:=v;
End;

function TLocalBusiness.Get_openingHours:String;
Begin
   result:=FopeningHours;
End;

procedure TLocalBusiness.Set_openingHours(v:String);
Begin
  FopeningHours:=v;
End;

function TLocalBusiness.Get_paymentAccepted:String;
Begin
   result:=FpaymentAccepted;
End;

procedure TLocalBusiness.Set_paymentAccepted(v:String);
Begin
  FpaymentAccepted:=v;
End;

function TLocalBusiness.Get_currenciesAccepted:String;
Begin
   result:=FcurrenciesAccepted;
End;

procedure TLocalBusiness.Set_currenciesAccepted(v:String);
Begin
  FcurrenciesAccepted:=v;
End;



{*** TFoodEstablishment ***}

function TFoodEstablishment.Get_acceptsReservations:String;
Begin
   result:=FacceptsReservations;
End;

procedure TFoodEstablishment.Set_acceptsReservations(v:String);
Begin
  FacceptsReservations:=v;
End;

function TFoodEstablishment.Get_servesCuisine:String;
Begin
   result:=FservesCuisine;
End;

procedure TFoodEstablishment.Set_servesCuisine(v:String);
Begin
  FservesCuisine:=v;
End;

function TFoodEstablishment.Get_menu:String;
Begin
   result:=Fmenu;
End;

procedure TFoodEstablishment.Set_menu(v:String);
Begin
  Fmenu:=v;
End;



{*** TBroadcastChannel ***}

function TBroadcastChannel.Get_broadcastChannelId:String;
Begin
   result:=FbroadcastChannelId;
End;

procedure TBroadcastChannel.Set_broadcastChannelId(v:String);
Begin
  FbroadcastChannelId:=v;
End;

function TBroadcastChannel.Get_broadcastServiceTier:String;
Begin
   result:=FbroadcastServiceTier;
End;

procedure TBroadcastChannel.Set_broadcastServiceTier(v:String);
Begin
  FbroadcastServiceTier:=v;
End;

function TBroadcastChannel.Get_inBroadcastLineup:ICableOrSatelliteService;
Begin
   result:=FinBroadcastLineup;
End;

procedure TBroadcastChannel.Set_inBroadcastLineup(v:ICableOrSatelliteService);
Begin
  FinBroadcastLineup:=v;
End;

function TBroadcastChannel.Get_providesBroadcastService:IBroadcastService;
Begin
   result:=FprovidesBroadcastService;
End;

procedure TBroadcastChannel.Set_providesBroadcastService(v:IBroadcastService);
Begin
  FprovidesBroadcastService:=v;
End;



{*** TCableOrSatelliteService ***}

  function TCableOrSatelliteService.TangCableOrSatelliteService:TangibleValue;
Begin
  result:=''
End;



{*** TRadioChannel ***}

  function TRadioChannel.TangRadioChannel:TangibleValue;
Begin
  result:=''
End;



{*** TAMRadioChannel ***}

  function TAMRadioChannel.TangAMRadioChannel:TangibleValue;
Begin
  result:=''
End;



{*** TMedicalEntity ***}

function TMedicalEntity.Get_code:IMedicalCode;
Begin
   result:=Fcode;
End;

procedure TMedicalEntity.Set_code(v:IMedicalCode);
Begin
  Fcode:=v;
End;

function TMedicalEntity.Get_guideline:IMedicalGuideline;
Begin
   result:=Fguideline;
End;

procedure TMedicalEntity.Set_guideline(v:IMedicalGuideline);
Begin
  Fguideline:=v;
End;

function TMedicalEntity.Get_medicineSystem:IMedicineSystem;
Begin
   result:=FmedicineSystem;
End;

procedure TMedicalEntity.Set_medicineSystem(v:IMedicineSystem);
Begin
  FmedicineSystem:=v;
End;

function TMedicalEntity.Get_legalStatus:String;
Begin
   result:=FlegalStatus;
End;

procedure TMedicalEntity.Set_legalStatus(v:String);
Begin
  FlegalStatus:=v;
End;

function TMedicalEntity.Get_recognizingAuthority:IOrganization;
Begin
   result:=FrecognizingAuthority;
End;

procedure TMedicalEntity.Set_recognizingAuthority(v:IOrganization);
Begin
  FrecognizingAuthority:=v;
End;

function TMedicalEntity.Get_study:IMedicalStudy;
Begin
   result:=Fstudy;
End;

procedure TMedicalEntity.Set_study(v:IMedicalStudy);
Begin
  Fstudy:=v;
End;

function TMedicalEntity.Get_relevantSpecialty:IMedicalSpecialty;
Begin
   result:=FrelevantSpecialty;
End;

procedure TMedicalEntity.Set_relevantSpecialty(v:IMedicalSpecialty);
Begin
  FrelevantSpecialty:=v;
End;



{*** TMedicalCode ***}

function TMedicalCode.Get_codingSystem:String;
Begin
   result:=FcodingSystem;
End;

procedure TMedicalCode.Set_codingSystem(v:String);
Begin
  FcodingSystem:=v;
End;

function TMedicalCode.Get_codeValue:String;
Begin
   result:=FcodeValue;
End;

procedure TMedicalCode.Set_codeValue(v:String);
Begin
  FcodeValue:=v;
End;



{*** TMedicalGuideline ***}

function TMedicalGuideline.Get_evidenceOrigin:String;
Begin
   result:=FevidenceOrigin;
End;

procedure TMedicalGuideline.Set_evidenceOrigin(v:String);
Begin
  FevidenceOrigin:=v;
End;

function TMedicalGuideline.Get_guidelineSubject:IMedicalEntity;
Begin
   result:=FguidelineSubject;
End;

procedure TMedicalGuideline.Set_guidelineSubject(v:IMedicalEntity);
Begin
  FguidelineSubject:=v;
End;

function TMedicalGuideline.Get_guidelineDate:TDateTime;
Begin
   result:=FguidelineDate;
End;

procedure TMedicalGuideline.Set_guidelineDate(v:TDateTime);
Begin
  FguidelineDate:=v;
End;

function TMedicalGuideline.Get_evidenceLevel:IMedicalEvidenceLevel;
Begin
   result:=FevidenceLevel;
End;

procedure TMedicalGuideline.Set_evidenceLevel(v:IMedicalEvidenceLevel);
Begin
  FevidenceLevel:=v;
End;



{*** TMedicalEnumeration ***}

  function TMedicalEnumeration.TangMedicalEnumeration:TangibleValue;
Begin
  result:=''
End;



{*** TMedicalEvidenceLevel ***}

  function TMedicalEvidenceLevel.TangMedicalEvidenceLevel:TangibleValue;
Begin
  result:=''
End;



{*** TMedicineSystem ***}

  function TMedicineSystem.TangMedicineSystem:TangibleValue;
Begin
  result:=''
End;



{*** TMedicalStudy ***}

function TMedicalStudy.Get_healthCondition:IMedicalCondition;
Begin
   result:=FhealthCondition;
End;

procedure TMedicalStudy.Set_healthCondition(v:IMedicalCondition);
Begin
  FhealthCondition:=v;
End;

function TMedicalStudy.Get_population:String;
Begin
   result:=Fpopulation;
End;

procedure TMedicalStudy.Set_population(v:String);
Begin
  Fpopulation:=v;
End;

function TMedicalStudy.Get_studySubject:IMedicalEntity;
Begin
   result:=FstudySubject;
End;

procedure TMedicalStudy.Set_studySubject(v:IMedicalEntity);
Begin
  FstudySubject:=v;
End;

function TMedicalStudy.Get_studyLocation:IAdministrativeArea;
Begin
   result:=FstudyLocation;
End;

procedure TMedicalStudy.Set_studyLocation(v:IAdministrativeArea);
Begin
  FstudyLocation:=v;
End;



{*** TMedicalCondition ***}

function TMedicalCondition.Get_primaryPrevention:IMedicalTherapy;
Begin
   result:=FprimaryPrevention;
End;

procedure TMedicalCondition.Set_primaryPrevention(v:IMedicalTherapy);
Begin
  FprimaryPrevention:=v;
End;

function TMedicalCondition.Get_typicalTest:IMedicalTest;
Begin
   result:=FtypicalTest;
End;

procedure TMedicalCondition.Set_typicalTest(v:IMedicalTest);
Begin
  FtypicalTest:=v;
End;

function TMedicalCondition.Get_cause:IMedicalCause;
Begin
   result:=Fcause;
End;

procedure TMedicalCondition.Set_cause(v:IMedicalCause);
Begin
  Fcause:=v;
End;

function TMedicalCondition.Get_status:IMedicalStudyStatus;
Begin
   result:=Fstatus;
End;

procedure TMedicalCondition.Set_status(v:IMedicalStudyStatus);
Begin
  Fstatus:=v;
End;

function TMedicalCondition.Get_subtype:String;
Begin
   result:=Fsubtype;
End;

procedure TMedicalCondition.Set_subtype(v:String);
Begin
  Fsubtype:=v;
End;

function TMedicalCondition.Get_expectedPrognosis:String;
Begin
   result:=FexpectedPrognosis;
End;

procedure TMedicalCondition.Set_expectedPrognosis(v:String);
Begin
  FexpectedPrognosis:=v;
End;

function TMedicalCondition.Get_possibleComplication:String;
Begin
   result:=FpossibleComplication;
End;

procedure TMedicalCondition.Set_possibleComplication(v:String);
Begin
  FpossibleComplication:=v;
End;

function TMedicalCondition.Get_associatedAnatomy:IAnatomicalStructure;
Begin
   result:=FassociatedAnatomy;
End;

procedure TMedicalCondition.Set_associatedAnatomy(v:IAnatomicalStructure);
Begin
  FassociatedAnatomy:=v;
End;

function TMedicalCondition.Get_pathophysiology:String;
Begin
   result:=Fpathophysiology;
End;

procedure TMedicalCondition.Set_pathophysiology(v:String);
Begin
  Fpathophysiology:=v;
End;

function TMedicalCondition.Get_riskFactor:IMedicalRiskFactor;
Begin
   result:=FriskFactor;
End;

procedure TMedicalCondition.Set_riskFactor(v:IMedicalRiskFactor);
Begin
  FriskFactor:=v;
End;

function TMedicalCondition.Get_signOrSymptom:IMedicalSignOrSymptom;
Begin
   result:=FsignOrSymptom;
End;

procedure TMedicalCondition.Set_signOrSymptom(v:IMedicalSignOrSymptom);
Begin
  FsignOrSymptom:=v;
End;

function TMedicalCondition.Get_differentialDiagnosis:IDDxElement;
Begin
   result:=FdifferentialDiagnosis;
End;

procedure TMedicalCondition.Set_differentialDiagnosis(v:IDDxElement);
Begin
  FdifferentialDiagnosis:=v;
End;

function TMedicalCondition.Get_stage:IMedicalConditionStage;
Begin
   result:=Fstage;
End;

procedure TMedicalCondition.Set_stage(v:IMedicalConditionStage);
Begin
  Fstage:=v;
End;

function TMedicalCondition.Get_naturalProgression:String;
Begin
   result:=FnaturalProgression;
End;

procedure TMedicalCondition.Set_naturalProgression(v:String);
Begin
  FnaturalProgression:=v;
End;

function TMedicalCondition.Get_possibleTreatment:IMedicalTherapy;
Begin
   result:=FpossibleTreatment;
End;

procedure TMedicalCondition.Set_possibleTreatment(v:IMedicalTherapy);
Begin
  FpossibleTreatment:=v;
End;

function TMedicalCondition.Get_secondaryPrevention:IMedicalTherapy;
Begin
   result:=FsecondaryPrevention;
End;

procedure TMedicalCondition.Set_secondaryPrevention(v:IMedicalTherapy);
Begin
  FsecondaryPrevention:=v;
End;



{*** TMedicalProcedure ***}

function TMedicalProcedure.Get_followup:String;
Begin
   result:=Ffollowup;
End;

procedure TMedicalProcedure.Set_followup(v:String);
Begin
  Ffollowup:=v;
End;

function TMedicalProcedure.Get_preparation:IMedicalEntity;
Begin
   result:=Fpreparation;
End;

procedure TMedicalProcedure.Set_preparation(v:IMedicalEntity);
Begin
  Fpreparation:=v;
End;

function TMedicalProcedure.Get_howPerformed:String;
Begin
   result:=FhowPerformed;
End;

procedure TMedicalProcedure.Set_howPerformed(v:String);
Begin
  FhowPerformed:=v;
End;

function TMedicalProcedure.Get_indication:IMedicalIndication;
Begin
   result:=Findication;
End;

procedure TMedicalProcedure.Set_indication(v:IMedicalIndication);
Begin
  Findication:=v;
End;

function TMedicalProcedure.Get_procedureType:IMedicalProcedureType;
Begin
   result:=FprocedureType;
End;

procedure TMedicalProcedure.Set_procedureType(v:IMedicalProcedureType);
Begin
  FprocedureType:=v;
End;

function TMedicalProcedure.Get_bodyLocation:String;
Begin
   result:=FbodyLocation;
End;

procedure TMedicalProcedure.Set_bodyLocation(v:String);
Begin
  FbodyLocation:=v;
End;

function TMedicalProcedure.Get_outcome:IMedicalEntity;
Begin
   result:=Foutcome;
End;

procedure TMedicalProcedure.Set_outcome(v:IMedicalEntity);
Begin
  Foutcome:=v;
End;



{*** TMedicalProcedureType ***}

  function TMedicalProcedureType.TangMedicalProcedureType:TangibleValue;
Begin
  result:=''
End;



{*** TMedicalTherapy ***}

function TMedicalTherapy.Get_seriousAdverseOutcome:IMedicalEntity;
Begin
   result:=FseriousAdverseOutcome;
End;

procedure TMedicalTherapy.Set_seriousAdverseOutcome(v:IMedicalEntity);
Begin
  FseriousAdverseOutcome:=v;
End;

function TMedicalTherapy.Get_duplicateTherapy:IMedicalTherapy;
Begin
   result:=FduplicateTherapy;
End;

procedure TMedicalTherapy.Set_duplicateTherapy(v:IMedicalTherapy);
Begin
  FduplicateTherapy:=v;
End;



{*** TMedicalTest ***}

function TMedicalTest.Get_usesDevice:IMedicalDevice;
Begin
   result:=FusesDevice;
End;

procedure TMedicalTest.Set_usesDevice(v:IMedicalDevice);
Begin
  FusesDevice:=v;
End;

function TMedicalTest.Get_affectedBy:IDrug;
Begin
   result:=FaffectedBy;
End;

procedure TMedicalTest.Set_affectedBy(v:IDrug);
Begin
  FaffectedBy:=v;
End;

function TMedicalTest.Get_normalRange:IMedicalEnumeration;
Begin
   result:=FnormalRange;
End;

procedure TMedicalTest.Set_normalRange(v:IMedicalEnumeration);
Begin
  FnormalRange:=v;
End;

function TMedicalTest.Get_signDetected:IMedicalSign;
Begin
   result:=FsignDetected;
End;

procedure TMedicalTest.Set_signDetected(v:IMedicalSign);
Begin
  FsignDetected:=v;
End;

function TMedicalTest.Get_usedToDiagnose:IMedicalCondition;
Begin
   result:=FusedToDiagnose;
End;

procedure TMedicalTest.Set_usedToDiagnose(v:IMedicalCondition);
Begin
  FusedToDiagnose:=v;
End;



{*** TMedicalDevice ***}

function TMedicalDevice.Get_preOp:String;
Begin
   result:=FpreOp;
End;

procedure TMedicalDevice.Set_preOp(v:String);
Begin
  FpreOp:=v;
End;

function TMedicalDevice.Get_postOp:String;
Begin
   result:=FpostOp;
End;

procedure TMedicalDevice.Set_postOp(v:String);
Begin
  FpostOp:=v;
End;

function TMedicalDevice.Get_purpose:IThing;
Begin
   result:=Fpurpose;
End;

procedure TMedicalDevice.Set_purpose(v:IThing);
Begin
  Fpurpose:=v;
End;

function TMedicalDevice.Get_adverseOutcome:IMedicalEntity;
Begin
   result:=FadverseOutcome;
End;

procedure TMedicalDevice.Set_adverseOutcome(v:IMedicalEntity);
Begin
  FadverseOutcome:=v;
End;

function TMedicalDevice.Get_contraindication:IMedicalContraindication;
Begin
   result:=Fcontraindication;
End;

procedure TMedicalDevice.Set_contraindication(v:IMedicalContraindication);
Begin
  Fcontraindication:=v;
End;

function TMedicalDevice.Get__procedure:String;
Begin
   result:=F_procedure;
End;

procedure TMedicalDevice.Set__procedure(v:String);
Begin
  F_procedure:=v;
End;



{*** TSubstance ***}

function TSubstance.Get_maximumIntake:IMaximumDoseSchedule;
Begin
   result:=FmaximumIntake;
End;

procedure TSubstance.Set_maximumIntake(v:IMaximumDoseSchedule);
Begin
  FmaximumIntake:=v;
End;



{*** TDoseSchedule ***}

function TDoseSchedule.Get_doseUnit:String;
Begin
   result:=FdoseUnit;
End;

procedure TDoseSchedule.Set_doseUnit(v:String);
Begin
  FdoseUnit:=v;
End;

function TDoseSchedule.Get_doseValue:IQualitativeValue;
Begin
   result:=FdoseValue;
End;

procedure TDoseSchedule.Set_doseValue(v:IQualitativeValue);
Begin
  FdoseValue:=v;
End;

function TDoseSchedule.Get_frequency:String;
Begin
   result:=Ffrequency;
End;

procedure TDoseSchedule.Set_frequency(v:String);
Begin
  Ffrequency:=v;
End;



{*** TQualitativeValue ***}

function TQualitativeValue.Get_lesser:IQualitativeValue;
Begin
   result:=Flesser;
End;

procedure TQualitativeValue.Set_lesser(v:IQualitativeValue);
Begin
  Flesser:=v;
End;

function TQualitativeValue.Get_nonEqual:IQualitativeValue;
Begin
   result:=FnonEqual;
End;

procedure TQualitativeValue.Set_nonEqual(v:IQualitativeValue);
Begin
  FnonEqual:=v;
End;

function TQualitativeValue.Get_lesserOrEqual:IQualitativeValue;
Begin
   result:=FlesserOrEqual;
End;

procedure TQualitativeValue.Set_lesserOrEqual(v:IQualitativeValue);
Begin
  FlesserOrEqual:=v;
End;

function TQualitativeValue.Get_greater:IQualitativeValue;
Begin
   result:=Fgreater;
End;

procedure TQualitativeValue.Set_greater(v:IQualitativeValue);
Begin
  Fgreater:=v;
End;

function TQualitativeValue.Get_additionalProperty:IPropertyValue;
Begin
   result:=FadditionalProperty;
End;

procedure TQualitativeValue.Set_additionalProperty(v:IPropertyValue);
Begin
  FadditionalProperty:=v;
End;

function TQualitativeValue.Get_equal:IQualitativeValue;
Begin
   result:=Fequal;
End;

procedure TQualitativeValue.Set_equal(v:IQualitativeValue);
Begin
  Fequal:=v;
End;

function TQualitativeValue.Get_greaterOrEqual:IQualitativeValue;
Begin
   result:=FgreaterOrEqual;
End;

procedure TQualitativeValue.Set_greaterOrEqual(v:IQualitativeValue);
Begin
  FgreaterOrEqual:=v;
End;



{*** TPropertyValue ***}

function TPropertyValue.Get_minValue:INumber;
Begin
   result:=FminValue;
End;

procedure TPropertyValue.Set_minValue(v:INumber);
Begin
  FminValue:=v;
End;

function TPropertyValue.Get_propertyID:String;
Begin
   result:=FpropertyID;
End;

procedure TPropertyValue.Set_propertyID(v:String);
Begin
  FpropertyID:=v;
End;



{*** TDrug ***}

function TDrug.Get_warning:String;
Begin
   result:=Fwarning;
End;

procedure TDrug.Set_warning(v:String);
Begin
  Fwarning:=v;
End;

function TDrug.Get_includedInHealthInsurancePlan:IHealthInsurancePlan;
Begin
   result:=FincludedInHealthInsurancePlan;
End;

procedure TDrug.Set_includedInHealthInsurancePlan(v:IHealthInsurancePlan);
Begin
  FincludedInHealthInsurancePlan:=v;
End;

function TDrug.Get_proprietaryName:String;
Begin
   result:=FproprietaryName;
End;

procedure TDrug.Set_proprietaryName(v:String);
Begin
  FproprietaryName:=v;
End;

function TDrug.Get_cost:IDrugCost;
Begin
   result:=Fcost;
End;

procedure TDrug.Set_cost(v:IDrugCost);
Begin
  Fcost:=v;
End;

function TDrug.Get_drugUnit:String;
Begin
   result:=FdrugUnit;
End;

procedure TDrug.Set_drugUnit(v:String);
Begin
  FdrugUnit:=v;
End;

function TDrug.Get_pregnancyCategory:IDrugPregnancyCategory;
Begin
   result:=FpregnancyCategory;
End;

procedure TDrug.Set_pregnancyCategory(v:IDrugPregnancyCategory);
Begin
  FpregnancyCategory:=v;
End;

function TDrug.Get_doseSchedule:IDoseSchedule;
Begin
   result:=FdoseSchedule;
End;

procedure TDrug.Set_doseSchedule(v:IDoseSchedule);
Begin
  FdoseSchedule:=v;
End;

function TDrug.Get_dosageForm:String;
Begin
   result:=FdosageForm;
End;

procedure TDrug.Set_dosageForm(v:String);
Begin
  FdosageForm:=v;
End;

function TDrug.Get_prescribingInfo:String;
Begin
   result:=FprescribingInfo;
End;

procedure TDrug.Set_prescribingInfo(v:String);
Begin
  FprescribingInfo:=v;
End;

function TDrug.Get_prescriptionStatus:IDrugPrescriptionStatus;
Begin
   result:=FprescriptionStatus;
End;

procedure TDrug.Set_prescriptionStatus(v:IDrugPrescriptionStatus);
Begin
  FprescriptionStatus:=v;
End;

function TDrug.Get_rxcui:String;
Begin
   result:=Frxcui;
End;

procedure TDrug.Set_rxcui(v:String);
Begin
  Frxcui:=v;
End;

function TDrug.Get_pregnancyWarning:String;
Begin
   result:=FpregnancyWarning;
End;

procedure TDrug.Set_pregnancyWarning(v:String);
Begin
  FpregnancyWarning:=v;
End;

function TDrug.Get_availableStrength:IDrugStrength;
Begin
   result:=FavailableStrength;
End;

procedure TDrug.Set_availableStrength(v:IDrugStrength);
Begin
  FavailableStrength:=v;
End;

function TDrug.Get_clincalPharmacology:String;
Begin
   result:=FclincalPharmacology;
End;

procedure TDrug.Set_clincalPharmacology(v:String);
Begin
  FclincalPharmacology:=v;
End;

function TDrug.Get_relatedDrug:IDrug;
Begin
   result:=FrelatedDrug;
End;

procedure TDrug.Set_relatedDrug(v:IDrug);
Begin
  FrelatedDrug:=v;
End;

function TDrug.Get_drugClass:IDrugClass;
Begin
   result:=FdrugClass;
End;

procedure TDrug.Set_drugClass(v:IDrugClass);
Begin
  FdrugClass:=v;
End;

function TDrug.Get_administrationRoute:String;
Begin
   result:=FadministrationRoute;
End;

procedure TDrug.Set_administrationRoute(v:String);
Begin
  FadministrationRoute:=v;
End;

function TDrug.Get_breastfeedingWarning:String;
Begin
   result:=FbreastfeedingWarning;
End;

procedure TDrug.Set_breastfeedingWarning(v:String);
Begin
  FbreastfeedingWarning:=v;
End;

function TDrug.Get_interactingDrug:IDrug;
Begin
   result:=FinteractingDrug;
End;

procedure TDrug.Set_interactingDrug(v:IDrug);
Begin
  FinteractingDrug:=v;
End;

function TDrug.Get_foodWarning:String;
Begin
   result:=FfoodWarning;
End;

procedure TDrug.Set_foodWarning(v:String);
Begin
  FfoodWarning:=v;
End;

function TDrug.Get_alcoholWarning:String;
Begin
   result:=FalcoholWarning;
End;

procedure TDrug.Set_alcoholWarning(v:String);
Begin
  FalcoholWarning:=v;
End;

function TDrug.Get_labelDetails:String;
Begin
   result:=FlabelDetails;
End;

procedure TDrug.Set_labelDetails(v:String);
Begin
  FlabelDetails:=v;
End;

function TDrug.Get_overdosage:String;
Begin
   result:=Foverdosage;
End;

procedure TDrug.Set_overdosage(v:String);
Begin
  Foverdosage:=v;
End;

function TDrug.Get_isAvailableGenerically:Boolean;
Begin
   result:=FisAvailableGenerically;
End;

procedure TDrug.Set_isAvailableGenerically(v:Boolean);
Begin
  FisAvailableGenerically:=v;
End;



{*** THealthInsurancePlan ***}

function THealthInsurancePlan.Get_includesHealthPlanNetwork:IHealthPlanNetwork;
Begin
   result:=FincludesHealthPlanNetwork;
End;

procedure THealthInsurancePlan.Set_includesHealthPlanNetwork(v:IHealthPlanNetwork);
Begin
  FincludesHealthPlanNetwork:=v;
End;

function THealthInsurancePlan.Get_healthPlanId:String;
Begin
   result:=FhealthPlanId;
End;

procedure THealthInsurancePlan.Set_healthPlanId(v:String);
Begin
  FhealthPlanId:=v;
End;

function THealthInsurancePlan.Get_healthPlanDrugTier:String;
Begin
   result:=FhealthPlanDrugTier;
End;

procedure THealthInsurancePlan.Set_healthPlanDrugTier(v:String);
Begin
  FhealthPlanDrugTier:=v;
End;

function THealthInsurancePlan.Get_healthPlanMarketingUrl:String;
Begin
   result:=FhealthPlanMarketingUrl;
End;

procedure THealthInsurancePlan.Set_healthPlanMarketingUrl(v:String);
Begin
  FhealthPlanMarketingUrl:=v;
End;

function THealthInsurancePlan.Get_usesHealthPlanIdStandard:String;
Begin
   result:=FusesHealthPlanIdStandard;
End;

procedure THealthInsurancePlan.Set_usesHealthPlanIdStandard(v:String);
Begin
  FusesHealthPlanIdStandard:=v;
End;

function THealthInsurancePlan.Get_healthPlanDrugOption:String;
Begin
   result:=FhealthPlanDrugOption;
End;

procedure THealthInsurancePlan.Set_healthPlanDrugOption(v:String);
Begin
  FhealthPlanDrugOption:=v;
End;

function THealthInsurancePlan.Get_includesHealthPlanFormulary:IHealthPlanFormulary;
Begin
   result:=FincludesHealthPlanFormulary;
End;

procedure THealthInsurancePlan.Set_includesHealthPlanFormulary(v:IHealthPlanFormulary);
Begin
  FincludesHealthPlanFormulary:=v;
End;

function THealthInsurancePlan.Get_benefitsSummaryUrl:String;
Begin
   result:=FbenefitsSummaryUrl;
End;

procedure THealthInsurancePlan.Set_benefitsSummaryUrl(v:String);
Begin
  FbenefitsSummaryUrl:=v;
End;



{*** THealthPlanNetwork ***}

function THealthPlanNetwork.Get_healthPlanNetworkTier:String;
Begin
   result:=FhealthPlanNetworkTier;
End;

procedure THealthPlanNetwork.Set_healthPlanNetworkTier(v:String);
Begin
  FhealthPlanNetworkTier:=v;
End;

function THealthPlanNetwork.Get_healthPlanCostSharing:Boolean;
Begin
   result:=FhealthPlanCostSharing;
End;

procedure THealthPlanNetwork.Set_healthPlanCostSharing(v:Boolean);
Begin
  FhealthPlanCostSharing:=v;
End;



{*** THealthPlanFormulary ***}

function THealthPlanFormulary.Get_offersPrescriptionByMail:Boolean;
Begin
   result:=FoffersPrescriptionByMail;
End;

procedure THealthPlanFormulary.Set_offersPrescriptionByMail(v:Boolean);
Begin
  FoffersPrescriptionByMail:=v;
End;



{*** TDrugCost ***}

function TDrugCost.Get_costPerUnit:IQualitativeValue;
Begin
   result:=FcostPerUnit;
End;

procedure TDrugCost.Set_costPerUnit(v:IQualitativeValue);
Begin
  FcostPerUnit:=v;
End;

function TDrugCost.Get_applicableLocation:IAdministrativeArea;
Begin
   result:=FapplicableLocation;
End;

procedure TDrugCost.Set_applicableLocation(v:IAdministrativeArea);
Begin
  FapplicableLocation:=v;
End;

function TDrugCost.Get_costCategory:IDrugCostCategory;
Begin
   result:=FcostCategory;
End;

procedure TDrugCost.Set_costCategory(v:IDrugCostCategory);
Begin
  FcostCategory:=v;
End;

function TDrugCost.Get_costCurrency:String;
Begin
   result:=FcostCurrency;
End;

procedure TDrugCost.Set_costCurrency(v:String);
Begin
  FcostCurrency:=v;
End;

function TDrugCost.Get_costOrigin:String;
Begin
   result:=FcostOrigin;
End;

procedure TDrugCost.Set_costOrigin(v:String);
Begin
  FcostOrigin:=v;
End;



{*** TDrugCostCategory ***}

  function TDrugCostCategory.TangDrugCostCategory:TangibleValue;
Begin
  result:=''
End;



{*** TDrugPregnancyCategory ***}

  function TDrugPregnancyCategory.TangDrugPregnancyCategory:TangibleValue;
Begin
  result:=''
End;



{*** TDrugPrescriptionStatus ***}

  function TDrugPrescriptionStatus.TangDrugPrescriptionStatus:TangibleValue;
Begin
  result:=''
End;



{*** TDrugStrength ***}

function TDrugStrength.Get_strengthUnit:String;
Begin
   result:=FstrengthUnit;
End;

procedure TDrugStrength.Set_strengthUnit(v:String);
Begin
  FstrengthUnit:=v;
End;

function TDrugStrength.Get_activeIngredient:String;
Begin
   result:=FactiveIngredient;
End;

procedure TDrugStrength.Set_activeIngredient(v:String);
Begin
  FactiveIngredient:=v;
End;

function TDrugStrength.Get_availableIn:IAdministrativeArea;
Begin
   result:=FavailableIn;
End;

procedure TDrugStrength.Set_availableIn(v:IAdministrativeArea);
Begin
  FavailableIn:=v;
End;

function TDrugStrength.Get_strengthValue:INumber;
Begin
   result:=FstrengthValue;
End;

procedure TDrugStrength.Set_strengthValue(v:INumber);
Begin
  FstrengthValue:=v;
End;



{*** TDrugClass ***}

function TDrugClass.Get_drug:IDrug;
Begin
   result:=Fdrug;
End;

procedure TDrugClass.Set_drug(v:IDrug);
Begin
  Fdrug:=v;
End;



{*** TMedicalSign ***}

function TMedicalSign.Get_identifyingTest:IMedicalTest;
Begin
   result:=FidentifyingTest;
End;

procedure TMedicalSign.Set_identifyingTest(v:IMedicalTest);
Begin
  FidentifyingTest:=v;
End;

function TMedicalSign.Get_identifyingExam:IPhysicalExam;
Begin
   result:=FidentifyingExam;
End;

procedure TMedicalSign.Set_identifyingExam(v:IPhysicalExam);
Begin
  FidentifyingExam:=v;
End;



{*** TPhysicalExam ***}

  function TPhysicalExam.TangPhysicalExam:TangibleValue;
Begin
  result:=''
End;



{*** TMedicalCause ***}

function TMedicalCause.Get_causeOf:IMedicalEntity;
Begin
   result:=FcauseOf;
End;

procedure TMedicalCause.Set_causeOf(v:IMedicalEntity);
Begin
  FcauseOf:=v;
End;



{*** TMedicalStudyStatus ***}

  function TMedicalStudyStatus.TangMedicalStudyStatus:TangibleValue;
Begin
  result:=''
End;



{*** TAnatomicalStructure ***}

function TAnatomicalStructure.Get_relatedTherapy:IMedicalTherapy;
Begin
   result:=FrelatedTherapy;
End;

procedure TAnatomicalStructure.Set_relatedTherapy(v:IMedicalTherapy);
Begin
  FrelatedTherapy:=v;
End;

function TAnatomicalStructure.Get__function:String;
Begin
   result:=F_function;
End;

procedure TAnatomicalStructure.Set__function(v:String);
Begin
  F_function:=v;
End;

function TAnatomicalStructure.Get_connectedTo:IAnatomicalStructure;
Begin
   result:=FconnectedTo;
End;

procedure TAnatomicalStructure.Set_connectedTo(v:IAnatomicalStructure);
Begin
  FconnectedTo:=v;
End;

function TAnatomicalStructure.Get_diagram:IImageObject;
Begin
   result:=Fdiagram;
End;

procedure TAnatomicalStructure.Set_diagram(v:IImageObject);
Begin
  Fdiagram:=v;
End;

function TAnatomicalStructure.Get_partOfSystem:IAnatomicalSystem;
Begin
   result:=FpartOfSystem;
End;

procedure TAnatomicalStructure.Set_partOfSystem(v:IAnatomicalSystem);
Begin
  FpartOfSystem:=v;
End;

function TAnatomicalStructure.Get_subStructure:IAnatomicalStructure;
Begin
   result:=FsubStructure;
End;

procedure TAnatomicalStructure.Set_subStructure(v:IAnatomicalStructure);
Begin
  FsubStructure:=v;
End;



{*** TAnatomicalSystem ***}

function TAnatomicalSystem.Get_comprisedOf:IAnatomicalStructure;
Begin
   result:=FcomprisedOf;
End;

procedure TAnatomicalSystem.Set_comprisedOf(v:IAnatomicalStructure);
Begin
  FcomprisedOf:=v;
End;

function TAnatomicalSystem.Get_associatedPathophysiology:String;
Begin
   result:=FassociatedPathophysiology;
End;

procedure TAnatomicalSystem.Set_associatedPathophysiology(v:String);
Begin
  FassociatedPathophysiology:=v;
End;

function TAnatomicalSystem.Get_relatedCondition:IMedicalCondition;
Begin
   result:=FrelatedCondition;
End;

procedure TAnatomicalSystem.Set_relatedCondition(v:IMedicalCondition);
Begin
  FrelatedCondition:=v;
End;

function TAnatomicalSystem.Get_relatedStructure:IAnatomicalStructure;
Begin
   result:=FrelatedStructure;
End;

procedure TAnatomicalSystem.Set_relatedStructure(v:IAnatomicalStructure);
Begin
  FrelatedStructure:=v;
End;



{*** TMedicalRiskFactor ***}

function TMedicalRiskFactor.Get_increasesRiskOf:IMedicalEntity;
Begin
   result:=FincreasesRiskOf;
End;

procedure TMedicalRiskFactor.Set_increasesRiskOf(v:IMedicalEntity);
Begin
  FincreasesRiskOf:=v;
End;



{*** TDDxElement ***}

function TDDxElement.Get_diagnosis:IMedicalCondition;
Begin
   result:=Fdiagnosis;
End;

procedure TDDxElement.Set_diagnosis(v:IMedicalCondition);
Begin
  Fdiagnosis:=v;
End;

function TDDxElement.Get_distinguishingSign:IMedicalSignOrSymptom;
Begin
   result:=FdistinguishingSign;
End;

procedure TDDxElement.Set_distinguishingSign(v:IMedicalSignOrSymptom);
Begin
  FdistinguishingSign:=v;
End;



{*** TMedicalConditionStage ***}

function TMedicalConditionStage.Get_stageAsNumber:INumber;
Begin
   result:=FstageAsNumber;
End;

procedure TMedicalConditionStage.Set_stageAsNumber(v:INumber);
Begin
  FstageAsNumber:=v;
End;

function TMedicalConditionStage.Get_subStageSuffix:String;
Begin
   result:=FsubStageSuffix;
End;

procedure TMedicalConditionStage.Set_subStageSuffix(v:String);
Begin
  FsubStageSuffix:=v;
End;



{*** TSpecialty ***}

  function TSpecialty.TangSpecialty:TangibleValue;
Begin
  result:=''
End;



{*** TMedicalSpecialty ***}

  function TMedicalSpecialty.TangMedicalSpecialty:TangibleValue;
Begin
  result:=''
End;



{*** TClip ***}

function TClip.Get_partOfEpisode:IEpisode;
Begin
   result:=FpartOfEpisode;
End;

procedure TClip.Set_partOfEpisode(v:IEpisode);
Begin
  FpartOfEpisode:=v;
End;

function TClip.Get_clipNumber:String;
Begin
   result:=FclipNumber;
End;

procedure TClip.Set_clipNumber(v:String);
Begin
  FclipNumber:=v;
End;

function TClip.Get_partOfSeason:ICreativeWorkSeason;
Begin
   result:=FpartOfSeason;
End;

procedure TClip.Set_partOfSeason(v:ICreativeWorkSeason);
Begin
  FpartOfSeason:=v;
End;

function TClip.Get_directors:IPerson;
Begin
   result:=Fdirectors;
End;

procedure TClip.Set_directors(v:IPerson);
Begin
  Fdirectors:=v;
End;



{*** TCreativeWorkSeason ***}

function TCreativeWorkSeason.Get_episodes:IEpisode;
Begin
   result:=Fepisodes;
End;

procedure TCreativeWorkSeason.Set_episodes(v:IEpisode);
Begin
  Fepisodes:=v;
End;

function TCreativeWorkSeason.Get_seasonNumber:Integer;
Begin
   result:=FseasonNumber;
End;

procedure TCreativeWorkSeason.Set_seasonNumber(v:Integer);
Begin
  FseasonNumber:=v;
End;



{*** TConsumeAction ***}

function TConsumeAction.Get_expectsAcceptanceOf:IOffer;
Begin
   result:=FexpectsAcceptanceOf;
End;

procedure TConsumeAction.Set_expectsAcceptanceOf(v:IOffer);
Begin
  FexpectsAcceptanceOf:=v;
End;



{*** TMoveAction ***}

function TMoveAction.Get_toLocation:IPlace;
Begin
   result:=FtoLocation;
End;

procedure TMoveAction.Set_toLocation(v:IPlace);
Begin
  FtoLocation:=v;
End;



{*** TTelevisionChannel ***}

  function TTelevisionChannel.TangTelevisionChannel:TangibleValue;
Begin
  result:=''
End;



{*** TLodgingBusiness ***}

function TLodgingBusiness.Get_petsAllowed:Boolean;
Begin
   result:=FpetsAllowed;
End;

procedure TLodgingBusiness.Set_petsAllowed(v:Boolean);
Begin
  FpetsAllowed:=v;
End;

function TLodgingBusiness.Get_checkoutTime:TDateTime;
Begin
   result:=FcheckoutTime;
End;

procedure TLodgingBusiness.Set_checkoutTime(v:TDateTime);
Begin
  FcheckoutTime:=v;
End;

function TLodgingBusiness.Get_checkinTime:TDateTime;
Begin
   result:=FcheckinTime;
End;

procedure TLodgingBusiness.Set_checkinTime(v:TDateTime);
Begin
  FcheckinTime:=v;
End;

function TLodgingBusiness.Get_starRating:IRating;
Begin
   result:=FstarRating;
End;

procedure TLodgingBusiness.Set_starRating(v:IRating);
Begin
  FstarRating:=v;
End;



{*** TReservation ***}

function TReservation.Get_totalPrice:String;
Begin
   result:=FtotalPrice;
End;

procedure TReservation.Set_totalPrice(v:String);
Begin
  FtotalPrice:=v;
End;

function TReservation.Get_reservationId:String;
Begin
   result:=FreservationId;
End;

procedure TReservation.Set_reservationId(v:String);
Begin
  FreservationId:=v;
End;

function TReservation.Get_modifiedTime:TDateTime;
Begin
   result:=FmodifiedTime;
End;

procedure TReservation.Set_modifiedTime(v:TDateTime);
Begin
  FmodifiedTime:=v;
End;

function TReservation.Get_programMembershipUsed:IProgramMembership;
Begin
   result:=FprogramMembershipUsed;
End;

procedure TReservation.Set_programMembershipUsed(v:IProgramMembership);
Begin
  FprogramMembershipUsed:=v;
End;

function TReservation.Get_bookingTime:TDateTime;
Begin
   result:=FbookingTime;
End;

procedure TReservation.Set_bookingTime(v:TDateTime);
Begin
  FbookingTime:=v;
End;

function TReservation.Get_reservedTicket:ITicket;
Begin
   result:=FreservedTicket;
End;

procedure TReservation.Set_reservedTicket(v:ITicket);
Begin
  FreservedTicket:=v;
End;

function TReservation.Get_reservationFor:IThing;
Begin
   result:=FreservationFor;
End;

procedure TReservation.Set_reservationFor(v:IThing);
Begin
  FreservationFor:=v;
End;

function TReservation.Get_bookingAgent:IOrganization;
Begin
   result:=FbookingAgent;
End;

procedure TReservation.Set_bookingAgent(v:IOrganization);
Begin
  FbookingAgent:=v;
End;

function TReservation.Get_reservationStatus:IReservationStatusType;
Begin
   result:=FreservationStatus;
End;

procedure TReservation.Set_reservationStatus(v:IReservationStatusType);
Begin
  FreservationStatus:=v;
End;



{*** TProgramMembership ***}

function TProgramMembership.Get_hostingOrganization:IOrganization;
Begin
   result:=FhostingOrganization;
End;

procedure TProgramMembership.Set_hostingOrganization(v:IOrganization);
Begin
  FhostingOrganization:=v;
End;

function TProgramMembership.Get_programName:String;
Begin
   result:=FprogramName;
End;

procedure TProgramMembership.Set_programName(v:String);
Begin
  FprogramName:=v;
End;

function TProgramMembership.Get_membershipNumber:String;
Begin
   result:=FmembershipNumber;
End;

procedure TProgramMembership.Set_membershipNumber(v:String);
Begin
  FmembershipNumber:=v;
End;



{*** TTicket ***}

function TTicket.Get_ticketToken:String;
Begin
   result:=FticketToken;
End;

procedure TTicket.Set_ticketToken(v:String);
Begin
  FticketToken:=v;
End;

function TTicket.Get_ticketedSeat:ISeat;
Begin
   result:=FticketedSeat;
End;

procedure TTicket.Set_ticketedSeat(v:ISeat);
Begin
  FticketedSeat:=v;
End;

function TTicket.Get_ticketNumber:String;
Begin
   result:=FticketNumber;
End;

procedure TTicket.Set_ticketNumber(v:String);
Begin
  FticketNumber:=v;
End;

function TTicket.Get_underName:IOrganization;
Begin
   result:=FunderName;
End;

procedure TTicket.Set_underName(v:IOrganization);
Begin
  FunderName:=v;
End;

function TTicket.Get_dateIssued:TDateTime;
Begin
   result:=FdateIssued;
End;

procedure TTicket.Set_dateIssued(v:TDateTime);
Begin
  FdateIssued:=v;
End;



{*** TSeat ***}

function TSeat.Get_seatRow:String;
Begin
   result:=FseatRow;
End;

procedure TSeat.Set_seatRow(v:String);
Begin
  FseatRow:=v;
End;

function TSeat.Get_seatNumber:String;
Begin
   result:=FseatNumber;
End;

procedure TSeat.Set_seatNumber(v:String);
Begin
  FseatNumber:=v;
End;

function TSeat.Get_seatSection:String;
Begin
   result:=FseatSection;
End;

procedure TSeat.Set_seatSection(v:String);
Begin
  FseatSection:=v;
End;

function TSeat.Get_seatingType:IQualitativeValue;
Begin
   result:=FseatingType;
End;

procedure TSeat.Set_seatingType(v:IQualitativeValue);
Begin
  FseatingType:=v;
End;



{*** TReservationStatusType ***}

  function TReservationStatusType.TangReservationStatusType:TangibleValue;
Begin
  result:=''
End;



{*** TBusReservation ***}

  function TBusReservation.TangBusReservation:TangibleValue;
Begin
  result:=''
End;



{*** TTaxi ***}

  function TTaxi.TangTaxi:TangibleValue;
Begin
  result:=''
End;



{*** TVehicle ***}

function TVehicle.Get_numberOfPreviousOwners:INumber;
Begin
   result:=FnumberOfPreviousOwners;
End;

procedure TVehicle.Set_numberOfPreviousOwners(v:INumber);
Begin
  FnumberOfPreviousOwners:=v;
End;

function TVehicle.Get_meetsEmissionStandard:IQualitativeValue;
Begin
   result:=FmeetsEmissionStandard;
End;

procedure TVehicle.Set_meetsEmissionStandard(v:IQualitativeValue);
Begin
  FmeetsEmissionStandard:=v;
End;

function TVehicle.Get_driveWheelConfiguration:IDriveWheelConfigurationValue;
Begin
   result:=FdriveWheelConfiguration;
End;

procedure TVehicle.Set_driveWheelConfiguration(v:IDriveWheelConfigurationValue);
Begin
  FdriveWheelConfiguration:=v;
End;

function TVehicle.Get_fuelConsumption:IQuantitativeValue;
Begin
   result:=FfuelConsumption;
End;

procedure TVehicle.Set_fuelConsumption(v:IQuantitativeValue);
Begin
  FfuelConsumption:=v;
End;

function TVehicle.Get_wheelbase:IQuantitativeValue;
Begin
   result:=Fwheelbase;
End;

procedure TVehicle.Set_wheelbase(v:IQuantitativeValue);
Begin
  Fwheelbase:=v;
End;

function TVehicle.Get_vehicleInteriorType:String;
Begin
   result:=FvehicleInteriorType;
End;

procedure TVehicle.Set_vehicleInteriorType(v:String);
Begin
  FvehicleInteriorType:=v;
End;

function TVehicle.Get_modelDate:TDateTime;
Begin
   result:=FmodelDate;
End;

procedure TVehicle.Set_modelDate(v:TDateTime);
Begin
  FmodelDate:=v;
End;

function TVehicle.Get_knownVehicleDamages:String;
Begin
   result:=FknownVehicleDamages;
End;

procedure TVehicle.Set_knownVehicleDamages(v:String);
Begin
  FknownVehicleDamages:=v;
End;

function TVehicle.Get_bodyType:String;
Begin
   result:=FbodyType;
End;

procedure TVehicle.Set_bodyType(v:String);
Begin
  FbodyType:=v;
End;

function TVehicle.Get_vehicleInteriorColor:String;
Begin
   result:=FvehicleInteriorColor;
End;

procedure TVehicle.Set_vehicleInteriorColor(v:String);
Begin
  FvehicleInteriorColor:=v;
End;

function TVehicle.Get_vehicleSpecialUsage:String;
Begin
   result:=FvehicleSpecialUsage;
End;

procedure TVehicle.Set_vehicleSpecialUsage(v:String);
Begin
  FvehicleSpecialUsage:=v;
End;

function TVehicle.Get_productionDate:TDateTime;
Begin
   result:=FproductionDate;
End;

procedure TVehicle.Set_productionDate(v:TDateTime);
Begin
  FproductionDate:=v;
End;

function TVehicle.Get_mileageFromOdometer:IQuantitativeValue;
Begin
   result:=FmileageFromOdometer;
End;

procedure TVehicle.Set_mileageFromOdometer(v:IQuantitativeValue);
Begin
  FmileageFromOdometer:=v;
End;

function TVehicle.Get_vehicleModelDate:TDateTime;
Begin
   result:=FvehicleModelDate;
End;

procedure TVehicle.Set_vehicleModelDate(v:TDateTime);
Begin
  FvehicleModelDate:=v;
End;

function TVehicle.Get_numberOfAirbags:INumber;
Begin
   result:=FnumberOfAirbags;
End;

procedure TVehicle.Set_numberOfAirbags(v:INumber);
Begin
  FnumberOfAirbags:=v;
End;

function TVehicle.Get_seatingCapacity:IQuantitativeValue;
Begin
   result:=FseatingCapacity;
End;

procedure TVehicle.Set_seatingCapacity(v:IQuantitativeValue);
Begin
  FseatingCapacity:=v;
End;

function TVehicle.Get_steeringPosition:ISteeringPositionValue;
Begin
   result:=FsteeringPosition;
End;

procedure TVehicle.Set_steeringPosition(v:ISteeringPositionValue);
Begin
  FsteeringPosition:=v;
End;

function TVehicle.Get_dateVehicleFirstRegistered:TDateTime;
Begin
   result:=FdateVehicleFirstRegistered;
End;

procedure TVehicle.Set_dateVehicleFirstRegistered(v:TDateTime);
Begin
  FdateVehicleFirstRegistered:=v;
End;

function TVehicle.Get_numberOfDoors:INumber;
Begin
   result:=FnumberOfDoors;
End;

procedure TVehicle.Set_numberOfDoors(v:INumber);
Begin
  FnumberOfDoors:=v;
End;

function TVehicle.Get_weightTotal:IQuantitativeValue;
Begin
   result:=FweightTotal;
End;

procedure TVehicle.Set_weightTotal(v:IQuantitativeValue);
Begin
  FweightTotal:=v;
End;

function TVehicle.Get_numberOfForwardGears:INumber;
Begin
   result:=FnumberOfForwardGears;
End;

procedure TVehicle.Set_numberOfForwardGears(v:INumber);
Begin
  FnumberOfForwardGears:=v;
End;

function TVehicle.Get_tongueWeight:IQuantitativeValue;
Begin
   result:=FtongueWeight;
End;

procedure TVehicle.Set_tongueWeight(v:IQuantitativeValue);
Begin
  FtongueWeight:=v;
End;

function TVehicle.Get_vehicleConfiguration:String;
Begin
   result:=FvehicleConfiguration;
End;

procedure TVehicle.Set_vehicleConfiguration(v:String);
Begin
  FvehicleConfiguration:=v;
End;

function TVehicle.Get_fuelEfficiency:IQuantitativeValue;
Begin
   result:=FfuelEfficiency;
End;

procedure TVehicle.Set_fuelEfficiency(v:IQuantitativeValue);
Begin
  FfuelEfficiency:=v;
End;

function TVehicle.Get_cargoVolume:IQuantitativeValue;
Begin
   result:=FcargoVolume;
End;

procedure TVehicle.Set_cargoVolume(v:IQuantitativeValue);
Begin
  FcargoVolume:=v;
End;

function TVehicle.Get_vehicleTransmission:IQualitativeValue;
Begin
   result:=FvehicleTransmission;
End;

procedure TVehicle.Set_vehicleTransmission(v:IQualitativeValue);
Begin
  FvehicleTransmission:=v;
End;

function TVehicle.Get_vehicleSeatingCapacity:IQuantitativeValue;
Begin
   result:=FvehicleSeatingCapacity;
End;

procedure TVehicle.Set_vehicleSeatingCapacity(v:IQuantitativeValue);
Begin
  FvehicleSeatingCapacity:=v;
End;

function TVehicle.Get_accelerationTime:IQuantitativeValue;
Begin
   result:=FaccelerationTime;
End;

procedure TVehicle.Set_accelerationTime(v:IQuantitativeValue);
Begin
  FaccelerationTime:=v;
End;

function TVehicle.Get_purchaseDate:TDateTime;
Begin
   result:=FpurchaseDate;
End;

procedure TVehicle.Set_purchaseDate(v:TDateTime);
Begin
  FpurchaseDate:=v;
End;

function TVehicle.Get_payload:IQuantitativeValue;
Begin
   result:=Fpayload;
End;

procedure TVehicle.Set_payload(v:IQuantitativeValue);
Begin
  Fpayload:=v;
End;

function TVehicle.Get_fuelCapacity:IQuantitativeValue;
Begin
   result:=FfuelCapacity;
End;

procedure TVehicle.Set_fuelCapacity(v:IQuantitativeValue);
Begin
  FfuelCapacity:=v;
End;

function TVehicle.Get_vehicleEngine:IEngineSpecification;
Begin
   result:=FvehicleEngine;
End;

procedure TVehicle.Set_vehicleEngine(v:IEngineSpecification);
Begin
  FvehicleEngine:=v;
End;

function TVehicle.Get_emissionsCO2:INumber;
Begin
   result:=FemissionsCO2;
End;

procedure TVehicle.Set_emissionsCO2(v:INumber);
Begin
  FemissionsCO2:=v;
End;

function TVehicle.Get_numberOfAxles:INumber;
Begin
   result:=FnumberOfAxles;
End;

procedure TVehicle.Set_numberOfAxles(v:INumber);
Begin
  FnumberOfAxles:=v;
End;

function TVehicle.Get_speed:IQuantitativeValue;
Begin
   result:=Fspeed;
End;

procedure TVehicle.Set_speed(v:IQuantitativeValue);
Begin
  Fspeed:=v;
End;

function TVehicle.Get_vehicleIdentificationNumber:String;
Begin
   result:=FvehicleIdentificationNumber;
End;

procedure TVehicle.Set_vehicleIdentificationNumber(v:String);
Begin
  FvehicleIdentificationNumber:=v;
End;

function TVehicle.Get_trailerWeight:IQuantitativeValue;
Begin
   result:=FtrailerWeight;
End;

procedure TVehicle.Set_trailerWeight(v:IQuantitativeValue);
Begin
  FtrailerWeight:=v;
End;



{*** TDriveWheelConfigurationValue ***}

  function TDriveWheelConfigurationValue.TangDriveWheelConfigurationValue:TangibleValue;
Begin
  result:=''
End;



{*** TSteeringPositionValue ***}

  function TSteeringPositionValue.TangSteeringPositionValue:TangibleValue;
Begin
  result:=''
End;



{*** TEngineSpecification ***}

function TEngineSpecification.Get_enginePower:IQuantitativeValue;
Begin
   result:=FenginePower;
End;

procedure TEngineSpecification.Set_enginePower(v:IQuantitativeValue);
Begin
  FenginePower:=v;
End;

function TEngineSpecification.Get_engineDisplacement:IQuantitativeValue;
Begin
   result:=FengineDisplacement;
End;

procedure TEngineSpecification.Set_engineDisplacement(v:IQuantitativeValue);
Begin
  FengineDisplacement:=v;
End;

function TEngineSpecification.Get_fuelType:String;
Begin
   result:=FfuelType;
End;

procedure TEngineSpecification.Set_fuelType(v:String);
Begin
  FfuelType:=v;
End;

function TEngineSpecification.Get_engineType:String;
Begin
   result:=FengineType;
End;

procedure TEngineSpecification.Set_engineType(v:String);
Begin
  FengineType:=v;
End;

function TEngineSpecification.Get_torque:IQuantitativeValue;
Begin
   result:=Ftorque;
End;

procedure TEngineSpecification.Set_torque(v:IQuantitativeValue);
Begin
  Ftorque:=v;
End;



{*** TWebPage ***}

function TWebPage.Get_primaryImageOfPage:IImageObject;
Begin
   result:=FprimaryImageOfPage;
End;

procedure TWebPage.Set_primaryImageOfPage(v:IImageObject);
Begin
  FprimaryImageOfPage:=v;
End;

function TWebPage.Get_breadcrumb:IBreadcrumbList;
Begin
   result:=Fbreadcrumb;
End;

procedure TWebPage.Set_breadcrumb(v:IBreadcrumbList);
Begin
  Fbreadcrumb:=v;
End;

function TWebPage.Get_significantLinks:String;
Begin
   result:=FsignificantLinks;
End;

procedure TWebPage.Set_significantLinks(v:String);
Begin
  FsignificantLinks:=v;
End;

function TWebPage.Get_relatedLink:String;
Begin
   result:=FrelatedLink;
End;

procedure TWebPage.Set_relatedLink(v:String);
Begin
  FrelatedLink:=v;
End;

function TWebPage.Get_reviewedBy:IPerson;
Begin
   result:=FreviewedBy;
End;

procedure TWebPage.Set_reviewedBy(v:IPerson);
Begin
  FreviewedBy:=v;
End;

function TWebPage.Get_specialty:ISpecialty;
Begin
   result:=Fspecialty;
End;

procedure TWebPage.Set_specialty(v:ISpecialty);
Begin
  Fspecialty:=v;
End;

function TWebPage.Get_lastReviewed:TDateTime;
Begin
   result:=FlastReviewed;
End;

procedure TWebPage.Set_lastReviewed(v:TDateTime);
Begin
  FlastReviewed:=v;
End;



{*** TBreadcrumbList ***}

  function TBreadcrumbList.TangBreadcrumbList:TangibleValue;
Begin
  result:=''
End;



{*** TFinancialService ***}

function TFinancialService.Get_feesAndCommissionsSpecification:String;
Begin
   result:=FfeesAndCommissionsSpecification;
End;

procedure TFinancialService.Set_feesAndCommissionsSpecification(v:String);
Begin
  FfeesAndCommissionsSpecification:=v;
End;



{*** TGoodRelationsClass ***}

  function TGoodRelationsClass.TangGoodRelationsClass:TangibleValue;
Begin
  result:=''
End;



{*** TDigitalDocument ***}

function TDigitalDocument.Get_hasDigitalDocumentPermission:IDigitalDocumentPermission;
Begin
   result:=FhasDigitalDocumentPermission;
End;

procedure TDigitalDocument.Set_hasDigitalDocumentPermission(v:IDigitalDocumentPermission);
Begin
  FhasDigitalDocumentPermission:=v;
End;



{*** TDigitalDocumentPermission ***}

function TDigitalDocumentPermission.Get_permissionType:IDigitalDocumentPermissionType;
Begin
   result:=FpermissionType;
End;

procedure TDigitalDocumentPermission.Set_permissionType(v:IDigitalDocumentPermissionType);
Begin
  FpermissionType:=v;
End;

function TDigitalDocumentPermission.Get_grantee:IAudience;
Begin
   result:=Fgrantee;
End;

procedure TDigitalDocumentPermission.Set_grantee(v:IAudience);
Begin
  Fgrantee:=v;
End;



{*** TDigitalDocumentPermissionType ***}

  function TDigitalDocumentPermissionType.TangDigitalDocumentPermissionType:TangibleValue;
Begin
  result:=''
End;



{*** TSocialMediaPosting ***}

function TSocialMediaPosting.Get_sharedContent:ICreativeWork;
Begin
   result:=FsharedContent;
End;

procedure TSocialMediaPosting.Set_sharedContent(v:ICreativeWork);
Begin
  FsharedContent:=v;
End;



{*** TMedicalOrganization ***}

function TMedicalOrganization.Get_medicalSpecialty:IMedicalSpecialty;
Begin
   result:=FmedicalSpecialty;
End;

procedure TMedicalOrganization.Set_medicalSpecialty(v:IMedicalSpecialty);
Begin
  FmedicalSpecialty:=v;
End;

function TMedicalOrganization.Get_healthPlanNetworkId:String;
Begin
   result:=FhealthPlanNetworkId;
End;

procedure TMedicalOrganization.Set_healthPlanNetworkId(v:String);
Begin
  FhealthPlanNetworkId:=v;
End;

function TMedicalOrganization.Get_isAcceptingNewPatients:Boolean;
Begin
   result:=FisAcceptingNewPatients;
End;

procedure TMedicalOrganization.Set_isAcceptingNewPatients(v:Boolean);
Begin
  FisAcceptingNewPatients:=v;
End;



{*** TFinancialProduct ***}

function TFinancialProduct.Get_annualPercentageRate:IQuantitativeValue;
Begin
   result:=FannualPercentageRate;
End;

procedure TFinancialProduct.Set_annualPercentageRate(v:IQuantitativeValue);
Begin
  FannualPercentageRate:=v;
End;

function TFinancialProduct.Get_interestRate:INumber;
Begin
   result:=FinterestRate;
End;

procedure TFinancialProduct.Set_interestRate(v:INumber);
Begin
  FinterestRate:=v;
End;



{*** TCurrencyConversionService ***}

  function TCurrencyConversionService.TangCurrencyConversionService:TangibleValue;
Begin
  result:=''
End;



{*** TTradeAction ***}

function TTradeAction.Get_price:INumber;
Begin
   result:=Fprice;
End;

procedure TTradeAction.Set_price(v:INumber);
Begin
  Fprice:=v;
End;

function TTradeAction.Get_priceSpecification:IPriceSpecification;
Begin
   result:=FpriceSpecification;
End;

procedure TTradeAction.Set_priceSpecification(v:IPriceSpecification);
Begin
  FpriceSpecification:=v;
End;



{*** TPaymentCard ***}

  function TPaymentCard.TangPaymentCard:TangibleValue;
Begin
  result:=''
End;



{*** TCreditCard ***}

  function TCreditCard.TangCreditCard:TangibleValue;
Begin
  result:=''
End;



{*** TEndorsementRating ***}

  function TEndorsementRating.TangEndorsementRating:TangibleValue;
Begin
  result:=''
End;



{*** TFoodService ***}

  function TFoodService.TangFoodService:TangibleValue;
Begin
  result:=''
End;



{*** TAccommodation ***}

function TAccommodation.Get_amenityFeature:ILocationFeatureSpecification;
Begin
   result:=FamenityFeature;
End;

procedure TAccommodation.Set_amenityFeature(v:ILocationFeatureSpecification);
Begin
  FamenityFeature:=v;
End;

function TAccommodation.Get_floorSize:IQuantitativeValue;
Begin
   result:=FfloorSize;
End;

procedure TAccommodation.Set_floorSize(v:IQuantitativeValue);
Begin
  FfloorSize:=v;
End;

function TAccommodation.Get_permittedUsage:String;
Begin
   result:=FpermittedUsage;
End;

procedure TAccommodation.Set_permittedUsage(v:String);
Begin
  FpermittedUsage:=v;
End;



{*** TLocationFeatureSpecification ***}

  function TLocationFeatureSpecification.TangLocationFeatureSpecification:TangibleValue;
Begin
  result:=''
End;



{*** TPlanAction ***}

function TPlanAction.Get_scheduledTime:TDateTime;
Begin
   result:=FscheduledTime;
End;

procedure TPlanAction.Set_scheduledTime(v:TDateTime);
Begin
  FscheduledTime:=v;
End;



{*** TLockerDelivery ***}

  function TLockerDelivery.TangLockerDelivery:TangibleValue;
Begin
  result:=''
End;



{*** TMedicalRiskEstimator ***}

function TMedicalRiskEstimator.Get_estimatesRiskOf:IMedicalEntity;
Begin
   result:=FestimatesRiskOf;
End;

procedure TMedicalRiskEstimator.Set_estimatesRiskOf(v:IMedicalEntity);
Begin
  FestimatesRiskOf:=v;
End;

function TMedicalRiskEstimator.Get_includedRiskFactor:IMedicalRiskFactor;
Begin
   result:=FincludedRiskFactor;
End;

procedure TMedicalRiskEstimator.Set_includedRiskFactor(v:IMedicalRiskFactor);
Begin
  FincludedRiskFactor:=v;
End;



{*** TPaymentService ***}

  function TPaymentService.TangPaymentService:TangibleValue;
Begin
  result:=''
End;



{*** TEventReservation ***}

  function TEventReservation.TangEventReservation:TangibleValue;
Begin
  result:=''
End;



{*** TVisualArtwork ***}

function TVisualArtwork.Get_artist:IPerson;
Begin
   result:=Fartist;
End;

procedure TVisualArtwork.Set_artist(v:IPerson);
Begin
  Fartist:=v;
End;

function TVisualArtwork.Get_width:IQuantitativeValue;
Begin
   result:=Fwidth;
End;

procedure TVisualArtwork.Set_width(v:IQuantitativeValue);
Begin
  Fwidth:=v;
End;

function TVisualArtwork.Get_surface:String;
Begin
   result:=Fsurface;
End;

procedure TVisualArtwork.Set_surface(v:String);
Begin
  Fsurface:=v;
End;

function TVisualArtwork.Get_depth:IQuantitativeValue;
Begin
   result:=Fdepth;
End;

procedure TVisualArtwork.Set_depth(v:IQuantitativeValue);
Begin
  Fdepth:=v;
End;

function TVisualArtwork.Get_artMedium:String;
Begin
   result:=FartMedium;
End;

procedure TVisualArtwork.Set_artMedium(v:String);
Begin
  FartMedium:=v;
End;

function TVisualArtwork.Get_artEdition:Integer;
Begin
   result:=FartEdition;
End;

procedure TVisualArtwork.Set_artEdition(v:Integer);
Begin
  FartEdition:=v;
End;

function TVisualArtwork.Get_artform:String;
Begin
   result:=Fartform;
End;

procedure TVisualArtwork.Set_artform(v:String);
Begin
  Fartform:=v;
End;

function TVisualArtwork.Get_height:IDistance;
Begin
   result:=Fheight;
End;

procedure TVisualArtwork.Set_height(v:IDistance);
Begin
  Fheight:=v;
End;



{*** TDistance ***}

  function TDistance.TangDistance:TangibleValue;
Begin
  result:=''
End;



{*** TBankAccount ***}

  function TBankAccount.TangBankAccount:TangibleValue;
Begin
  result:=''
End;



{*** TDepositAccount ***}

  function TDepositAccount.TangDepositAccount:TangibleValue;
Begin
  result:=''
End;



{*** TTrainReservation ***}

  function TTrainReservation.TangTrainReservation:TangibleValue;
Begin
  result:=''
End;



{*** TFMRadioChannel ***}

  function TFMRadioChannel.TangFMRadioChannel:TangibleValue;
Begin
  result:=''
End;



{*** TMessage ***}

function TMessage.Get_dateSent:TDateTime;
Begin
   result:=FdateSent;
End;

procedure TMessage.Set_dateSent(v:TDateTime);
Begin
  FdateSent:=v;
End;

function TMessage.Get_dateRead:TDateTime;
Begin
   result:=FdateRead;
End;

procedure TMessage.Set_dateRead(v:TDateTime);
Begin
  FdateRead:=v;
End;

function TMessage.Get_messageAttachment:ICreativeWork;
Begin
   result:=FmessageAttachment;
End;

procedure TMessage.Set_messageAttachment(v:ICreativeWork);
Begin
  FmessageAttachment:=v;
End;

function TMessage.Get_dateReceived:TDateTime;
Begin
   result:=FdateReceived;
End;

procedure TMessage.Set_dateReceived(v:TDateTime);
Begin
  FdateReceived:=v;
End;



{*** TPhysicalActivityCategory ***}

  function TPhysicalActivityCategory.TangPhysicalActivityCategory:TangibleValue;
Begin
  result:=''
End;



{*** TItemListOrderType ***}

  function TItemListOrderType.TangItemListOrderType:TangibleValue;
Begin
  result:=''
End;



{*** TScreeningEvent ***}

function TScreeningEvent.Get_videoFormat:String;
Begin
   result:=FvideoFormat;
End;

procedure TScreeningEvent.Set_videoFormat(v:String);
Begin
  FvideoFormat:=v;
End;

function TScreeningEvent.Get_workPresented:IMovie;
Begin
   result:=FworkPresented;
End;

procedure TScreeningEvent.Set_workPresented(v:IMovie);
Begin
  FworkPresented:=v;
End;



{*** TMovie ***}

function TMovie.Get_musicBy:IMusicGroup;
Begin
   result:=FmusicBy;
End;

procedure TMovie.Set_musicBy(v:IMusicGroup);
Begin
  FmusicBy:=v;
End;

function TMovie.Get_subtitleLanguage:String;
Begin
   result:=FsubtitleLanguage;
End;

procedure TMovie.Set_subtitleLanguage(v:String);
Begin
  FsubtitleLanguage:=v;
End;



{*** TMusicGroup ***}

function TMusicGroup.Get_musicGroupMember:IPerson;
Begin
   result:=FmusicGroupMember;
End;

procedure TMusicGroup.Set_musicGroupMember(v:IPerson);
Begin
  FmusicGroupMember:=v;
End;

function TMusicGroup.Get_albums:IMusicAlbum;
Begin
   result:=Falbums;
End;

procedure TMusicGroup.Set_albums(v:IMusicAlbum);
Begin
  Falbums:=v;
End;

function TMusicGroup.Get_genre:String;
Begin
   result:=Fgenre;
End;

procedure TMusicGroup.Set_genre(v:String);
Begin
  Fgenre:=v;
End;



{*** TMusicPlaylist ***}

function TMusicPlaylist.Get_tracks:IMusicRecording;
Begin
   result:=Ftracks;
End;

procedure TMusicPlaylist.Set_tracks(v:IMusicRecording);
Begin
  Ftracks:=v;
End;

function TMusicPlaylist.Get_numTracks:Integer;
Begin
   result:=FnumTracks;
End;

procedure TMusicPlaylist.Set_numTracks(v:Integer);
Begin
  FnumTracks:=v;
End;



{*** TMusicRecording ***}

function TMusicRecording.Get_inAlbum:IMusicAlbum;
Begin
   result:=FinAlbum;
End;

procedure TMusicRecording.Set_inAlbum(v:IMusicAlbum);
Begin
  FinAlbum:=v;
End;

function TMusicRecording.Get_inPlaylist:IMusicPlaylist;
Begin
   result:=FinPlaylist;
End;

procedure TMusicRecording.Set_inPlaylist(v:IMusicPlaylist);
Begin
  FinPlaylist:=v;
End;

function TMusicRecording.Get_byArtist:IMusicGroup;
Begin
   result:=FbyArtist;
End;

procedure TMusicRecording.Set_byArtist(v:IMusicGroup);
Begin
  FbyArtist:=v;
End;

function TMusicRecording.Get_isrcCode:String;
Begin
   result:=FisrcCode;
End;

procedure TMusicRecording.Set_isrcCode(v:String);
Begin
  FisrcCode:=v;
End;

function TMusicRecording.Get_recordingOf:IMusicComposition;
Begin
   result:=FrecordingOf;
End;

procedure TMusicRecording.Set_recordingOf(v:IMusicComposition);
Begin
  FrecordingOf:=v;
End;



{*** TMusicAlbum ***}

function TMusicAlbum.Get_albumReleaseType:IMusicAlbumReleaseType;
Begin
   result:=FalbumReleaseType;
End;

procedure TMusicAlbum.Set_albumReleaseType(v:IMusicAlbumReleaseType);
Begin
  FalbumReleaseType:=v;
End;

function TMusicAlbum.Get_albumProductionType:IMusicAlbumProductionType;
Begin
   result:=FalbumProductionType;
End;

procedure TMusicAlbum.Set_albumProductionType(v:IMusicAlbumProductionType);
Begin
  FalbumProductionType:=v;
End;



{*** TMusicAlbumReleaseType ***}

  function TMusicAlbumReleaseType.TangMusicAlbumReleaseType:TangibleValue;
Begin
  result:=''
End;



{*** TMusicAlbumProductionType ***}

  function TMusicAlbumProductionType.TangMusicAlbumProductionType:TangibleValue;
Begin
  result:=''
End;



{*** TMusicComposition ***}

function TMusicComposition.Get_musicalKey:String;
Begin
   result:=FmusicalKey;
End;

procedure TMusicComposition.Set_musicalKey(v:String);
Begin
  FmusicalKey:=v;
End;

function TMusicComposition.Get_iswcCode:String;
Begin
   result:=FiswcCode;
End;

procedure TMusicComposition.Set_iswcCode(v:String);
Begin
  FiswcCode:=v;
End;

function TMusicComposition.Get_includedComposition:IMusicComposition;
Begin
   result:=FincludedComposition;
End;

procedure TMusicComposition.Set_includedComposition(v:IMusicComposition);
Begin
  FincludedComposition:=v;
End;

function TMusicComposition.Get_musicCompositionForm:String;
Begin
   result:=FmusicCompositionForm;
End;

procedure TMusicComposition.Set_musicCompositionForm(v:String);
Begin
  FmusicCompositionForm:=v;
End;

function TMusicComposition.Get_musicArrangement:IMusicComposition;
Begin
   result:=FmusicArrangement;
End;

procedure TMusicComposition.Set_musicArrangement(v:IMusicComposition);
Begin
  FmusicArrangement:=v;
End;

function TMusicComposition.Get_lyricist:IPerson;
Begin
   result:=Flyricist;
End;

procedure TMusicComposition.Set_lyricist(v:IPerson);
Begin
  Flyricist:=v;
End;

function TMusicComposition.Get_firstPerformance:IEvent;
Begin
   result:=FfirstPerformance;
End;

procedure TMusicComposition.Set_firstPerformance(v:IEvent);
Begin
  FfirstPerformance:=v;
End;

function TMusicComposition.Get_lyrics:ICreativeWork;
Begin
   result:=Flyrics;
End;

procedure TMusicComposition.Set_lyrics(v:ICreativeWork);
Begin
  Flyrics:=v;
End;



{*** TFlight ***}

function TFlight.Get_carrier:IOrganization;
Begin
   result:=Fcarrier;
End;

procedure TFlight.Set_carrier(v:IOrganization);
Begin
  Fcarrier:=v;
End;

function TFlight.Get_mealService:String;
Begin
   result:=FmealService;
End;

procedure TFlight.Set_mealService(v:String);
Begin
  FmealService:=v;
End;

function TFlight.Get_flightNumber:String;
Begin
   result:=FflightNumber;
End;

procedure TFlight.Set_flightNumber(v:String);
Begin
  FflightNumber:=v;
End;

function TFlight.Get_aircraft:String;
Begin
   result:=Faircraft;
End;

procedure TFlight.Set_aircraft(v:String);
Begin
  Faircraft:=v;
End;

function TFlight.Get_departureAirport:IAirport;
Begin
   result:=FdepartureAirport;
End;

procedure TFlight.Set_departureAirport(v:IAirport);
Begin
  FdepartureAirport:=v;
End;

function TFlight.Get_departureGate:String;
Begin
   result:=FdepartureGate;
End;

procedure TFlight.Set_departureGate(v:String);
Begin
  FdepartureGate:=v;
End;

function TFlight.Get_departureTerminal:String;
Begin
   result:=FdepartureTerminal;
End;

procedure TFlight.Set_departureTerminal(v:String);
Begin
  FdepartureTerminal:=v;
End;

function TFlight.Get_flightDistance:IDistance;
Begin
   result:=FflightDistance;
End;

procedure TFlight.Set_flightDistance(v:IDistance);
Begin
  FflightDistance:=v;
End;

function TFlight.Get_departureTime:TDateTime;
Begin
   result:=FdepartureTime;
End;

procedure TFlight.Set_departureTime(v:TDateTime);
Begin
  FdepartureTime:=v;
End;

function TFlight.Get_estimatedFlightDuration:IDuration;
Begin
   result:=FestimatedFlightDuration;
End;

procedure TFlight.Set_estimatedFlightDuration(v:IDuration);
Begin
  FestimatedFlightDuration:=v;
End;

function TFlight.Get_boardingPolicy:IBoardingPolicyType;
Begin
   result:=FboardingPolicy;
End;

procedure TFlight.Set_boardingPolicy(v:IBoardingPolicyType);
Begin
  FboardingPolicy:=v;
End;

function TFlight.Get_arrivalAirport:IAirport;
Begin
   result:=FarrivalAirport;
End;

procedure TFlight.Set_arrivalAirport(v:IAirport);
Begin
  FarrivalAirport:=v;
End;

function TFlight.Get_webCheckinTime:TDateTime;
Begin
   result:=FwebCheckinTime;
End;

procedure TFlight.Set_webCheckinTime(v:TDateTime);
Begin
  FwebCheckinTime:=v;
End;

function TFlight.Get_arrivalGate:String;
Begin
   result:=FarrivalGate;
End;

procedure TFlight.Set_arrivalGate(v:String);
Begin
  FarrivalGate:=v;
End;

function TFlight.Get_arrivalTerminal:String;
Begin
   result:=FarrivalTerminal;
End;

procedure TFlight.Set_arrivalTerminal(v:String);
Begin
  FarrivalTerminal:=v;
End;



{*** TAirport ***}

function TAirport.Get_icaoCode:String;
Begin
   result:=FicaoCode;
End;

procedure TAirport.Set_icaoCode(v:String);
Begin
  FicaoCode:=v;
End;



{*** TBoardingPolicyType ***}

  function TBoardingPolicyType.TangBoardingPolicyType:TangibleValue;
Begin
  result:=''
End;



{*** TCompoundPriceSpecification ***}

function TCompoundPriceSpecification.Get_priceComponent:IUnitPriceSpecification;
Begin
   result:=FpriceComponent;
End;

procedure TCompoundPriceSpecification.Set_priceComponent(v:IUnitPriceSpecification);
Begin
  FpriceComponent:=v;
End;



{*** TUnitPriceSpecification ***}

function TUnitPriceSpecification.Get_priceType:String;
Begin
   result:=FpriceType;
End;

procedure TUnitPriceSpecification.Set_priceType(v:String);
Begin
  FpriceType:=v;
End;

function TUnitPriceSpecification.Get_referenceQuantity:IQuantitativeValue;
Begin
   result:=FreferenceQuantity;
End;

procedure TUnitPriceSpecification.Set_referenceQuantity(v:IQuantitativeValue);
Begin
  FreferenceQuantity:=v;
End;

function TUnitPriceSpecification.Get_billingIncrement:INumber;
Begin
   result:=FbillingIncrement;
End;

procedure TUnitPriceSpecification.Set_billingIncrement(v:INumber);
Begin
  FbillingIncrement:=v;
End;



{*** TSoftwareSourceCode ***}

function TSoftwareSourceCode.Get_sampleType:String;
Begin
   result:=FsampleType;
End;

procedure TSoftwareSourceCode.Set_sampleType(v:String);
Begin
  FsampleType:=v;
End;

function TSoftwareSourceCode.Get_runtime:String;
Begin
   result:=Fruntime;
End;

procedure TSoftwareSourceCode.Set_runtime(v:String);
Begin
  Fruntime:=v;
End;

function TSoftwareSourceCode.Get_codeRepository:String;
Begin
   result:=FcodeRepository;
End;

procedure TSoftwareSourceCode.Set_codeRepository(v:String);
Begin
  FcodeRepository:=v;
End;

function TSoftwareSourceCode.Get_targetProduct:ISoftwareApplication;
Begin
   result:=FtargetProduct;
End;

procedure TSoftwareSourceCode.Set_targetProduct(v:ISoftwareApplication);
Begin
  FtargetProduct:=v;
End;

function TSoftwareSourceCode.Get_programmingLanguage:IComputerLanguage;
Begin
   result:=FprogrammingLanguage;
End;

procedure TSoftwareSourceCode.Set_programmingLanguage(v:IComputerLanguage);
Begin
  FprogrammingLanguage:=v;
End;



{*** TComputerLanguage ***}

  function TComputerLanguage.TangComputerLanguage:TangibleValue;
Begin
  result:=''
End;



{*** TFlightReservation ***}

function TFlightReservation.Get_passengerPriorityStatus:String;
Begin
   result:=FpassengerPriorityStatus;
End;

procedure TFlightReservation.Set_passengerPriorityStatus(v:String);
Begin
  FpassengerPriorityStatus:=v;
End;

function TFlightReservation.Get_securityScreening:String;
Begin
   result:=FsecurityScreening;
End;

procedure TFlightReservation.Set_securityScreening(v:String);
Begin
  FsecurityScreening:=v;
End;

function TFlightReservation.Get_boardingGroup:String;
Begin
   result:=FboardingGroup;
End;

procedure TFlightReservation.Set_boardingGroup(v:String);
Begin
  FboardingGroup:=v;
End;

function TFlightReservation.Get_passengerSequenceNumber:String;
Begin
   result:=FpassengerSequenceNumber;
End;

procedure TFlightReservation.Set_passengerSequenceNumber(v:String);
Begin
  FpassengerSequenceNumber:=v;
End;



{*** TSuite ***}

function TSuite.Get_numberOfRooms:IQuantitativeValue;
Begin
   result:=FnumberOfRooms;
End;

procedure TSuite.Set_numberOfRooms(v:IQuantitativeValue);
Begin
  FnumberOfRooms:=v;
End;



{*** TEnumerationValueSet ***}

function TEnumerationValueSet.Get_hasEnumerationValue:String;
Begin
   result:=FhasEnumerationValue;
End;

procedure TEnumerationValueSet.Set_hasEnumerationValue(v:String);
Begin
  FhasEnumerationValue:=v;
End;



{*** TComicStory ***}

function TComicStory.Get_colorist:IPerson;
Begin
   result:=Fcolorist;
End;

procedure TComicStory.Set_colorist(v:IPerson);
Begin
  Fcolorist:=v;
End;

function TComicStory.Get_letterer:IPerson;
Begin
   result:=Fletterer;
End;

procedure TComicStory.Set_letterer(v:IPerson);
Begin
  Fletterer:=v;
End;



{*** TJobPosting ***}

function TJobPosting.Get_skills:String;
Begin
   result:=Fskills;
End;

procedure TJobPosting.Set_skills(v:String);
Begin
  Fskills:=v;
End;

function TJobPosting.Get_specialCommitments:String;
Begin
   result:=FspecialCommitments;
End;

procedure TJobPosting.Set_specialCommitments(v:String);
Begin
  FspecialCommitments:=v;
End;

function TJobPosting.Get_benefits:String;
Begin
   result:=Fbenefits;
End;

procedure TJobPosting.Set_benefits(v:String);
Begin
  Fbenefits:=v;
End;

function TJobPosting.Get_hiringOrganization:IOrganization;
Begin
   result:=FhiringOrganization;
End;

procedure TJobPosting.Set_hiringOrganization(v:IOrganization);
Begin
  FhiringOrganization:=v;
End;

function TJobPosting.Get_datePosted:TDateTime;
Begin
   result:=FdatePosted;
End;

procedure TJobPosting.Set_datePosted(v:TDateTime);
Begin
  FdatePosted:=v;
End;

function TJobPosting.Get_employmentType:String;
Begin
   result:=FemploymentType;
End;

procedure TJobPosting.Set_employmentType(v:String);
Begin
  FemploymentType:=v;
End;

function TJobPosting.Get_title:String;
Begin
   result:=Ftitle;
End;

procedure TJobPosting.Set_title(v:String);
Begin
  Ftitle:=v;
End;

function TJobPosting.Get_educationRequirements:String;
Begin
   result:=FeducationRequirements;
End;

procedure TJobPosting.Set_educationRequirements(v:String);
Begin
  FeducationRequirements:=v;
End;

function TJobPosting.Get_occupationalCategory:String;
Begin
   result:=FoccupationalCategory;
End;

procedure TJobPosting.Set_occupationalCategory(v:String);
Begin
  FoccupationalCategory:=v;
End;

function TJobPosting.Get_jobLocation:IPlace;
Begin
   result:=FjobLocation;
End;

procedure TJobPosting.Set_jobLocation(v:IPlace);
Begin
  FjobLocation:=v;
End;

function TJobPosting.Get_industry:String;
Begin
   result:=Findustry;
End;

procedure TJobPosting.Set_industry(v:String);
Begin
  Findustry:=v;
End;

function TJobPosting.Get_responsibilities:String;
Begin
   result:=Fresponsibilities;
End;

procedure TJobPosting.Set_responsibilities(v:String);
Begin
  Fresponsibilities:=v;
End;

function TJobPosting.Get_salaryCurrency:String;
Begin
   result:=FsalaryCurrency;
End;

procedure TJobPosting.Set_salaryCurrency(v:String);
Begin
  FsalaryCurrency:=v;
End;

function TJobPosting.Get_experienceRequirements:String;
Begin
   result:=FexperienceRequirements;
End;

procedure TJobPosting.Set_experienceRequirements(v:String);
Begin
  FexperienceRequirements:=v;
End;

function TJobPosting.Get_workHours:String;
Begin
   result:=FworkHours;
End;

procedure TJobPosting.Set_workHours(v:String);
Begin
  FworkHours:=v;
End;

function TJobPosting.Get_qualifications:String;
Begin
   result:=Fqualifications;
End;

procedure TJobPosting.Set_qualifications(v:String);
Begin
  Fqualifications:=v;
End;

function TJobPosting.Get_incentives:String;
Begin
   result:=Fincentives;
End;

procedure TJobPosting.Set_incentives(v:String);
Begin
  Fincentives:=v;
End;



{*** TPublicationIssue ***}

function TPublicationIssue.Get_pagination:String;
Begin
   result:=Fpagination;
End;

procedure TPublicationIssue.Set_pagination(v:String);
Begin
  Fpagination:=v;
End;

function TPublicationIssue.Get_issueNumber:Integer;
Begin
   result:=FissueNumber;
End;

procedure TPublicationIssue.Set_issueNumber(v:Integer);
Begin
  FissueNumber:=v;
End;

function TPublicationIssue.Get_pageStart:String;
Begin
   result:=FpageStart;
End;

procedure TPublicationIssue.Set_pageStart(v:String);
Begin
  FpageStart:=v;
End;



{*** TTVSeason ***}

function TTVSeason.Get_countryOfOrigin:ICountry;
Begin
   result:=FcountryOfOrigin;
End;

procedure TTVSeason.Set_countryOfOrigin(v:ICountry);
Begin
  FcountryOfOrigin:=v;
End;



{*** TInvestmentOrDeposit ***}

  function TInvestmentOrDeposit.TangInvestmentOrDeposit:TangibleValue;
Begin
  result:=''
End;



{*** TVein ***}

function TVein.Get_regionDrained:IAnatomicalStructure;
Begin
   result:=FregionDrained;
End;

procedure TVein.Set_regionDrained(v:IAnatomicalStructure);
Begin
  FregionDrained:=v;
End;

function TVein.Get_tributary:IAnatomicalStructure;
Begin
   result:=Ftributary;
End;

procedure TVein.Set_tributary(v:IAnatomicalStructure);
Begin
  Ftributary:=v;
End;

function TVein.Get_drainsTo:IVessel;
Begin
   result:=FdrainsTo;
End;

procedure TVein.Set_drainsTo(v:IVessel);
Begin
  FdrainsTo:=v;
End;



{*** TWriteAction ***}

function TWriteAction.Get_language:ILanguage;
Begin
   result:=Flanguage;
End;

procedure TWriteAction.Set_language(v:ILanguage);
Begin
  Flanguage:=v;
End;



{*** TLanguage ***}

  function TLanguage.TangLanguage:TangibleValue;
Begin
  result:=''
End;



{*** TSellAction ***}

function TSellAction.Get_buyer:IPerson;
Begin
   result:=Fbuyer;
End;

procedure TSellAction.Set_buyer(v:IPerson);
Begin
  Fbuyer:=v;
End;



{*** TQuestion ***}

function TQuestion.Get_answerCount:Integer;
Begin
   result:=FanswerCount;
End;

procedure TQuestion.Set_answerCount(v:Integer);
Begin
  FanswerCount:=v;
End;

function TQuestion.Get_acceptedAnswer:IAnswer;
Begin
   result:=FacceptedAnswer;
End;

procedure TQuestion.Set_acceptedAnswer(v:IAnswer);
Begin
  FacceptedAnswer:=v;
End;

function TQuestion.Get_downvoteCount:Integer;
Begin
   result:=FdownvoteCount;
End;

procedure TQuestion.Set_downvoteCount(v:Integer);
Begin
  FdownvoteCount:=v;
End;



{*** TComment ***}

function TComment.Get_upvoteCount:Integer;
Begin
   result:=FupvoteCount;
End;

procedure TComment.Set_upvoteCount(v:Integer);
Begin
  FupvoteCount:=v;
End;

function TComment.Get_parentItem:IQuestion;
Begin
   result:=FparentItem;
End;

procedure TComment.Set_parentItem(v:IQuestion);
Begin
  FparentItem:=v;
End;



{*** TBedType ***}

  function TBedType.TangBedType:TangibleValue;
Begin
  result:=''
End;



{*** TTrainTrip ***}

function TTrainTrip.Get_trainNumber:String;
Begin
   result:=FtrainNumber;
End;

procedure TTrainTrip.Set_trainNumber(v:String);
Begin
  FtrainNumber:=v;
End;

function TTrainTrip.Get_departurePlatform:String;
Begin
   result:=FdeparturePlatform;
End;

procedure TTrainTrip.Set_departurePlatform(v:String);
Begin
  FdeparturePlatform:=v;
End;

function TTrainTrip.Get_arrivalStation:ITrainStation;
Begin
   result:=FarrivalStation;
End;

procedure TTrainTrip.Set_arrivalStation(v:ITrainStation);
Begin
  FarrivalStation:=v;
End;

function TTrainTrip.Get_arrivalTime:TDateTime;
Begin
   result:=FarrivalTime;
End;

procedure TTrainTrip.Set_arrivalTime(v:TDateTime);
Begin
  FarrivalTime:=v;
End;

function TTrainTrip.Get_arrivalPlatform:String;
Begin
   result:=FarrivalPlatform;
End;

procedure TTrainTrip.Set_arrivalPlatform(v:String);
Begin
  FarrivalPlatform:=v;
End;

function TTrainTrip.Get_departureStation:ITrainStation;
Begin
   result:=FdepartureStation;
End;

procedure TTrainTrip.Set_departureStation(v:ITrainStation);
Begin
  FdepartureStation:=v;
End;

function TTrainTrip.Get_trainName:String;
Begin
   result:=FtrainName;
End;

procedure TTrainTrip.Set_trainName(v:String);
Begin
  FtrainName:=v;
End;



{*** TSportsOrganization ***}

function TSportsOrganization.Get_sport:String;
Begin
   result:=Fsport;
End;

procedure TSportsOrganization.Set_sport(v:String);
Begin
  Fsport:=v;
End;



{*** TSportsTeam ***}

function TSportsTeam.Get_athlete:IPerson;
Begin
   result:=Fathlete;
End;

procedure TSportsTeam.Set_athlete(v:IPerson);
Begin
  Fathlete:=v;
End;

function TSportsTeam.Get_coach:IPerson;
Begin
   result:=Fcoach;
End;

procedure TSportsTeam.Set_coach(v:IPerson);
Begin
  Fcoach:=v;
End;



{*** TJoint ***}

function TJoint.Get_functionalClass:String;
Begin
   result:=FfunctionalClass;
End;

procedure TJoint.Set_functionalClass(v:String);
Begin
  FfunctionalClass:=v;
End;

function TJoint.Get_structuralClass:String;
Begin
   result:=FstructuralClass;
End;

procedure TJoint.Set_structuralClass(v:String);
Begin
  FstructuralClass:=v;
End;

function TJoint.Get_biomechnicalClass:String;
Begin
   result:=FbiomechnicalClass;
End;

procedure TJoint.Set_biomechnicalClass(v:String);
Begin
  FbiomechnicalClass:=v;
End;



{*** TDiagnosticLab ***}

function TDiagnosticLab.Get_availableTest:IMedicalTest;
Begin
   result:=FavailableTest;
End;

procedure TDiagnosticLab.Set_availableTest(v:IMedicalTest);
Begin
  FavailableTest:=v;
End;



{*** TCourse ***}

function TCourse.Get_hasCourseInstance:ICourseInstance;
Begin
   result:=FhasCourseInstance;
End;

procedure TCourse.Set_hasCourseInstance(v:ICourseInstance);
Begin
  FhasCourseInstance:=v;
End;

function TCourse.Get_courseCode:String;
Begin
   result:=FcourseCode;
End;

procedure TCourse.Set_courseCode(v:String);
Begin
  FcourseCode:=v;
End;

function TCourse.Get_educationalCredentialAwarded:String;
Begin
   result:=FeducationalCredentialAwarded;
End;

procedure TCourse.Set_educationalCredentialAwarded(v:String);
Begin
  FeducationalCredentialAwarded:=v;
End;

function TCourse.Get_coursePrerequisites:ICourse;
Begin
   result:=FcoursePrerequisites;
End;

procedure TCourse.Set_coursePrerequisites(v:ICourse);
Begin
  FcoursePrerequisites:=v;
End;



{*** TCourseInstance ***}

function TCourseInstance.Get_instructor:IPerson;
Begin
   result:=Finstructor;
End;

procedure TCourseInstance.Set_instructor(v:IPerson);
Begin
  Finstructor:=v;
End;

function TCourseInstance.Get_courseMode:String;
Begin
   result:=FcourseMode;
End;

procedure TCourseInstance.Set_courseMode(v:String);
Begin
  FcourseMode:=v;
End;



{*** TReplaceAction ***}

function TReplaceAction.Get_replacee:IThing;
Begin
   result:=Freplacee;
End;

procedure TReplaceAction.Set_replacee(v:IThing);
Begin
  Freplacee:=v;
End;

function TReplaceAction.Get_replacer:IThing;
Begin
   result:=Freplacer;
End;

procedure TReplaceAction.Set_replacer(v:IThing);
Begin
  Freplacer:=v;
End;



{*** TPublicationVolume ***}

function TPublicationVolume.Get_volumeNumber:String;
Begin
   result:=FvolumeNumber;
End;

procedure TPublicationVolume.Set_volumeNumber(v:String);
Begin
  FvolumeNumber:=v;
End;



{*** TRestrictedDiet ***}

  function TRestrictedDiet.TangRestrictedDiet:TangibleValue;
Begin
  result:=''
End;



{*** TLoseAction ***}

function TLoseAction.Get_winner:IPerson;
Begin
   result:=Fwinner;
End;

procedure TLoseAction.Set_winner(v:IPerson);
Begin
  Fwinner:=v;
End;



{*** TPhysician ***}

function TPhysician.Get_hospitalAffiliation:IHospital;
Begin
   result:=FhospitalAffiliation;
End;

procedure TPhysician.Set_hospitalAffiliation(v:IHospital);
Begin
  FhospitalAffiliation:=v;
End;

function TPhysician.Get_availableService:IMedicalTest;
Begin
   result:=FavailableService;
End;

procedure TPhysician.Set_availableService(v:IMedicalTest);
Begin
  FavailableService:=v;
End;



{*** TExercisePlan ***}

function TExercisePlan.Get_workload:IQualitativeValue;
Begin
   result:=Fworkload;
End;

procedure TExercisePlan.Set_workload(v:IQualitativeValue);
Begin
  Fworkload:=v;
End;

function TExercisePlan.Get_activityDuration:IQualitativeValue;
Begin
   result:=FactivityDuration;
End;

procedure TExercisePlan.Set_activityDuration(v:IQualitativeValue);
Begin
  FactivityDuration:=v;
End;

function TExercisePlan.Get_restPeriods:String;
Begin
   result:=FrestPeriods;
End;

procedure TExercisePlan.Set_restPeriods(v:String);
Begin
  FrestPeriods:=v;
End;

function TExercisePlan.Get_repetitions:IQualitativeValue;
Begin
   result:=Frepetitions;
End;

procedure TExercisePlan.Set_repetitions(v:IQualitativeValue);
Begin
  Frepetitions:=v;
End;

function TExercisePlan.Get_intensity:String;
Begin
   result:=Fintensity;
End;

procedure TExercisePlan.Set_intensity(v:String);
Begin
  Fintensity:=v;
End;

function TExercisePlan.Get_additionalVariable:String;
Begin
   result:=FadditionalVariable;
End;

procedure TExercisePlan.Set_additionalVariable(v:String);
Begin
  FadditionalVariable:=v;
End;

function TExercisePlan.Get_activityFrequency:IQualitativeValue;
Begin
   result:=FactivityFrequency;
End;

procedure TExercisePlan.Set_activityFrequency(v:IQualitativeValue);
Begin
  FactivityFrequency:=v;
End;



{*** TMusicReleaseFormatType ***}

  function TMusicReleaseFormatType.TangMusicReleaseFormatType:TangibleValue;
Begin
  result:=''
End;



{*** TAirline ***}

function TAirline.Get_iataCode:String;
Begin
   result:=FiataCode;
End;

procedure TAirline.Set_iataCode(v:String);
Begin
  FiataCode:=v;
End;



{*** TOrder ***}

function TOrder.Get_partOfInvoice:IInvoice;
Begin
   result:=FpartOfInvoice;
End;

procedure TOrder.Set_partOfInvoice(v:IInvoice);
Begin
  FpartOfInvoice:=v;
End;

function TOrder.Get_discount:INumber;
Begin
   result:=Fdiscount;
End;

procedure TOrder.Set_discount(v:INumber);
Begin
  Fdiscount:=v;
End;

function TOrder.Get_discountCurrency:String;
Begin
   result:=FdiscountCurrency;
End;

procedure TOrder.Set_discountCurrency(v:String);
Begin
  FdiscountCurrency:=v;
End;

function TOrder.Get_orderStatus:IOrderStatus;
Begin
   result:=ForderStatus;
End;

procedure TOrder.Set_orderStatus(v:IOrderStatus);
Begin
  ForderStatus:=v;
End;

function TOrder.Get_merchant:IPerson;
Begin
   result:=Fmerchant;
End;

procedure TOrder.Set_merchant(v:IPerson);
Begin
  Fmerchant:=v;
End;

function TOrder.Get_acceptedOffer:IOffer;
Begin
   result:=FacceptedOffer;
End;

procedure TOrder.Set_acceptedOffer(v:IOffer);
Begin
  FacceptedOffer:=v;
End;

function TOrder.Get_discountCode:String;
Begin
   result:=FdiscountCode;
End;

procedure TOrder.Set_discountCode(v:String);
Begin
  FdiscountCode:=v;
End;

function TOrder.Get_paymentUrl:String;
Begin
   result:=FpaymentUrl;
End;

procedure TOrder.Set_paymentUrl(v:String);
Begin
  FpaymentUrl:=v;
End;

function TOrder.Get_orderDate:TDateTime;
Begin
   result:=ForderDate;
End;

procedure TOrder.Set_orderDate(v:TDateTime);
Begin
  ForderDate:=v;
End;

function TOrder.Get_billingAddress:IPostalAddress;
Begin
   result:=FbillingAddress;
End;

procedure TOrder.Set_billingAddress(v:IPostalAddress);
Begin
  FbillingAddress:=v;
End;

function TOrder.Get_orderedItem:IOrderItem;
Begin
   result:=ForderedItem;
End;

procedure TOrder.Set_orderedItem(v:IOrderItem);
Begin
  ForderedItem:=v;
End;

function TOrder.Get_orderDelivery:IParcelDelivery;
Begin
   result:=ForderDelivery;
End;

procedure TOrder.Set_orderDelivery(v:IParcelDelivery);
Begin
  ForderDelivery:=v;
End;

function TOrder.Get_confirmationNumber:String;
Begin
   result:=FconfirmationNumber;
End;

procedure TOrder.Set_confirmationNumber(v:String);
Begin
  FconfirmationNumber:=v;
End;

function TOrder.Get_isGift:Boolean;
Begin
   result:=FisGift;
End;

procedure TOrder.Set_isGift(v:Boolean);
Begin
  FisGift:=v;
End;

function TOrder.Get_orderNumber:String;
Begin
   result:=ForderNumber;
End;

procedure TOrder.Set_orderNumber(v:String);
Begin
  ForderNumber:=v;
End;



{*** TInvoice ***}

function TInvoice.Get_paymentDue:TDateTime;
Begin
   result:=FpaymentDue;
End;

procedure TInvoice.Set_paymentDue(v:TDateTime);
Begin
  FpaymentDue:=v;
End;

function TInvoice.Get_paymentMethod:IPaymentMethod;
Begin
   result:=FpaymentMethod;
End;

procedure TInvoice.Set_paymentMethod(v:IPaymentMethod);
Begin
  FpaymentMethod:=v;
End;

function TInvoice.Get_minimumPaymentDue:IPriceSpecification;
Begin
   result:=FminimumPaymentDue;
End;

procedure TInvoice.Set_minimumPaymentDue(v:IPriceSpecification);
Begin
  FminimumPaymentDue:=v;
End;

function TInvoice.Get_paymentMethodId:String;
Begin
   result:=FpaymentMethodId;
End;

procedure TInvoice.Set_paymentMethodId(v:String);
Begin
  FpaymentMethodId:=v;
End;

function TInvoice.Get_scheduledPaymentDate:TDateTime;
Begin
   result:=FscheduledPaymentDate;
End;

procedure TInvoice.Set_scheduledPaymentDate(v:TDateTime);
Begin
  FscheduledPaymentDate:=v;
End;

function TInvoice.Get_accountId:String;
Begin
   result:=FaccountId;
End;

procedure TInvoice.Set_accountId(v:String);
Begin
  FaccountId:=v;
End;

function TInvoice.Get_referencesOrder:IOrder;
Begin
   result:=FreferencesOrder;
End;

procedure TInvoice.Set_referencesOrder(v:IOrder);
Begin
  FreferencesOrder:=v;
End;

function TInvoice.Get_paymentStatus:IPaymentStatusType;
Begin
   result:=FpaymentStatus;
End;

procedure TInvoice.Set_paymentStatus(v:IPaymentStatusType);
Begin
  FpaymentStatus:=v;
End;

function TInvoice.Get_customer:IOrganization;
Begin
   result:=Fcustomer;
End;

procedure TInvoice.Set_customer(v:IOrganization);
Begin
  Fcustomer:=v;
End;

function TInvoice.Get_totalPaymentDue:IMonetaryAmount;
Begin
   result:=FtotalPaymentDue;
End;

procedure TInvoice.Set_totalPaymentDue(v:IMonetaryAmount);
Begin
  FtotalPaymentDue:=v;
End;

function TInvoice.Get_billingPeriod:IDuration;
Begin
   result:=FbillingPeriod;
End;

procedure TInvoice.Set_billingPeriod(v:IDuration);
Begin
  FbillingPeriod:=v;
End;



{*** TPaymentStatusType ***}

  function TPaymentStatusType.TangPaymentStatusType:TangibleValue;
Begin
  result:=''
End;



{*** TMonetaryAmount ***}

function TMonetaryAmount.Get_value:IStructuredValue;
Begin
   result:=Fvalue;
End;

procedure TMonetaryAmount.Set_value(v:IStructuredValue);
Begin
  Fvalue:=v;
End;



{*** TOrderStatus ***}

  function TOrderStatus.TangOrderStatus:TangibleValue;
Begin
  result:=''
End;



{*** TOrderItem ***}

function TOrderItem.Get_orderQuantity:INumber;
Begin
   result:=ForderQuantity;
End;

procedure TOrderItem.Set_orderQuantity(v:INumber);
Begin
  ForderQuantity:=v;
End;

function TOrderItem.Get_orderItemStatus:IOrderStatus;
Begin
   result:=ForderItemStatus;
End;

procedure TOrderItem.Set_orderItemStatus(v:IOrderStatus);
Begin
  ForderItemStatus:=v;
End;

function TOrderItem.Get_orderItemNumber:String;
Begin
   result:=ForderItemNumber;
End;

procedure TOrderItem.Set_orderItemNumber(v:String);
Begin
  ForderItemNumber:=v;
End;



{*** TParcelDelivery ***}

function TParcelDelivery.Get_trackingNumber:String;
Begin
   result:=FtrackingNumber;
End;

procedure TParcelDelivery.Set_trackingNumber(v:String);
Begin
  FtrackingNumber:=v;
End;

function TParcelDelivery.Get_partOfOrder:IOrder;
Begin
   result:=FpartOfOrder;
End;

procedure TParcelDelivery.Set_partOfOrder(v:IOrder);
Begin
  FpartOfOrder:=v;
End;

function TParcelDelivery.Get_expectedArrivalFrom:TDateTime;
Begin
   result:=FexpectedArrivalFrom;
End;

procedure TParcelDelivery.Set_expectedArrivalFrom(v:TDateTime);
Begin
  FexpectedArrivalFrom:=v;
End;

function TParcelDelivery.Get_hasDeliveryMethod:IDeliveryMethod;
Begin
   result:=FhasDeliveryMethod;
End;

procedure TParcelDelivery.Set_hasDeliveryMethod(v:IDeliveryMethod);
Begin
  FhasDeliveryMethod:=v;
End;

function TParcelDelivery.Get_itemShipped:IProduct;
Begin
   result:=FitemShipped;
End;

procedure TParcelDelivery.Set_itemShipped(v:IProduct);
Begin
  FitemShipped:=v;
End;

function TParcelDelivery.Get_deliveryAddress:IPostalAddress;
Begin
   result:=FdeliveryAddress;
End;

procedure TParcelDelivery.Set_deliveryAddress(v:IPostalAddress);
Begin
  FdeliveryAddress:=v;
End;

function TParcelDelivery.Get_deliveryStatus:IDeliveryEvent;
Begin
   result:=FdeliveryStatus;
End;

procedure TParcelDelivery.Set_deliveryStatus(v:IDeliveryEvent);
Begin
  FdeliveryStatus:=v;
End;

function TParcelDelivery.Get_originAddress:IPostalAddress;
Begin
   result:=ForiginAddress;
End;

procedure TParcelDelivery.Set_originAddress(v:IPostalAddress);
Begin
  ForiginAddress:=v;
End;

function TParcelDelivery.Get_trackingUrl:String;
Begin
   result:=FtrackingUrl;
End;

procedure TParcelDelivery.Set_trackingUrl(v:String);
Begin
  FtrackingUrl:=v;
End;

function TParcelDelivery.Get_expectedArrivalUntil:TDateTime;
Begin
   result:=FexpectedArrivalUntil;
End;

procedure TParcelDelivery.Set_expectedArrivalUntil(v:TDateTime);
Begin
  FexpectedArrivalUntil:=v;
End;



{*** TDeliveryEvent ***}

function TDeliveryEvent.Get_accessCode:String;
Begin
   result:=FaccessCode;
End;

procedure TDeliveryEvent.Set_accessCode(v:String);
Begin
  FaccessCode:=v;
End;

function TDeliveryEvent.Get_availableFrom:TDateTime;
Begin
   result:=FavailableFrom;
End;

procedure TDeliveryEvent.Set_availableFrom(v:TDateTime);
Begin
  FavailableFrom:=v;
End;

function TDeliveryEvent.Get_availableThrough:TDateTime;
Begin
   result:=FavailableThrough;
End;

procedure TDeliveryEvent.Set_availableThrough(v:TDateTime);
Begin
  FavailableThrough:=v;
End;



{*** TEndorseAction ***}

function TEndorseAction.Get_endorsee:IOrganization;
Begin
   result:=Fendorsee;
End;

procedure TEndorseAction.Set_endorsee(v:IOrganization);
Begin
  Fendorsee:=v;
End;



{*** TDatedMoneySpecification ***}

function TDatedMoneySpecification.Get_currency:String;
Begin
   result:=Fcurrency;
End;

procedure TDatedMoneySpecification.Set_currency(v:String);
Begin
  Fcurrency:=v;
End;



{*** TQuotation ***}

function TQuotation.Get_spokenByCharacter:IOrganization;
Begin
   result:=FspokenByCharacter;
End;

procedure TQuotation.Set_spokenByCharacter(v:IOrganization);
Begin
  FspokenByCharacter:=v;
End;



{*** TMedicalWebPage ***}

function TMedicalWebPage.Get_aspect:String;
Begin
   result:=Faspect;
End;

procedure TMedicalWebPage.Set_aspect(v:String);
Begin
  Faspect:=v;
End;



{*** TMedicalTestPanel ***}

function TMedicalTestPanel.Get_subTest:IMedicalTest;
Begin
   result:=FsubTest;
End;

procedure TMedicalTestPanel.Set_subTest(v:IMedicalTest);
Begin
  FsubTest:=v;
End;



{*** TMuscle ***}

function TMuscle.Get_nerve:INerve;
Begin
   result:=Fnerve;
End;

procedure TMuscle.Set_nerve(v:INerve);
Begin
  Fnerve:=v;
End;

function TMuscle.Get_origin:IAnatomicalStructure;
Begin
   result:=Forigin;
End;

procedure TMuscle.Set_origin(v:IAnatomicalStructure);
Begin
  Forigin:=v;
End;

function TMuscle.Get_action:String;
Begin
   result:=Faction;
End;

procedure TMuscle.Set_action(v:String);
Begin
  Faction:=v;
End;

function TMuscle.Get_bloodSupply:IVessel;
Begin
   result:=FbloodSupply;
End;

procedure TMuscle.Set_bloodSupply(v:IVessel);
Begin
  FbloodSupply:=v;
End;

function TMuscle.Get_insertion:IAnatomicalStructure;
Begin
   result:=Finsertion;
End;

procedure TMuscle.Set_insertion(v:IAnatomicalStructure);
Begin
  Finsertion:=v;
End;

function TMuscle.Get_antagonist:IMuscle;
Begin
   result:=Fantagonist;
End;

procedure TMuscle.Set_antagonist(v:IMuscle);
Begin
  Fantagonist:=v;
End;

function TMuscle.Get_muscleAction:String;
Begin
   result:=FmuscleAction;
End;

procedure TMuscle.Set_muscleAction(v:String);
Begin
  FmuscleAction:=v;
End;



{*** TNerve ***}

function TNerve.Get_sourcedFrom:IBrainStructure;
Begin
   result:=FsourcedFrom;
End;

procedure TNerve.Set_sourcedFrom(v:IBrainStructure);
Begin
  FsourcedFrom:=v;
End;

function TNerve.Get_branch:IAnatomicalStructure;
Begin
   result:=Fbranch;
End;

procedure TNerve.Set_branch(v:IAnatomicalStructure);
Begin
  Fbranch:=v;
End;

function TNerve.Get_nerveMotor:IMuscle;
Begin
   result:=FnerveMotor;
End;

procedure TNerve.Set_nerveMotor(v:IMuscle);
Begin
  FnerveMotor:=v;
End;

function TNerve.Get_sensoryUnit:IAnatomicalStructure;
Begin
   result:=FsensoryUnit;
End;

procedure TNerve.Set_sensoryUnit(v:IAnatomicalStructure);
Begin
  FsensoryUnit:=v;
End;



{*** TSendAction ***}

function TSendAction.Get_deliveryMethod:IDeliveryMethod;
Begin
   result:=FdeliveryMethod;
End;

procedure TSendAction.Set_deliveryMethod(v:IDeliveryMethod);
Begin
  FdeliveryMethod:=v;
End;



{*** TPaymentChargeSpecification ***}

function TPaymentChargeSpecification.Get_appliesToDeliveryMethod:IDeliveryMethod;
Begin
   result:=FappliesToDeliveryMethod;
End;

procedure TPaymentChargeSpecification.Set_appliesToDeliveryMethod(v:IDeliveryMethod);
Begin
  FappliesToDeliveryMethod:=v;
End;

function TPaymentChargeSpecification.Get_appliesToPaymentMethod:IPaymentMethod;
Begin
   result:=FappliesToPaymentMethod;
End;

procedure TPaymentChargeSpecification.Set_appliesToPaymentMethod(v:IPaymentMethod);
Begin
  FappliesToPaymentMethod:=v;
End;



{*** TInfectiousAgentClass ***}

  function TInfectiousAgentClass.TangInfectiousAgentClass:TangibleValue;
Begin
  result:=''
End;



{*** TArtery ***}

function TArtery.Get_supplyTo:IAnatomicalStructure;
Begin
   result:=FsupplyTo;
End;

procedure TArtery.Set_supplyTo(v:IAnatomicalStructure);
Begin
  FsupplyTo:=v;
End;

function TArtery.Get_source:IAnatomicalStructure;
Begin
   result:=Fsource;
End;

procedure TArtery.Set_source(v:IAnatomicalStructure);
Begin
  Fsource:=v;
End;



{*** TLiveBlogPosting ***}

function TLiveBlogPosting.Get_coverageEndTime:TDateTime;
Begin
   result:=FcoverageEndTime;
End;

procedure TLiveBlogPosting.Set_coverageEndTime(v:TDateTime);
Begin
  FcoverageEndTime:=v;
End;

function TLiveBlogPosting.Get_liveBlogUpdate:IBlogPosting;
Begin
   result:=FliveBlogUpdate;
End;

procedure TLiveBlogPosting.Set_liveBlogUpdate(v:IBlogPosting);
Begin
  FliveBlogUpdate:=v;
End;

function TLiveBlogPosting.Get_coverageStartTime:TDateTime;
Begin
   result:=FcoverageStartTime;
End;

procedure TLiveBlogPosting.Set_coverageStartTime(v:TDateTime);
Begin
  FcoverageStartTime:=v;
End;



{*** TMedicalObservationalStudy ***}

function TMedicalObservationalStudy.Get_studyDesign:IMedicalObservationalStudyDesign;
Begin
   result:=FstudyDesign;
End;

procedure TMedicalObservationalStudy.Set_studyDesign(v:IMedicalObservationalStudyDesign);
Begin
  FstudyDesign:=v;
End;



{*** TMedicalObservationalStudyDesign ***}

  function TMedicalObservationalStudyDesign.TangMedicalObservationalStudyDesign:TangibleValue;
Begin
  result:=''
End;



{*** TSearchAction ***}

function TSearchAction.Get_query:String;
Begin
   result:=Fquery;
End;

procedure TSearchAction.Set_query(v:String);
Begin
  Fquery:=v;
End;



{*** TRole ***}

function TRole.Get_namedPosition:String;
Begin
   result:=FnamedPosition;
End;

procedure TRole.Set_namedPosition(v:String);
Begin
  FnamedPosition:=v;
End;

function TRole.Get_endDate:TDateTime;
Begin
   result:=FendDate;
End;

procedure TRole.Set_endDate(v:TDateTime);
Begin
  FendDate:=v;
End;



{*** TOrganizationRole ***}

function TOrganizationRole.Get_numberedPosition:INumber;
Begin
   result:=FnumberedPosition;
End;

procedure TOrganizationRole.Set_numberedPosition(v:INumber);
Begin
  FnumberedPosition:=v;
End;



{*** TEmployeeRole ***}

function TEmployeeRole.Get_baseSalary:INumber;
Begin
   result:=FbaseSalary;
End;

procedure TEmployeeRole.Set_baseSalary(v:INumber);
Begin
  FbaseSalary:=v;
End;



{*** TMap ***}

function TMap.Get_mapType:IMapCategoryType;
Begin
   result:=FmapType;
End;

procedure TMap.Set_mapType(v:IMapCategoryType);
Begin
  FmapType:=v;
End;



{*** TMapCategoryType ***}

  function TMapCategoryType.TangMapCategoryType:TangibleValue;
Begin
  result:=''
End;



{*** TRsvpAction ***}

function TRsvpAction.Get_rsvpResponse:IRsvpResponseType;
Begin
   result:=FrsvpResponse;
End;

procedure TRsvpAction.Set_rsvpResponse(v:IRsvpResponseType);
Begin
  FrsvpResponse:=v;
End;

function TRsvpAction.Get_comment:IComment;
Begin
   result:=Fcomment;
End;

procedure TRsvpAction.Set_comment(v:IComment);
Begin
  Fcomment:=v;
End;

function TRsvpAction.Get_additionalNumberOfGuests:INumber;
Begin
   result:=FadditionalNumberOfGuests;
End;

procedure TRsvpAction.Set_additionalNumberOfGuests(v:INumber);
Begin
  FadditionalNumberOfGuests:=v;
End;



{*** TRsvpResponseType ***}

  function TRsvpResponseType.TangRsvpResponseType:TangibleValue;
Begin
  result:=''
End;



{*** TEnergy ***}

  function TEnergy.TangEnergy:TangibleValue;
Begin
  result:=''
End;



{*** TWarrantyScope ***}

  function TWarrantyScope.TangWarrantyScope:TangibleValue;
Begin
  result:=''
End;



{*** TLendAction ***}

function TLendAction.Get_borrower:IPerson;
Begin
   result:=Fborrower;
End;

procedure TLendAction.Set_borrower(v:IPerson);
Begin
  Fborrower:=v;
End;



{*** TGame ***}

function TGame.Get_characterAttribute:IThing;
Begin
   result:=FcharacterAttribute;
End;

procedure TGame.Set_characterAttribute(v:IThing);
Begin
  FcharacterAttribute:=v;
End;



{*** TCorporation ***}

function TCorporation.Get_tickerSymbol:String;
Begin
   result:=FtickerSymbol;
End;

procedure TCorporation.Set_tickerSymbol(v:String);
Begin
  FtickerSymbol:=v;
End;



{*** TProperty ***}

function TProperty.Get_supersededBy:IEnumeration;
Begin
   result:=FsupersededBy;
End;

procedure TProperty.Set_supersededBy(v:IEnumeration);
Begin
  FsupersededBy:=v;
End;

function TProperty.Get_inverseOf:IProperty;
Begin
   result:=FinverseOf;
End;

procedure TProperty.Set_inverseOf(v:IProperty);
Begin
  FinverseOf:=v;
End;

function TProperty.Get_domainIncludes:IClass;
Begin
   result:=FdomainIncludes;
End;

procedure TProperty.Set_domainIncludes(v:IClass);
Begin
  FdomainIncludes:=v;
End;

function TProperty.Get_rangeIncludes:IClass;
Begin
   result:=FrangeIncludes;
End;

procedure TProperty.Set_rangeIncludes(v:IClass);
Begin
  FrangeIncludes:=v;
End;



{*** TClass ***}

  function TClass.TangClass:TangibleValue;
Begin
  result:=''
End;



{*** TExerciseAction ***}

function TExerciseAction.Get_fromLocation:IPlace;
Begin
   result:=FfromLocation;
End;

procedure TExerciseAction.Set_fromLocation(v:IPlace);
Begin
  FfromLocation:=v;
End;

function TExerciseAction.Get_course:IPlace;
Begin
   result:=Fcourse;
End;

procedure TExerciseAction.Set_course(v:IPlace);
Begin
  Fcourse:=v;
End;

function TExerciseAction.Get_sportsTeam:ISportsTeam;
Begin
   result:=FsportsTeam;
End;

procedure TExerciseAction.Set_sportsTeam(v:ISportsTeam);
Begin
  FsportsTeam:=v;
End;

function TExerciseAction.Get_distance:IDistance;
Begin
   result:=Fdistance;
End;

procedure TExerciseAction.Set_distance(v:IDistance);
Begin
  Fdistance:=v;
End;

function TExerciseAction.Get_sportsActivityLocation:ISportsActivityLocation;
Begin
   result:=FsportsActivityLocation;
End;

procedure TExerciseAction.Set_sportsActivityLocation(v:ISportsActivityLocation);
Begin
  FsportsActivityLocation:=v;
End;

function TExerciseAction.Get_opponent:IPerson;
Begin
   result:=Fopponent;
End;

procedure TExerciseAction.Set_opponent(v:IPerson);
Begin
  Fopponent:=v;
End;

function TExerciseAction.Get_sportsEvent:ISportsEvent;
Begin
   result:=FsportsEvent;
End;

procedure TExerciseAction.Set_sportsEvent(v:ISportsEvent);
Begin
  FsportsEvent:=v;
End;

function TExerciseAction.Get_exercisePlan:IExercisePlan;
Begin
   result:=FexercisePlan;
End;

procedure TExerciseAction.Set_exercisePlan(v:IExercisePlan);
Begin
  FexercisePlan:=v;
End;

function TExerciseAction.Get_diet:IDiet;
Begin
   result:=Fdiet;
End;

procedure TExerciseAction.Set_diet(v:IDiet);
Begin
  Fdiet:=v;
End;

function TExerciseAction.Get_exerciseRelatedDiet:IDiet;
Begin
   result:=FexerciseRelatedDiet;
End;

procedure TExerciseAction.Set_exerciseRelatedDiet(v:IDiet);
Begin
  FexerciseRelatedDiet:=v;
End;

function TExerciseAction.Get_exerciseType:String;
Begin
   result:=FexerciseType;
End;

procedure TExerciseAction.Set_exerciseType(v:String);
Begin
  FexerciseType:=v;
End;



{*** TSportsEvent ***}

function TSportsEvent.Get_homeTeam:ISportsTeam;
Begin
   result:=FhomeTeam;
End;

procedure TSportsEvent.Set_homeTeam(v:ISportsTeam);
Begin
  FhomeTeam:=v;
End;

function TSportsEvent.Get_awayTeam:IPerson;
Begin
   result:=FawayTeam;
End;

procedure TSportsEvent.Set_awayTeam(v:IPerson);
Begin
  FawayTeam:=v;
End;



{*** TDiet ***}

function TDiet.Get_dietFeatures:String;
Begin
   result:=FdietFeatures;
End;

procedure TDiet.Set_dietFeatures(v:String);
Begin
  FdietFeatures:=v;
End;

function TDiet.Get_expertConsiderations:String;
Begin
   result:=FexpertConsiderations;
End;

procedure TDiet.Set_expertConsiderations(v:String);
Begin
  FexpertConsiderations:=v;
End;

function TDiet.Get_overview:String;
Begin
   result:=Foverview;
End;

procedure TDiet.Set_overview(v:String);
Begin
  Foverview:=v;
End;

function TDiet.Get_endorsers:IOrganization;
Begin
   result:=Fendorsers;
End;

procedure TDiet.Set_endorsers(v:IOrganization);
Begin
  Fendorsers:=v;
End;

function TDiet.Get_risks:String;
Begin
   result:=Frisks;
End;

procedure TDiet.Set_risks(v:String);
Begin
  Frisks:=v;
End;

function TDiet.Get_physiologicalBenefits:String;
Begin
   result:=FphysiologicalBenefits;
End;

procedure TDiet.Set_physiologicalBenefits(v:String);
Begin
  FphysiologicalBenefits:=v;
End;



{*** TAudiobook ***}

function TAudiobook.Get_readBy:IPerson;
Begin
   result:=FreadBy;
End;

procedure TAudiobook.Set_readBy(v:IPerson);
Begin
  FreadBy:=v;
End;



{*** TBook ***}

function TBook.Get_abridged:Boolean;
Begin
   result:=Fabridged;
End;

procedure TBook.Set_abridged(v:Boolean);
Begin
  Fabridged:=v;
End;

function TBook.Get_isbn:String;
Begin
   result:=Fisbn;
End;

procedure TBook.Set_isbn(v:String);
Begin
  Fisbn:=v;
End;

function TBook.Get_bookFormat:IBookFormatType;
Begin
   result:=FbookFormat;
End;

procedure TBook.Set_bookFormat(v:IBookFormatType);
Begin
  FbookFormat:=v;
End;

function TBook.Get_bookEdition:String;
Begin
   result:=FbookEdition;
End;

procedure TBook.Set_bookEdition(v:String);
Begin
  FbookEdition:=v;
End;

function TBook.Get_numberOfPages:Integer;
Begin
   result:=FnumberOfPages;
End;

procedure TBook.Set_numberOfPages(v:Integer);
Begin
  FnumberOfPages:=v;
End;

function TBook.Get_illustrator:IPerson;
Begin
   result:=Fillustrator;
End;

procedure TBook.Set_illustrator(v:IPerson);
Begin
  Fillustrator:=v;
End;



{*** TBookFormatType ***}

  function TBookFormatType.TangBookFormatType:TangibleValue;
Begin
  result:=''
End;



{*** TBroadcastEvent ***}

function TBroadcastEvent.Get_broadcastOfEvent:IEvent;
Begin
   result:=FbroadcastOfEvent;
End;

procedure TBroadcastEvent.Set_broadcastOfEvent(v:IEvent);
Begin
  FbroadcastOfEvent:=v;
End;

function TBroadcastEvent.Get_isLiveBroadcast:Boolean;
Begin
   result:=FisLiveBroadcast;
End;

procedure TBroadcastEvent.Set_isLiveBroadcast(v:Boolean);
Begin
  FisLiveBroadcast:=v;
End;



{*** TWarrantyPromise ***}

function TWarrantyPromise.Get_warrantyScope:IWarrantyScope;
Begin
   result:=FwarrantyScope;
End;

procedure TWarrantyPromise.Set_warrantyScope(v:IWarrantyScope);
Begin
  FwarrantyScope:=v;
End;

function TWarrantyPromise.Get_durationOfWarranty:IQuantitativeValue;
Begin
   result:=FdurationOfWarranty;
End;

procedure TWarrantyPromise.Set_durationOfWarranty(v:IQuantitativeValue);
Begin
  FdurationOfWarranty:=v;
End;



{*** TDataFeedItem ***}

function TDataFeedItem.Get_dateDeleted:TDateTime;
Begin
   result:=FdateDeleted;
End;

procedure TDataFeedItem.Set_dateDeleted(v:TDateTime);
Begin
  FdateDeleted:=v;
End;

function TDataFeedItem.Get_dateCreated:TDateTime;
Begin
   result:=FdateCreated;
End;

procedure TDataFeedItem.Set_dateCreated(v:TDateTime);
Begin
  FdateCreated:=v;
End;

function TDataFeedItem.Get_dateModified:TDateTime;
Begin
   result:=FdateModified;
End;

procedure TDataFeedItem.Set_dateModified(v:TDateTime);
Begin
  FdateModified:=v;
End;



{*** TGameServer ***}

function TGameServer.Get_playersOnline:Integer;
Begin
   result:=FplayersOnline;
End;

procedure TGameServer.Set_playersOnline(v:Integer);
Begin
  FplayersOnline:=v;
End;

function TGameServer.Get_serverStatus:IGameServerStatus;
Begin
   result:=FserverStatus;
End;

procedure TGameServer.Set_serverStatus(v:IGameServerStatus);
Begin
  FserverStatus:=v;
End;



{*** TGameServerStatus ***}

  function TGameServerStatus.TangGameServerStatus:TangibleValue;
Begin
  result:=''
End;



{*** TOwnershipInfo ***}

function TOwnershipInfo.Get_ownedThrough:TDateTime;
Begin
   result:=FownedThrough;
End;

procedure TOwnershipInfo.Set_ownedThrough(v:TDateTime);
Begin
  FownedThrough:=v;
End;

function TOwnershipInfo.Get_ownedFrom:TDateTime;
Begin
   result:=FownedFrom;
End;

procedure TOwnershipInfo.Set_ownedFrom(v:TDateTime);
Begin
  FownedFrom:=v;
End;

function TOwnershipInfo.Get_acquiredFrom:IPerson;
Begin
   result:=FacquiredFrom;
End;

procedure TOwnershipInfo.Set_acquiredFrom(v:IPerson);
Begin
  FacquiredFrom:=v;
End;



{*** TTaxiReservation ***}

function TTaxiReservation.Get_partySize:Integer;
Begin
   result:=FpartySize;
End;

procedure TTaxiReservation.Set_partySize(v:Integer);
Begin
  FpartySize:=v;
End;

function TTaxiReservation.Get_pickupLocation:IPlace;
Begin
   result:=FpickupLocation;
End;

procedure TTaxiReservation.Set_pickupLocation(v:IPlace);
Begin
  FpickupLocation:=v;
End;

function TTaxiReservation.Get_pickupTime:TDateTime;
Begin
   result:=FpickupTime;
End;

procedure TTaxiReservation.Set_pickupTime(v:TDateTime);
Begin
  FpickupTime:=v;
End;



{*** THealthPlanCostSharingSpecification ***}

function THealthPlanCostSharingSpecification.Get_healthPlanCopay:IPriceSpecification;
Begin
   result:=FhealthPlanCopay;
End;

procedure THealthPlanCostSharingSpecification.Set_healthPlanCopay(v:IPriceSpecification);
Begin
  FhealthPlanCopay:=v;
End;

function THealthPlanCostSharingSpecification.Get_healthPlanPharmacyCategory:String;
Begin
   result:=FhealthPlanPharmacyCategory;
End;

procedure THealthPlanCostSharingSpecification.Set_healthPlanPharmacyCategory(v:String);
Begin
  FhealthPlanPharmacyCategory:=v;
End;

function THealthPlanCostSharingSpecification.Get_healthPlanCoinsuranceOption:String;
Begin
   result:=FhealthPlanCoinsuranceOption;
End;

procedure THealthPlanCostSharingSpecification.Set_healthPlanCoinsuranceOption(v:String);
Begin
  FhealthPlanCoinsuranceOption:=v;
End;

function THealthPlanCostSharingSpecification.Get_healthPlanCoinsuranceRate:INumber;
Begin
   result:=FhealthPlanCoinsuranceRate;
End;

procedure THealthPlanCostSharingSpecification.Set_healthPlanCoinsuranceRate(v:INumber);
Begin
  FhealthPlanCoinsuranceRate:=v;
End;

function THealthPlanCostSharingSpecification.Get_healthPlanCopayOption:String;
Begin
   result:=FhealthPlanCopayOption;
End;

procedure THealthPlanCostSharingSpecification.Set_healthPlanCopayOption(v:String);
Begin
  FhealthPlanCopayOption:=v;
End;



{*** TPerformAction ***}

function TPerformAction.Get_entertainmentBusiness:IEntertainmentBusiness;
Begin
   result:=FentertainmentBusiness;
End;

procedure TPerformAction.Set_entertainmentBusiness(v:IEntertainmentBusiness);
Begin
  FentertainmentBusiness:=v;
End;



{*** TClaimReview ***}

function TClaimReview.Get_claimReviewed:String;
Begin
   result:=FclaimReviewed;
End;

procedure TClaimReview.Set_claimReviewed(v:String);
Begin
  FclaimReviewed:=v;
End;



{*** TCarUsageType ***}

  function TCarUsageType.TangCarUsageType:TangibleValue;
Begin
  result:=''
End;



{*** TTVEpisode ***}

function TTVEpisode.Get_partOfTVSeries:ITVSeries;
Begin
   result:=FpartOfTVSeries;
End;

procedure TTVEpisode.Set_partOfTVSeries(v:ITVSeries);
Begin
  FpartOfTVSeries:=v;
End;



{*** TTVSeries ***}

function TTVSeries.Get_seasons:ICreativeWorkSeason;
Begin
   result:=Fseasons;
End;

procedure TTVSeries.Set_seasons(v:ICreativeWorkSeason);
Begin
  Fseasons:=v;
End;

function TTVSeries.Get_trailer:IVideoObject;
Begin
   result:=Ftrailer;
End;

procedure TTVSeries.Set_trailer(v:IVideoObject);
Begin
  Ftrailer:=v;
End;

function TTVSeries.Get_productionCompany:IOrganization;
Begin
   result:=FproductionCompany;
End;

procedure TTVSeries.Set_productionCompany(v:IOrganization);
Begin
  FproductionCompany:=v;
End;

function TTVSeries.Get_containsSeason:ICreativeWorkSeason;
Begin
   result:=FcontainsSeason;
End;

procedure TTVSeries.Set_containsSeason(v:ICreativeWorkSeason);
Begin
  FcontainsSeason:=v;
End;



{*** TThesis ***}

function TThesis.Get_inSupportOf:String;
Begin
   result:=FinSupportOf;
End;

procedure TThesis.Set_inSupportOf(v:String);
Begin
  FinSupportOf:=v;
End;



{*** TGovernmentService ***}

function TGovernmentService.Get_serviceOperator:IOrganization;
Begin
   result:=FserviceOperator;
End;

procedure TGovernmentService.Set_serviceOperator(v:IOrganization);
Begin
  FserviceOperator:=v;
End;



{*** TBedDetails ***}

function TBedDetails.Get_typeOfBed:String;
Begin
   result:=FtypeOfBed;
End;

procedure TBedDetails.Set_typeOfBed(v:String);
Begin
  FtypeOfBed:=v;
End;

function TBedDetails.Get_numberOfBeds:INumber;
Begin
   result:=FnumberOfBeds;
End;

procedure TBedDetails.Set_numberOfBeds(v:INumber);
Begin
  FnumberOfBeds:=v;
End;



{*** TDeliveryChargeSpecification ***}

function TDeliveryChargeSpecification.Get_eligibleRegion:IGeoShape;
Begin
   result:=FeligibleRegion;
End;

procedure TDeliveryChargeSpecification.Set_eligibleRegion(v:IGeoShape);
Begin
  FeligibleRegion:=v;
End;



{*** TMedicalAudience ***}

  function TMedicalAudience.TangMedicalAudience:TangibleValue;
Begin
  result:=''
End;



{*** TMedicalRiskScore ***}

function TMedicalRiskScore.Get_algorithm:String;
Begin
   result:=Falgorithm;
End;

procedure TMedicalRiskScore.Set_algorithm(v:String);
Begin
  Falgorithm:=v;
End;



{*** TPeopleAudience ***}

function TPeopleAudience.Get_requiredMinAge:Integer;
Begin
   result:=FrequiredMinAge;
End;

procedure TPeopleAudience.Set_requiredMinAge(v:Integer);
Begin
  FrequiredMinAge:=v;
End;

function TPeopleAudience.Get_requiredMaxAge:Integer;
Begin
   result:=FrequiredMaxAge;
End;

procedure TPeopleAudience.Set_requiredMaxAge(v:Integer);
Begin
  FrequiredMaxAge:=v;
End;

function TPeopleAudience.Get_requiredGender:String;
Begin
   result:=FrequiredGender;
End;

procedure TPeopleAudience.Set_requiredGender(v:String);
Begin
  FrequiredGender:=v;
End;

function TPeopleAudience.Get_suggestedGender:String;
Begin
   result:=FsuggestedGender;
End;

procedure TPeopleAudience.Set_suggestedGender(v:String);
Begin
  FsuggestedGender:=v;
End;

function TPeopleAudience.Get_suggestedMinAge:INumber;
Begin
   result:=FsuggestedMinAge;
End;

procedure TPeopleAudience.Set_suggestedMinAge(v:INumber);
Begin
  FsuggestedMinAge:=v;
End;

function TPeopleAudience.Get_suggestedMaxAge:INumber;
Begin
   result:=FsuggestedMaxAge;
End;

procedure TPeopleAudience.Set_suggestedMaxAge(v:INumber);
Begin
  FsuggestedMaxAge:=v;
End;



{*** TParentAudience ***}

function TParentAudience.Get_childMaxAge:INumber;
Begin
   result:=FchildMaxAge;
End;

procedure TParentAudience.Set_childMaxAge(v:INumber);
Begin
  FchildMaxAge:=v;
End;

function TParentAudience.Get_childMinAge:INumber;
Begin
   result:=FchildMinAge;
End;

procedure TParentAudience.Set_childMinAge(v:INumber);
Begin
  FchildMinAge:=v;
End;



{*** TBorrowAction ***}

function TBorrowAction.Get_lender:IPerson;
Begin
   result:=Flender;
End;

procedure TBorrowAction.Set_lender(v:IPerson);
Begin
  Flender:=v;
End;



{*** TDietarySupplement ***}

function TDietarySupplement.Get_nonProprietaryName:String;
Begin
   result:=FnonProprietaryName;
End;

procedure TDietarySupplement.Set_nonProprietaryName(v:String);
Begin
  FnonProprietaryName:=v;
End;

function TDietarySupplement.Get_background:String;
Begin
   result:=Fbackground;
End;

procedure TDietarySupplement.Set_background(v:String);
Begin
  Fbackground:=v;
End;

function TDietarySupplement.Get_isProprietary:Boolean;
Begin
   result:=FisProprietary;
End;

procedure TDietarySupplement.Set_isProprietary(v:Boolean);
Begin
  FisProprietary:=v;
End;

function TDietarySupplement.Get_recommendedIntake:IRecommendedDoseSchedule;
Begin
   result:=FrecommendedIntake;
End;

procedure TDietarySupplement.Set_recommendedIntake(v:IRecommendedDoseSchedule);
Begin
  FrecommendedIntake:=v;
End;

function TDietarySupplement.Get_mechanismOfAction:String;
Begin
   result:=FmechanismOfAction;
End;

procedure TDietarySupplement.Set_mechanismOfAction(v:String);
Begin
  FmechanismOfAction:=v;
End;

function TDietarySupplement.Get_targetPopulation:String;
Begin
   result:=FtargetPopulation;
End;

procedure TDietarySupplement.Set_targetPopulation(v:String);
Begin
  FtargetPopulation:=v;
End;

function TDietarySupplement.Get_safetyConsideration:String;
Begin
   result:=FsafetyConsideration;
End;

procedure TDietarySupplement.Set_safetyConsideration(v:String);
Begin
  FsafetyConsideration:=v;
End;

function TDietarySupplement.Get_manufacturer:IOrganization;
Begin
   result:=Fmanufacturer;
End;

procedure TDietarySupplement.Set_manufacturer(v:IOrganization);
Begin
  Fmanufacturer:=v;
End;



{*** TBuyAction ***}

function TBuyAction.Get_warrantyPromise:IWarrantyPromise;
Begin
   result:=FwarrantyPromise;
End;

procedure TBuyAction.Set_warrantyPromise(v:IWarrantyPromise);
Begin
  FwarrantyPromise:=v;
End;

function TBuyAction.Get_vendor:IOrganization;
Begin
   result:=Fvendor;
End;

procedure TBuyAction.Set_vendor(v:IOrganization);
Begin
  Fvendor:=v;
End;



{*** TRentAction ***}

function TRentAction.Get_realEstateAgent:IRealEstateAgent;
Begin
   result:=FrealEstateAgent;
End;

procedure TRentAction.Set_realEstateAgent(v:IRealEstateAgent);
Begin
  FrealEstateAgent:=v;
End;

function TRentAction.Get_landlord:IPerson;
Begin
   result:=Flandlord;
End;

procedure TRentAction.Set_landlord(v:IPerson);
Begin
  Flandlord:=v;
End;



{*** TMedicalDevicePurpose ***}

  function TMedicalDevicePurpose.TangMedicalDevicePurpose:TangibleValue;
Begin
  result:=''
End;



{*** TReport ***}

function TReport.Get_reportNumber:String;
Begin
   result:=FreportNumber;
End;

procedure TReport.Set_reportNumber(v:String);
Begin
  FreportNumber:=v;
End;



{*** TTechArticle ***}

function TTechArticle.Get_dependencies:String;
Begin
   result:=Fdependencies;
End;

procedure TTechArticle.Set_dependencies(v:String);
Begin
  Fdependencies:=v;
End;

function TTechArticle.Get_proficiencyLevel:String;
Begin
   result:=FproficiencyLevel;
End;

procedure TTechArticle.Set_proficiencyLevel(v:String);
Begin
  FproficiencyLevel:=v;
End;



{*** TMedicalGuidelineRecommendation ***}

function TMedicalGuidelineRecommendation.Get_recommendationStrength:String;
Begin
   result:=FrecommendationStrength;
End;

procedure TMedicalGuidelineRecommendation.Set_recommendationStrength(v:String);
Begin
  FrecommendationStrength:=v;
End;



{*** TFollowAction ***}

function TFollowAction.Get_followee:IOrganization;
Begin
   result:=Ffollowee;
End;

procedure TFollowAction.Set_followee(v:IOrganization);
Begin
  Ffollowee:=v;
End;



{*** TBusinessAudience ***}

function TBusinessAudience.Get_yearsInOperation:IQuantitativeValue;
Begin
   result:=FyearsInOperation;
End;

procedure TBusinessAudience.Set_yearsInOperation(v:IQuantitativeValue);
Begin
  FyearsInOperation:=v;
End;

function TBusinessAudience.Get_yearlyRevenue:IQuantitativeValue;
Begin
   result:=FyearlyRevenue;
End;

procedure TBusinessAudience.Set_yearlyRevenue(v:IQuantitativeValue);
Begin
  FyearlyRevenue:=v;
End;

function TBusinessAudience.Get_numberOfEmployees:IQuantitativeValue;
Begin
   result:=FnumberOfEmployees;
End;

procedure TBusinessAudience.Set_numberOfEmployees(v:IQuantitativeValue);
Begin
  FnumberOfEmployees:=v;
End;



{*** TListItem ***}

function TListItem.Get_item:IThing;
Begin
   result:=Fitem;
End;

procedure TListItem.Set_item(v:IThing);
Begin
  Fitem:=v;
End;

function TListItem.Get_previousItem:IListItem;
Begin
   result:=FpreviousItem;
End;

procedure TListItem.Set_previousItem(v:IListItem);
Begin
  FpreviousItem:=v;
End;

function TListItem.Get_nextItem:IListItem;
Begin
   result:=FnextItem;
End;

procedure TListItem.Set_nextItem(v:IListItem);
Begin
  FnextItem:=v;
End;



{*** TPhysicalActivity ***}

function TPhysicalActivity.Get_epidemiology:String;
Begin
   result:=Fepidemiology;
End;

procedure TPhysicalActivity.Set_epidemiology(v:String);
Begin
  Fepidemiology:=v;
End;



{*** TAPIReference ***}

function TAPIReference.Get_assemblyVersion:String;
Begin
   result:=FassemblyVersion;
End;

procedure TAPIReference.Set_assemblyVersion(v:String);
Begin
  FassemblyVersion:=v;
End;

function TAPIReference.Get_programmingModel:String;
Begin
   result:=FprogrammingModel;
End;

procedure TAPIReference.Set_programmingModel(v:String);
Begin
  FprogrammingModel:=v;
End;

function TAPIReference.Get_targetPlatform:String;
Begin
   result:=FtargetPlatform;
End;

procedure TAPIReference.Set_targetPlatform(v:String);
Begin
  FtargetPlatform:=v;
End;

function TAPIReference.Get_assembly:String;
Begin
   result:=Fassembly;
End;

procedure TAPIReference.Set_assembly(v:String);
Begin
  Fassembly:=v;
End;



{*** TCar ***}

function TCar.Get_roofLoad:IQuantitativeValue;
Begin
   result:=FroofLoad;
End;

procedure TCar.Set_roofLoad(v:IQuantitativeValue);
Begin
  FroofLoad:=v;
End;



{*** TRentalCarReservation ***}

function TRentalCarReservation.Get_dropoffLocation:IPlace;
Begin
   result:=FdropoffLocation;
End;

procedure TRentalCarReservation.Set_dropoffLocation(v:IPlace);
Begin
  FdropoffLocation:=v;
End;

function TRentalCarReservation.Get_dropoffTime:TDateTime;
Begin
   result:=FdropoffTime;
End;

procedure TRentalCarReservation.Set_dropoffTime(v:TDateTime);
Begin
  FdropoffTime:=v;
End;



{*** TWebApplication ***}

function TWebApplication.Get_browserRequirements:String;
Begin
   result:=FbrowserRequirements;
End;

procedure TWebApplication.Set_browserRequirements(v:String);
Begin
  FbrowserRequirements:=v;
End;



{*** TGamePlayMode ***}

  function TGamePlayMode.TangGamePlayMode:TangibleValue;
Begin
  result:=''
End;



{*** TAggregateOffer ***}

function TAggregateOffer.Get_highPrice:INumber;
Begin
   result:=FhighPrice;
End;

procedure TAggregateOffer.Set_highPrice(v:INumber);
Begin
  FhighPrice:=v;
End;

function TAggregateOffer.Get_offerCount:Integer;
Begin
   result:=FofferCount;
End;

procedure TAggregateOffer.Set_offerCount(v:Integer);
Begin
  FofferCount:=v;
End;

function TAggregateOffer.Get_lowPrice:INumber;
Begin
   result:=FlowPrice;
End;

procedure TAggregateOffer.Set_lowPrice(v:INumber);
Begin
  FlowPrice:=v;
End;



{*** TBrand ***}

  function TBrand.TangBrand:TangibleValue;
Begin
  result:=''
End;



{*** TPropertyValueSpecification ***}

function TPropertyValueSpecification.Get_multipleValues:Boolean;
Begin
   result:=FmultipleValues;
End;

procedure TPropertyValueSpecification.Set_multipleValues(v:Boolean);
Begin
  FmultipleValues:=v;
End;

function TPropertyValueSpecification.Get_readonlyValue:Boolean;
Begin
   result:=FreadonlyValue;
End;

procedure TPropertyValueSpecification.Set_readonlyValue(v:Boolean);
Begin
  FreadonlyValue:=v;
End;

function TPropertyValueSpecification.Get_valueMaxLength:INumber;
Begin
   result:=FvalueMaxLength;
End;

procedure TPropertyValueSpecification.Set_valueMaxLength(v:INumber);
Begin
  FvalueMaxLength:=v;
End;

function TPropertyValueSpecification.Get_valueMinLength:INumber;
Begin
   result:=FvalueMinLength;
End;

procedure TPropertyValueSpecification.Set_valueMinLength(v:INumber);
Begin
  FvalueMinLength:=v;
End;

function TPropertyValueSpecification.Get_defaultValue:String;
Begin
   result:=FdefaultValue;
End;

procedure TPropertyValueSpecification.Set_defaultValue(v:String);
Begin
  FdefaultValue:=v;
End;

function TPropertyValueSpecification.Get_valuePattern:String;
Begin
   result:=FvaluePattern;
End;

procedure TPropertyValueSpecification.Set_valuePattern(v:String);
Begin
  FvaluePattern:=v;
End;

function TPropertyValueSpecification.Get_valueRequired:Boolean;
Begin
   result:=FvalueRequired;
End;

procedure TPropertyValueSpecification.Set_valueRequired(v:Boolean);
Begin
  FvalueRequired:=v;
End;

function TPropertyValueSpecification.Get_valueName:String;
Begin
   result:=FvalueName;
End;

procedure TPropertyValueSpecification.Set_valueName(v:String);
Begin
  FvalueName:=v;
End;

function TPropertyValueSpecification.Get_stepValue:INumber;
Begin
   result:=FstepValue;
End;

procedure TPropertyValueSpecification.Set_stepValue(v:INumber);
Begin
  FstepValue:=v;
End;



{*** TMobileApplication ***}

function TMobileApplication.Get_carrierRequirements:String;
Begin
   result:=FcarrierRequirements;
End;

procedure TMobileApplication.Set_carrierRequirements(v:String);
Begin
  FcarrierRequirements:=v;
End;



{*** TReceiveAction ***}

function TReceiveAction.Get_sender:IOrganization;
Begin
   result:=Fsender;
End;

procedure TReceiveAction.Set_sender(v:IOrganization);
Begin
  Fsender:=v;
End;



{*** TMedicalTrial ***}

function TMedicalTrial.Get_trialDesign:IMedicalTrialDesign;
Begin
   result:=FtrialDesign;
End;

procedure TMedicalTrial.Set_trialDesign(v:IMedicalTrialDesign);
Begin
  FtrialDesign:=v;
End;

function TMedicalTrial.Get_phase:String;
Begin
   result:=Fphase;
End;

procedure TMedicalTrial.Set_phase(v:String);
Begin
  Fphase:=v;
End;



{*** TMedicalTrialDesign ***}

  function TMedicalTrialDesign.TangMedicalTrialDesign:TangibleValue;
Begin
  result:=''
End;



{*** TNutritionInformation ***}

function TNutritionInformation.Get_proteinContent:IMass;
Begin
   result:=FproteinContent;
End;

procedure TNutritionInformation.Set_proteinContent(v:IMass);
Begin
  FproteinContent:=v;
End;

function TNutritionInformation.Get_fatContent:IMass;
Begin
   result:=FfatContent;
End;

procedure TNutritionInformation.Set_fatContent(v:IMass);
Begin
  FfatContent:=v;
End;

function TNutritionInformation.Get_transFatContent:IMass;
Begin
   result:=FtransFatContent;
End;

procedure TNutritionInformation.Set_transFatContent(v:IMass);
Begin
  FtransFatContent:=v;
End;

function TNutritionInformation.Get_calories:IEnergy;
Begin
   result:=Fcalories;
End;

procedure TNutritionInformation.Set_calories(v:IEnergy);
Begin
  Fcalories:=v;
End;

function TNutritionInformation.Get_carbohydrateContent:IMass;
Begin
   result:=FcarbohydrateContent;
End;

procedure TNutritionInformation.Set_carbohydrateContent(v:IMass);
Begin
  FcarbohydrateContent:=v;
End;

function TNutritionInformation.Get_sodiumContent:IMass;
Begin
   result:=FsodiumContent;
End;

procedure TNutritionInformation.Set_sodiumContent(v:IMass);
Begin
  FsodiumContent:=v;
End;

function TNutritionInformation.Get_cholesterolContent:IMass;
Begin
   result:=FcholesterolContent;
End;

procedure TNutritionInformation.Set_cholesterolContent(v:IMass);
Begin
  FcholesterolContent:=v;
End;

function TNutritionInformation.Get_servingSize:String;
Begin
   result:=FservingSize;
End;

procedure TNutritionInformation.Set_servingSize(v:String);
Begin
  FservingSize:=v;
End;

function TNutritionInformation.Get_fiberContent:IMass;
Begin
   result:=FfiberContent;
End;

procedure TNutritionInformation.Set_fiberContent(v:IMass);
Begin
  FfiberContent:=v;
End;

function TNutritionInformation.Get_saturatedFatContent:IMass;
Begin
   result:=FsaturatedFatContent;
End;

procedure TNutritionInformation.Set_saturatedFatContent(v:IMass);
Begin
  FsaturatedFatContent:=v;
End;

function TNutritionInformation.Get_sugarContent:IMass;
Begin
   result:=FsugarContent;
End;

procedure TNutritionInformation.Set_sugarContent(v:IMass);
Begin
  FsugarContent:=v;
End;

function TNutritionInformation.Get_unsaturatedFatContent:IMass;
Begin
   result:=FunsaturatedFatContent;
End;

procedure TNutritionInformation.Set_unsaturatedFatContent(v:IMass);
Begin
  FunsaturatedFatContent:=v;
End;



{*** TMass ***}

  function TMass.TangMass:TangibleValue;
Begin
  result:=''
End;



{*** TPerformanceRole ***}

function TPerformanceRole.Get_characterName:String;
Begin
   result:=FcharacterName;
End;

procedure TPerformanceRole.Set_characterName(v:String);
Begin
  FcharacterName:=v;
End;



{*** TLymphaticVessel ***}

function TLymphaticVessel.Get_originatesFrom:IVessel;
Begin
   result:=ForiginatesFrom;
End;

procedure TLymphaticVessel.Set_originatesFrom(v:IVessel);
Begin
  ForiginatesFrom:=v;
End;

function TLymphaticVessel.Get_runsTo:IVessel;
Begin
   result:=FrunsTo;
End;

procedure TLymphaticVessel.Set_runsTo(v:IVessel);
Begin
  FrunsTo:=v;
End;



{*** TPatient ***}

  function TPatient.TangPatient:TangibleValue;
Begin
  result:=''
End;



{*** TEnumerationValue ***}

function TEnumerationValue.Get_partOfEnumerationValueSet:String;
Begin
   result:=FpartOfEnumerationValueSet;
End;

procedure TEnumerationValue.Set_partOfEnumerationValueSet(v:String);
Begin
  FpartOfEnumerationValueSet:=v;
End;

function TEnumerationValue.Get_enumerationValueCode:String;
Begin
   result:=FenumerationValueCode;
End;

procedure TEnumerationValue.Set_enumerationValueCode(v:String);
Begin
  FenumerationValueCode:=v;
End;



{*** TGeoCircle ***}

function TGeoCircle.Get_geoRadius:IDistance;
Begin
   result:=FgeoRadius;
End;

procedure TGeoCircle.Set_geoRadius(v:IDistance);
Begin
  FgeoRadius:=v;
End;

function TGeoCircle.Get_geoMidpoint:IGeoCoordinates;
Begin
   result:=FgeoMidpoint;
End;

procedure TGeoCircle.Set_geoMidpoint(v:IGeoCoordinates);
Begin
  FgeoMidpoint:=v;
End;



{*** TGeoCoordinates ***}

function TGeoCoordinates.Get_latitude:INumber;
Begin
   result:=Flatitude;
End;

procedure TGeoCoordinates.Set_latitude(v:INumber);
Begin
  Flatitude:=v;
End;

function TGeoCoordinates.Get_longitude:INumber;
Begin
   result:=Flongitude;
End;

procedure TGeoCoordinates.Set_longitude(v:INumber);
Begin
  Flongitude:=v;
End;

function TGeoCoordinates.Get_postalCode:String;
Begin
   result:=FpostalCode;
End;

procedure TGeoCoordinates.Set_postalCode(v:String);
Begin
  FpostalCode:=v;
End;



{*** TEducationalAudience ***}

function TEducationalAudience.Get_educationalRole:String;
Begin
   result:=FeducationalRole;
End;

procedure TEducationalAudience.Set_educationalRole(v:String);
Begin
  FeducationalRole:=v;
End;



{*** TChooseAction ***}

function TChooseAction.Get_option:IThing;
Begin
   result:=Foption;
End;

procedure TChooseAction.Set_option(v:IThing);
Begin
  Foption:=v;
End;



{*** TVoteAction ***}

function TVoteAction.Get_candidate:IPerson;
Begin
   result:=Fcandidate;
End;

procedure TVoteAction.Set_candidate(v:IPerson);
Begin
  Fcandidate:=v;
End;



{*** TLinkRole ***}

function TLinkRole.Get_linkRelationship:String;
Begin
   result:=FlinkRelationship;
End;

procedure TLinkRole.Set_linkRelationship(v:String);
Begin
  FlinkRelationship:=v;
End;



{*** TLoanOrCredit ***}

function TLoanOrCredit.Get_loanTerm:IQuantitativeValue;
Begin
   result:=FloanTerm;
End;

procedure TLoanOrCredit.Set_loanTerm(v:IQuantitativeValue);
Begin
  FloanTerm:=v;
End;

function TLoanOrCredit.Get_requiredCollateral:String;
Begin
   result:=FrequiredCollateral;
End;

procedure TLoanOrCredit.Set_requiredCollateral(v:String);
Begin
  FrequiredCollateral:=v;
End;

function TLoanOrCredit.Get_amount:IMonetaryAmount;
Begin
   result:=Famount;
End;

procedure TLoanOrCredit.Set_amount(v:IMonetaryAmount);
Begin
  Famount:=v;
End;



{*** TMedicalImagingTechnique ***}

  function TMedicalImagingTechnique.TangMedicalImagingTechnique:TangibleValue;
Begin
  result:=''
End;



{*** TBusOrCoach ***}

function TBusOrCoach.Get_acrissCode:String;
Begin
   result:=FacrissCode;
End;

procedure TBusOrCoach.Set_acrissCode(v:String);
Begin
  FacrissCode:=v;
End;



{*** TBroadcastFrequencySpecification ***}

function TBroadcastFrequencySpecification.Get_broadcastFrequencyValue:IQuantitativeValue;
Begin
   result:=FbroadcastFrequencyValue;
End;

procedure TBroadcastFrequencySpecification.Set_broadcastFrequencyValue(v:IQuantitativeValue);
Begin
  FbroadcastFrequencyValue:=v;
End;



{*** TImagingTest ***}

function TImagingTest.Get_imagingTechnique:IMedicalImagingTechnique;
Begin
   result:=FimagingTechnique;
End;

procedure TImagingTest.Set_imagingTechnique(v:IMedicalImagingTechnique);
Begin
  FimagingTechnique:=v;
End;



{*** TInfectiousDisease ***}

function TInfectiousDisease.Get_infectiousAgentClass:IInfectiousAgentClass;
Begin
   result:=FinfectiousAgentClass;
End;

procedure TInfectiousDisease.Set_infectiousAgentClass(v:IInfectiousAgentClass);
Begin
  FinfectiousAgentClass:=v;
End;

function TInfectiousDisease.Get_transmissionMethod:String;
Begin
   result:=FtransmissionMethod;
End;

procedure TInfectiousDisease.Set_transmissionMethod(v:String);
Begin
  FtransmissionMethod:=v;
End;

function TInfectiousDisease.Get_infectiousAgent:String;
Begin
   result:=FinfectiousAgent;
End;

procedure TInfectiousDisease.Set_infectiousAgent(v:String);
Begin
  FinfectiousAgent:=v;
End;



{*** TMusicRelease ***}

function TMusicRelease.Get_creditedTo:IOrganization;
Begin
   result:=FcreditedTo;
End;

procedure TMusicRelease.Set_creditedTo(v:IOrganization);
Begin
  FcreditedTo:=v;
End;

function TMusicRelease.Get_musicReleaseFormat:IMusicReleaseFormatType;
Begin
   result:=FmusicReleaseFormat;
End;

procedure TMusicRelease.Set_musicReleaseFormat(v:IMusicReleaseFormatType);
Begin
  FmusicReleaseFormat:=v;
End;

function TMusicRelease.Get_recordLabel:IOrganization;
Begin
   result:=FrecordLabel;
End;

procedure TMusicRelease.Set_recordLabel(v:IOrganization);
Begin
  FrecordLabel:=v;
End;

function TMusicRelease.Get_catalogNumber:String;
Begin
   result:=FcatalogNumber;
End;

procedure TMusicRelease.Set_catalogNumber(v:String);
Begin
  FcatalogNumber:=v;
End;

function TMusicRelease.Get_releaseOf:IMusicAlbum;
Begin
   result:=FreleaseOf;
End;

procedure TMusicRelease.Set_releaseOf(v:IMusicAlbum);
Begin
  FreleaseOf:=v;
End;



{*** TFoodEstablishmentReservation ***}

function TFoodEstablishmentReservation.Get_startTime:TDateTime;
Begin
   result:=FstartTime;
End;

procedure TFoodEstablishmentReservation.Set_startTime(v:TDateTime);
Begin
  FstartTime:=v;
End;

function TFoodEstablishmentReservation.Get_endTime:TDateTime;
Begin
   result:=FendTime;
End;

procedure TFoodEstablishmentReservation.Set_endTime(v:TDateTime);
Begin
  FendTime:=v;
End;



{*** THotelRoom ***}

function THotelRoom.Get_bed:IBedType;
Begin
   result:=Fbed;
End;

procedure THotelRoom.Set_bed(v:IBedType);
Begin
  Fbed:=v;
End;

function THotelRoom.Get_occupancy:IQuantitativeValue;
Begin
   result:=Foccupancy;
End;

procedure THotelRoom.Set_occupancy(v:IQuantitativeValue);
Begin
  Foccupancy:=v;
End;



{*** TInteractionCounter ***}

function TInteractionCounter.Get_interactionService:ISoftwareApplication;
Begin
   result:=FinteractionService;
End;

procedure TInteractionCounter.Set_interactionService(v:ISoftwareApplication);
Begin
  FinteractionService:=v;
End;

function TInteractionCounter.Get_interactionType:IAction;
Begin
   result:=FinteractionType;
End;

procedure TInteractionCounter.Set_interactionType(v:IAction);
Begin
  FinteractionType:=v;
End;

function TInteractionCounter.Get_userInteractionCount:Integer;
Begin
   result:=FuserInteractionCount;
End;

procedure TInteractionCounter.Set_userInteractionCount(v:Integer);
Begin
  FuserInteractionCount:=v;
End;



{*** TRecipe ***}

function TRecipe.Get_recipeInstructions:IItemList;
Begin
   result:=FrecipeInstructions;
End;

procedure TRecipe.Set_recipeInstructions(v:IItemList);
Begin
  FrecipeInstructions:=v;
End;

function TRecipe.Get_recipeYield:String;
Begin
   result:=FrecipeYield;
End;

procedure TRecipe.Set_recipeYield(v:String);
Begin
  FrecipeYield:=v;
End;

function TRecipe.Get_recipeCuisine:String;
Begin
   result:=FrecipeCuisine;
End;

procedure TRecipe.Set_recipeCuisine(v:String);
Begin
  FrecipeCuisine:=v;
End;

function TRecipe.Get_nutrition:INutritionInformation;
Begin
   result:=Fnutrition;
End;

procedure TRecipe.Set_nutrition(v:INutritionInformation);
Begin
  Fnutrition:=v;
End;

function TRecipe.Get_suitableForDiet:IRestrictedDiet;
Begin
   result:=FsuitableForDiet;
End;

procedure TRecipe.Set_suitableForDiet(v:IRestrictedDiet);
Begin
  FsuitableForDiet:=v;
End;

function TRecipe.Get_ingredients:String;
Begin
   result:=Fingredients;
End;

procedure TRecipe.Set_ingredients(v:String);
Begin
  Fingredients:=v;
End;

function TRecipe.Get_cookingMethod:String;
Begin
   result:=FcookingMethod;
End;

procedure TRecipe.Set_cookingMethod(v:String);
Begin
  FcookingMethod:=v;
End;

function TRecipe.Get_recipeCategory:String;
Begin
   result:=FrecipeCategory;
End;

procedure TRecipe.Set_recipeCategory(v:String);
Begin
  FrecipeCategory:=v;
End;

function TRecipe.Get_totalTime:IDuration;
Begin
   result:=FtotalTime;
End;

procedure TRecipe.Set_totalTime(v:IDuration);
Begin
  FtotalTime:=v;
End;

function TRecipe.Get_cookTime:IDuration;
Begin
   result:=FcookTime;
End;

procedure TRecipe.Set_cookTime(v:IDuration);
Begin
  FcookTime:=v;
End;

function TRecipe.Get_prepTime:IDuration;
Begin
   result:=FprepTime;
End;

procedure TRecipe.Set_prepTime(v:IDuration);
Begin
  FprepTime:=v;
End;



{*** TReviewAction ***}

function TReviewAction.Get_resultReview:IReview;
Begin
   result:=FresultReview;
End;

procedure TReviewAction.Set_resultReview(v:IReview);
Begin
  FresultReview:=v;
End;



{*** TWinAction ***}

function TWinAction.Get_loser:IPerson;
Begin
   result:=Floser;
End;

procedure TWinAction.Set_loser(v:IPerson);
Begin
  Floser:=v;
End;



{*** TMedicalScholarlyArticle ***}

function TMedicalScholarlyArticle.Get_publicationType:String;
Begin
   result:=FpublicationType;
End;

procedure TMedicalScholarlyArticle.Set_publicationType(v:String);
Begin
  FpublicationType:=v;
End;



{*** TBlog ***}

function TBlog.Get_blogPosts:IBlogPosting;
Begin
   result:=FblogPosts;
End;

procedure TBlog.Set_blogPosts(v:IBlogPosting);
Begin
  FblogPosts:=v;
End;



{*** TCookAction ***}

function TCookAction.Get_recipe:IRecipe;
Begin
   result:=Frecipe;
End;

procedure TCookAction.Set_recipe(v:IRecipe);
Begin
  Frecipe:=v;
End;

function TCookAction.Get_foodEstablishment:IFoodEstablishment;
Begin
   result:=FfoodEstablishment;
End;

procedure TCookAction.Set_foodEstablishment(v:IFoodEstablishment);
Begin
  FfoodEstablishment:=v;
End;

function TCookAction.Get_foodEvent:IFoodEvent;
Begin
   result:=FfoodEvent;
End;

procedure TCookAction.Set_foodEvent(v:IFoodEvent);
Begin
  FfoodEvent:=v;
End;



{*** TPathologyTest ***}

function TPathologyTest.Get_tissueSample:String;
Begin
   result:=FtissueSample;
End;

procedure TPathologyTest.Set_tissueSample(v:String);
Begin
  FtissueSample:=v;
End;



{*** TReservationPackage ***}

function TReservationPackage.Get_subReservation:IReservation;
Begin
   result:=FsubReservation;
End;

procedure TReservationPackage.Set_subReservation(v:IReservation);
Begin
  FsubReservation:=v;
End;



{*** TUserComments ***}

function TUserComments.Get_creator:IPerson;
Begin
   result:=Fcreator;
End;

procedure TUserComments.Set_creator(v:IPerson);
Begin
  Fcreator:=v;
End;

function TUserComments.Get_discusses:ICreativeWork;
Begin
   result:=Fdiscusses;
End;

procedure TUserComments.Set_discusses(v:ICreativeWork);
Begin
  Fdiscusses:=v;
End;

function TUserComments.Get_commentText:String;
Begin
   result:=FcommentText;
End;

procedure TUserComments.Set_commentText(v:String);
Begin
  FcommentText:=v;
End;

function TUserComments.Get_replyToUrl:String;
Begin
   result:=FreplyToUrl;
End;

procedure TUserComments.Set_replyToUrl(v:String);
Begin
  FreplyToUrl:=v;
End;

function TUserComments.Get_commentTime:TDateTime;
Begin
   result:=FcommentTime;
End;

procedure TUserComments.Set_commentTime(v:TDateTime);
Begin
  FcommentTime:=v;
End;



{*** TBusTrip ***}

function TBusTrip.Get_arrivalBusStop:IBusStation;
Begin
   result:=FarrivalBusStop;
End;

procedure TBusTrip.Set_arrivalBusStop(v:IBusStation);
Begin
  FarrivalBusStop:=v;
End;

function TBusTrip.Get_busName:String;
Begin
   result:=FbusName;
End;

procedure TBusTrip.Set_busName(v:String);
Begin
  FbusName:=v;
End;

function TBusTrip.Get_busNumber:String;
Begin
   result:=FbusNumber;
End;

procedure TBusTrip.Set_busNumber(v:String);
Begin
  FbusNumber:=v;
End;

function TBusTrip.Get_departureBusStop:IBusStop;
Begin
   result:=FdepartureBusStop;
End;

procedure TBusTrip.Set_departureBusStop(v:IBusStop);
Begin
  FdepartureBusStop:=v;
End;



{*** TGenderType ***}

  function TGenderType.TangGenderType:TangibleValue;
Begin
  result:=''
End;



{*** TAskAction ***}

function TAskAction.Get_question:IQuestion;
Begin
   result:=Fquestion;
End;

procedure TAskAction.Set_question(v:IQuestion);
Begin
  Fquestion:=v;
End;



{*** TPayAction ***}

function TPayAction.Get_recipient:IPerson;
Begin
   result:=Frecipient;
End;

procedure TPayAction.Set_recipient(v:IPerson);
Begin
  Frecipient:=v;
End;



{*** TVideoGameSeries ***}

function TVideoGameSeries.Get_numberOfPlayers:IQuantitativeValue;
Begin
   result:=FnumberOfPlayers;
End;

procedure TVideoGameSeries.Set_numberOfPlayers(v:IQuantitativeValue);
Begin
  FnumberOfPlayers:=v;
End;

function TVideoGameSeries.Get_gameLocation:String;
Begin
   result:=FgameLocation;
End;

procedure TVideoGameSeries.Set_gameLocation(v:String);
Begin
  FgameLocation:=v;
End;

function TVideoGameSeries.Get_actors:IPerson;
Begin
   result:=Factors;
End;

procedure TVideoGameSeries.Set_actors(v:IPerson);
Begin
  Factors:=v;
End;

function TVideoGameSeries.Get_quest:IThing;
Begin
   result:=Fquest;
End;

procedure TVideoGameSeries.Set_quest(v:IThing);
Begin
  Fquest:=v;
End;

function TVideoGameSeries.Get_numberOfSeasons:Integer;
Begin
   result:=FnumberOfSeasons;
End;

procedure TVideoGameSeries.Set_numberOfSeasons(v:Integer);
Begin
  FnumberOfSeasons:=v;
End;

function TVideoGameSeries.Get_gamePlatform:String;
Begin
   result:=FgamePlatform;
End;

procedure TVideoGameSeries.Set_gamePlatform(v:String);
Begin
  FgamePlatform:=v;
End;

function TVideoGameSeries.Get_gameItem:IThing;
Begin
   result:=FgameItem;
End;

procedure TVideoGameSeries.Set_gameItem(v:IThing);
Begin
  FgameItem:=v;
End;

function TVideoGameSeries.Get_numberOfEpisodes:Integer;
Begin
   result:=FnumberOfEpisodes;
End;

procedure TVideoGameSeries.Set_numberOfEpisodes(v:Integer);
Begin
  FnumberOfEpisodes:=v;
End;

function TVideoGameSeries.Get_playMode:IGamePlayMode;
Begin
   result:=FplayMode;
End;

procedure TVideoGameSeries.Set_playMode(v:IGamePlayMode);
Begin
  FplayMode:=v;
End;



{*** TVideoGame ***}

function TVideoGame.Get_cheatCode:ICreativeWork;
Begin
   result:=FcheatCode;
End;

procedure TVideoGame.Set_cheatCode(v:ICreativeWork);
Begin
  FcheatCode:=v;
End;

function TVideoGame.Get_gameTip:ICreativeWork;
Begin
   result:=FgameTip;
End;

procedure TVideoGame.Set_gameTip(v:ICreativeWork);
Begin
  FgameTip:=v;
End;

function TVideoGame.Get_gameServer:IGameServer;
Begin
   result:=FgameServer;
End;

procedure TVideoGame.Set_gameServer(v:IGameServer);
Begin
  FgameServer:=v;
End;



{*** TMovieTheater ***}

function TMovieTheater.Get_screenCount:INumber;
Begin
   result:=FscreenCount;
End;

procedure TMovieTheater.Set_screenCount(v:INumber);
Begin
  FscreenCount:=v;
End;



{*** TTaxiService ***}

  function TTaxiService.TangTaxiService:TangibleValue;
Begin
  result:=''
End;



{*** TLodgingReservation ***}

function TLodgingReservation.Get_numChildren:IQuantitativeValue;
Begin
   result:=FnumChildren;
End;

procedure TLodgingReservation.Set_numChildren(v:IQuantitativeValue);
Begin
  FnumChildren:=v;
End;

function TLodgingReservation.Get_numAdults:Integer;
Begin
   result:=FnumAdults;
End;

procedure TLodgingReservation.Set_numAdults(v:Integer);
Begin
  FnumAdults:=v;
End;

function TLodgingReservation.Get_lodgingUnitDescription:String;
Begin
   result:=FlodgingUnitDescription;
End;

procedure TLodgingReservation.Set_lodgingUnitDescription(v:String);
Begin
  FlodgingUnitDescription:=v;
End;

function TLodgingReservation.Get_lodgingUnitType:String;
Begin
   result:=FlodgingUnitType;
End;

procedure TLodgingReservation.Set_lodgingUnitType(v:String);
Begin
  FlodgingUnitType:=v;
End;



{*** TCommentAction ***}

function TCommentAction.Get_resultComment:IComment;
Begin
   result:=FresultComment;
End;

procedure TCommentAction.Set_resultComment(v:IComment);
Begin
  FresultComment:=v;
End;



{*** TSuperficialAnatomy ***}

function TSuperficialAnatomy.Get_significance:String;
Begin
   result:=Fsignificance;
End;

procedure TSuperficialAnatomy.Set_significance(v:String);
Begin
  Fsignificance:=v;
End;

function TSuperficialAnatomy.Get_relatedAnatomy:IAnatomicalSystem;
Begin
   result:=FrelatedAnatomy;
End;

procedure TSuperficialAnatomy.Set_relatedAnatomy(v:IAnatomicalSystem);
Begin
  FrelatedAnatomy:=v;
End;



{*** TComicIssue ***}

function TComicIssue.Get_penciler:IPerson;
Begin
   result:=Fpenciler;
End;

procedure TComicIssue.Set_penciler(v:IPerson);
Begin
  Fpenciler:=v;
End;

function TComicIssue.Get_inker:IPerson;
Begin
   result:=Finker;
End;

procedure TComicIssue.Set_inker(v:IPerson);
Begin
  Finker:=v;
End;

function TComicIssue.Get_variantCover:String;
Begin
   result:=FvariantCover;
End;

procedure TComicIssue.Set_variantCover(v:String);
Begin
  FvariantCover:=v;
End;





end.

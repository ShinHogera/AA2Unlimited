#include "StdAfx.h"




namespace {
	const char* param_string;
	int param_maxDepth;
	int depth;
	ExtClass::Frame* FindBone(ExtClass::Frame* toSearch) {
		if(strcmp(toSearch->m_name, param_string) == 0) {
			depth--;
			return toSearch; //found it
		}
		else if(param_maxDepth < 0 || depth <= param_maxDepth) {
			//search children
			for(int i = 0; i < toSearch->m_nChildren; i++) {
				depth++;
				ExtClass::Frame* ret = ::FindBone(&toSearch->m_children[i]);
				if(ret != NULL) {
					//found it
					depth--;
					return ret;
				}
			}
			depth--;
			return NULL; //didnt find
		}
		else {
			depth--;
			return NULL;
		}
	}
}

ExtClass::Frame* ExtClass::XXFile::FindBone(const char* name,int maxDepth) {
	param_string = name;
	param_maxDepth = maxDepth;
	depth = 0;
	return ::FindBone(m_root);
}

ExtClass::Material* ExtClass::XXFile::FindMaterial(const char* name) {
	size_t nameLength = strlen(name) + 1;
	for (size_t i = 0; i < m_materialCount; i++) {
		if (nameLength == m_materialArray[i].m_nameLength && strcmp(name, m_materialArray[i].m_name) == 0) {
			return &m_materialArray[i];
		}
	}
	return nullptr;
}
